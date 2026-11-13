// Copyright (c) 2026 Proton Technologies AG
// This file is part of Proton Technologies AG and Proton Payment.
//
// Proton Payment is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Proton Payment is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Proton Payment. If not, see <https://www.gnu.org/licenses/>.

import StoreKit

/// The only supported product types are subscriptions.
private let supportedProductTypes: Set<StoreKit.Product.ProductType> = [.autoRenewable]

/// A billing repository backed by the App Store.
final class AppStoreBillingRepository: BillingRepository {
    // MARK: - Properties

    private let purchaseUpdatesTask: Task<Void, Never>
    private let purchaseUpdatesEmitter: AsyncStream<StorePurchaseUpdate>.Continuation
    let purchaseUpdates: AsyncStream<StorePurchaseUpdate>

    // MARK: - Initializer

    /// Creates a repository and starts observing App Store transaction updates.
    init() {
        let (updates, emitter) = AsyncStream.makeStream(of: StorePurchaseUpdate.self)
        self.purchaseUpdates = updates
        self.purchaseUpdatesEmitter = emitter

        self.purchaseUpdatesTask = Task.detached { [purchaseUpdatesEmitter] in
            for await update in Transaction.updates {
                await update.handle { purchaseUpdatesEmitter.yield($0) }
            }
        }
    }

    // MARK: - Products

    func products(for storeProductIDs: [String]) async throws -> [StoreProduct] {
        let products = try await StoreKit.Product.products(for: storeProductIDs)
            .filter { product in
                supportedProductTypes.contains(product.type)
            }

        let introOfferEligibility = await products.introOfferEligibility()

        return zip(products, introOfferEligibility)
            .compactMap { product, introOfferEligible in
                StoreProduct(from: product, introOfferEligible: introOfferEligible)
            }
    }

    // MARK: - Purchase

    func surfaceUnfinished() async {
        for await result in Transaction.unfinished {
            await result.handle { purchaseUpdatesEmitter.yield($0) }
        }
    }

    func purchase(productID: String, userID: String?, offer: StorePurchaseOffer) async throws -> StorePurchaseUpdate {
        let storeProducts = try await StoreKit.Product.products(for: [productID])

        guard let storeProduct = storeProducts.first else {
            return .failure(.productNotFound(productID))
        }

        guard let purchaseOptions = storeProduct.purchaseOptions(for: userID, with: offer) else {
            return .failure(.offerUnavailable(offer))
        }

        let result = try await storeProduct.purchase(options: purchaseOptions)
        switch result {
        case .success(let verification):
            return try await purchaseUpdate(from: verification, requestedProduct: storeProduct)
        case .userCancelled:
            return .canceled
        case .pending:
            return .pending
        @unknown default:
            return .failure(.unknownPurchaseResult)
        }
    }

    private func purchaseUpdate(
        from verification: VerificationResult<Transaction>,
        requestedProduct product: StoreKit.Product,
    ) async throws -> StorePurchaseUpdate {
        guard case .verified(let transaction) = verification else {
            return .failure(.unverifiedTransaction)
        }

        let purchase = StorePurchase(from: transaction, withRawData: verification.jwsRepresentation)
        guard transaction.productID != product.id else {
            return .success(purchase)
        }

        guard transaction.productType == .autoRenewable,
            transaction.expirationDate != nil, transaction.isActive,
            let requested = product.subscription.flatMap(StoreSubscription.init(from:))
        else {
            return .failure(.unexpectedProduct)
        }

        let products = try await StoreKit.Product.products(for: [transaction.productID])
        guard
            let current = products.first(where: { $0.id == transaction.productID })?
                .subscription.flatMap(StoreSubscription.init(from:))
        else {
            return .failure(.unexpectedProduct)
        }

        return current.changesAtRenewal(to: requested)
            ? .modificationScheduled : .failure(.unexpectedProduct)
    }

    // MARK: Acknowledge

    func acknowledge(transactionID: UInt64) async throws {
        for await result in Transaction.unfinished {
            if case .verified(let transaction) = result, transaction.id == transactionID {
                await transaction.finish()
                return
            }
        }
    }

    // MARK: - Deinit

    deinit {
        purchaseUpdatesTask.cancel()
    }
}

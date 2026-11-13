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

import PaymentCore

/// Bridges the store's billing operations and the core's store interface.
final class StoreCapability: CoreStoreCapability {
    // MARK: - Properties

    private let billingRepository: any BillingRepository

    // MARK: - Initializer

    /// Creates a store capability backed by a billing repository.
    ///
    /// - Parameter billingRepository: The repository that performs the store operations.
    init(billingRepository: any BillingRepository) {
        self.billingRepository = billingRepository
    }

    // MARK: - Events

    /// Returns store products from the implemented store on behalf of the core.
    ///
    /// - Parameter ids: The known product identifiers to fetch details for.
    /// - Returns: The products, converted for the core.
    /// - Throws: The error thrown by the billing repository if the products cannot be fetched.
    func getProducts(ids: [CoreProductID]) async throws -> [CoreStoreProduct] {
        try await CoreStoreError.mapErrors(to: CoreStoreError.FetchProducts) {
            try await billingRepository.products(for: ids).map(CoreStoreProduct.init)
        }
    }

    /// Launches the purchase flow for a user-selected product on behalf of the core.
    ///
    /// - Parameter arguments: The product, user, and offer to purchase.
    /// - Returns: The status of the purchase flow.
    /// - Throws: `CoreStoreError` if the purchase failed, or the error thrown by the billing repository if the
    ///   purchase flow cannot be launched.
    func purchase(arguments: CorePurchaseArguments) async throws -> CoreStoreStatus {
        let result = try await CoreStoreError.mapErrors(to: CoreStoreError.Purchase) {
            try await billingRepository.purchase(
                productID: arguments.productId,
                userID: arguments.userId,
                offer: StorePurchaseOffer(from: arguments.offer),
            )
        }

        return try CoreStoreStatus(from: result)
    }

    /// Requests acknowledgement for a completed purchase on behalf of the core.
    ///
    /// This takes place after the purchase confirmation procedure has completed, and can be considered the final step
    /// in the purchase flow.
    ///
    /// - Parameter orderId: The unique identifier of the purchase that is requesting acknowledgement.
    /// - Throws: The error thrown by the billing repository if the transaction cannot be finished.
    func acknowledge(orderId: UInt64) async throws {
        try await CoreStoreError.mapErrors(to: CoreStoreError.Acknowledgement) {
            try await billingRepository.acknowledge(transactionID: orderId)
        }
    }
}

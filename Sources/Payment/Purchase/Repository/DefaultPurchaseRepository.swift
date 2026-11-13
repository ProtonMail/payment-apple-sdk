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

/// The production purchase repository.
final class DefaultPurchaseRepository: PurchaseRepository {
    // MARK: - Properties

    private let paymentCore: any PaymentCoreProtocol
    private let bundleIdentifier: String?
    private let sessionStateStream: CoreSessionStateStream

    // MARK: - Initialization

    /// Creates a purchase repository backed by the given payment core.
    ///
    /// - Parameters:
    ///   - paymentCore: The core that runs purchase flows and reports session state.
    ///   - bundleIdentifier: The app's bundle identifier.
    init(paymentCore: any PaymentCoreProtocol, bundleIdentifier: String?) {
        self.paymentCore = paymentCore
        self.bundleIdentifier = bundleIdentifier
        self.sessionStateStream = paymentCore.stateReceiver()
    }

    // MARK: - Purchase Flow

    func purchase(productID: ProductID, offer: Offer) async throws(PaymentError) -> PurchasingTerminal {
        guard let bundleIdentifier else {
            throw PaymentError.configuration(code: .missingBundleIdentifier, cause: MissingBundleIdentifierError())
        }

        do {
            let result = try await paymentCore.purchase(
                purchaseRequest: CorePurchaseRequest(from: productID, offer: offer, bundleIdentifier: bundleIdentifier)
            )

            if case .readyToReconcile(let receipt) = result,
                let purchase = StorePurchase(from: receipt, productID: productID)
            {
                Task { [self] in
                    try? await reconcile(purchase)
                }
            }

            return PurchasingTerminal(from: result)
        } catch {
            throw PaymentError(from: error)
        }
    }

    func reconcile(_ purchase: StorePurchase) async throws(PaymentError) {
        do {
            _ = try await paymentCore.reconcilePurchaseFlow(transaction: CoreTransaction(from: purchase))
        } catch {
            throw PaymentError(from: error)
        }
    }

    func fail(_ error: StorePurchaseError) {
        paymentCore.failPurchaseFlow(error: CoreStoreError(from: error))
    }

    func cancel() {
        paymentCore.cancelPurchaseFlow()
    }

    // MARK: - Session State

    func nextSessionState() async -> SessionState {
        SessionState(from: await sessionStateStream.next())
    }

    // MARK: - Payment Availability

    func availability() async throws(PaymentError) -> PaymentAvailability {
        do {
            let result = try await paymentCore.getAvailability()
            return PaymentAvailability(from: result)
        } catch {
            throw PaymentError(from: error)
        }
    }
}

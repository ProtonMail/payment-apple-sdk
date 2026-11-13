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

/// Provides purchase-related operations.
public struct Purchase: Sendable {
    // MARK: - Properties

    private let billingRepository: any BillingRepository
    private let purchaseRepository: any PurchaseRepository
    private let sessionStateObserver: any SessionStateObserver

    // MARK: - Initialization

    /// Creates the purchase operations, backed by the given dependencies.
    ///
    /// - Parameters:
    ///   - billingRepository: The repository that communicates with the store.
    ///   - purchaseRepository: The repository that drives purchase flows through the core.
    ///   - sessionStateObserver: The observer that broadcasts purchase session state changes.
    init(
        billingRepository: any BillingRepository,
        purchaseRepository: any PurchaseRepository,
        sessionStateObserver: any SessionStateObserver,
    ) {
        self.billingRepository = billingRepository
        self.purchaseRepository = purchaseRepository
        self.sessionStateObserver = sessionStateObserver
    }

    // MARK: - Purchase Flow

    /// Initiates a purchase flow for the selected product, waiting until the purchasing phase reaches a terminal state.
    ///
    /// A ``PurchasingTerminal/modificationScheduled`` result completes the flow without reconciliation.
    /// The current subscription remains active until the scheduled change takes effect at renewal.
    ///
    /// A received receipt is handed off for background reconciliation before this method returns.
    /// Subscribe to ``Purchase/sessionStates()`` before initiating to observe reconciliation progress and its outcome.
    ///
    /// - Parameters:
    ///   - productID: The unique product identifier.
    ///   - offer: The selected product offer.
    /// - Returns: The purchasing phase's terminal state, without waiting for reconciliation to complete.
    /// - Throws: ``PaymentError`` if the purchase flow could not be carried out.
    public func initiate(productID: ProductID, offer: Offer) async throws(PaymentError) -> PurchasingTerminal {
        try await purchaseRepository.purchase(productID: productID, offer: offer)
    }

    // MARK: - Reconciliation

    /// Searches the store for outstanding purchases and reconciles them.
    ///
    /// Outstanding purchases are those that are complete but have not been reconciled with the current user's account.
    /// For example, when a credential-less user purchases a product and later signs into an account, the outstanding
    /// purchase needs to be reconciled against that account once it is available.
    ///
    /// - Note: This method returns once all outstanding purchases have been handed off for reconciliation; it does not
    ///   indicate that reconciliation has completed. Observe ``Purchase/sessionStates()`` for the actual outcome.
    public func reconcileOutstanding() async {
        await billingRepository.surfaceUnfinished()
    }

    // MARK: - Session State

    /// Returns a stream that emits the latest known session state, if available, followed by subsequent updates.
    ///
    /// - Returns: A stream of session state updates.
    public func sessionStates() async -> AsyncStream<SessionState> {
        await sessionStateObserver.observe()
    }

    // MARK: - Payment Availability

    /// Fetches the current status of whether payments are enabled.
    ///
    /// - Returns: The current payment availability.
    /// - Throws: ``PaymentError`` if the availability cannot be fetched.
    public func availability() async throws(PaymentError) -> PaymentAvailability {
        try await purchaseRepository.availability()
    }
}

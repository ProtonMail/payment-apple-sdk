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

/// Interfaces directly with the core to enact purchase operations.
protocol PurchaseRepository: Sendable {
    /// Starts a purchase through the core, waiting until the purchasing phase reaches a terminal state.
    ///
    /// - Parameters:
    ///   - productID: The unique product identifier.
    ///   - offer: The selected product offer.
    /// - Returns: The terminal state the purchase reached.
    /// - Throws: ``PaymentError`` if the purchase flow could not be carried out.
    func purchase(productID: ProductID, offer: Offer) async throws(PaymentError) -> PurchasingTerminal

    /// Sends a successful purchase to the core for reconciliation.
    ///
    /// The purchase is sent to the core so that the subscription can be consumed by the backend systems.
    ///
    /// - Parameter purchase: The successful, completed purchase to be resolved.
    /// - Throws: ``PaymentError`` if reconciliation fails.
    func reconcile(_ purchase: StorePurchase) async throws(PaymentError)

    /// Notifies the core that a purchase has failed.
    ///
    /// This indicates that a ``StorePurchaseUpdate/failure(_:)`` purchase update was received.
    ///
    /// - Parameter error: The cause for why the purchase failed.
    func fail(_ error: StorePurchaseError)

    /// Cancels the active purchase flow.
    func cancel()

    /// Gets the next state from the core session state stream.
    ///
    /// This is done by querying the next value from the core state receiver stream.
    ///
    /// - Returns: The next session state.
    func nextSessionState() async -> SessionState

    /// Fetches the current payment status from the core.
    ///
    /// - Returns: The current payment availability.
    /// - Throws: ``PaymentError`` if the availability cannot be fetched.
    func availability() async throws(PaymentError) -> PaymentAvailability
}

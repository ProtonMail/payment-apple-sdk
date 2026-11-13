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

/// The operations an implemented store must provide.
protocol BillingRepository: Sendable {
    /// The stream of purchase updates emitted by the implemented store.
    var purchaseUpdates: AsyncStream<StorePurchaseUpdate> { get }

    /// Fetches details for the given products from the implemented store.
    ///
    /// - Parameter productIDs: The identifiers of the products to fetch from the implemented store.
    /// - Returns: The products available for purchase.
    /// - Throws: An error if the products cannot be fetched.
    func products(for productIDs: [String]) async throws -> [StoreProduct]

    /// Launches the store in-app purchase flow for a product.
    ///
    /// - Parameters:
    ///   - productID: The identifier of the product that is being purchased.
    ///   - userID: The identifier of the purchasing user, or `nil` if credential-less.
    ///   - offer: The offer to redeem with the purchase.
    /// - Returns: An update describing the result of the purchase request.
    /// - Throws: An error if the purchase flow cannot be launched.
    func purchase(productID: String, userID: String?, offer: StorePurchaseOffer) async throws -> StorePurchaseUpdate

    /// Requests acknowledgement for the given transaction.
    ///
    /// - Parameter transactionID: The unique identifier of the transaction that is requesting acknowledgement.
    /// - Throws: An error if acknowledgement fails.
    func acknowledge(transactionID: UInt64) async throws

    /// Surfaces any unfinished transactions so they can be reconciled.
    func surfaceUnfinished() async
}

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

/// The main entry point to the SDK.
///
/// Creating an instance with ``initialize(httpCapability:)`` registers the provided capability and starts the SDK's
/// auto-started services. Create it once at app launch and hold it for the lifetime of the app.
public final class Payments: Sendable {
    // MARK: - Properties

    /// The product catalog operations.
    public let products: Products

    /// The purchase flow operations.
    public let purchase: Purchase

    /// The operations on the user's subscriptions.
    public let subscriptions: Subscriptions

    // MARK: - Initialization

    /// Creates an entry point from its groups of operations.
    ///
    /// - Parameters:
    ///   - products: The product catalog operations.
    ///   - purchase: The purchase flow operations.
    ///   - subscriptions: The operations on the user's subscriptions.
    init(products: Products, purchase: Purchase, subscriptions: Subscriptions) {
        self.products = products
        self.purchase = purchase
        self.subscriptions = subscriptions
    }
}

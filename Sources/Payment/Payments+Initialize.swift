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

extension Payments {
    /// Creates the main entry point to the SDK.
    ///
    /// Call this once and hold the returned instance for the lifetime of the app. Creating an instance registers the
    /// provided capability and starts the SDK's auto-started services.
    ///
    /// - Parameter httpCapability: The consumer ``HTTPCapability`` implementation.
    /// - Returns: A configured ``Payments`` instance.
    public static func initialize(httpCapability: any HTTPCapability) -> Payments {
        let container = PaymentContainer(httpCapability: httpCapability)

        return Payments(
            products: Products(productRepository: container.productRepository),
            purchase: Purchase(
                billingRepository: container.billingRepository,
                purchaseRepository: container.purchaseRepository,
                sessionStateObserver: container.sessionStateObserver,
            ),
            subscriptions: Subscriptions(subscriptionRepository: container.subscriptionRepository),
        )
    }
}

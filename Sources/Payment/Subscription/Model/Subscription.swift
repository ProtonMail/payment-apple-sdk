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

import Foundation

/// A single active subscription, representing a product that the user is currently subscribed to.
public struct Subscription: Identifiable, Equatable, Sendable {
    /// The unique subscription identifier.
    public let id: String?

    /// The internal plan identifier for the product.
    public let planID: PlanID?

    /// The display name of the product.
    public let localizedTitle: String

    /// The description of the product.
    public let localizedDescription: String

    /// The subscription billing cycle.
    public let cycle: BillingCycle?

    /// When the current subscription cycle began.
    public let periodStart: Date?

    /// When the current subscription cycle ends.
    public let periodEnd: Date?

    /// Whether the subscription is provided by web or mobile.
    public let provider: Provider?

    /// The entitlements the product grants.
    public let entitlements: [Entitlement]

    /// Whether the subscription will auto-renew.
    public let renew: RenewalState?

    /// The store product identifier.
    public let productID: ProductID?
}

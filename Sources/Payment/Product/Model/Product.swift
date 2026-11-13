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

/// A purchasable product, including its available offers.
public struct Product: Identifiable, Equatable, Sendable {
    /// The identifier of the product.
    public let id: ProductID

    /// The display name of the product.
    public let title: String

    /// The description of the product.
    public let description: String

    /// The list of non-discounted and discounted offers for the product.
    public let offers: [Offer]

    /// The entitlements the product grants when purchased.
    public let entitlements: [Entitlement]

    /// The internal plan identifier for the product.
    public let planID: PlanID?
}

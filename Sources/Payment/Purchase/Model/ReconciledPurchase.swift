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

/// Details of the purchase that has been successfully reconciled with the backend systems.
public struct ReconciledPurchase: Sendable, Equatable {
    /// The unique store transaction identifier.
    public let orderID: UInt64

    /// The internal plan identifier of the product.
    public let planID: PlanID

    /// The display name of the product.
    public let title: String

    /// The billing cycle of the product.
    public let cycle: BillingCycle?

    /// Creates the details of a reconciled purchase.
    ///
    /// - Parameters:
    ///   - orderID: The unique store transaction identifier.
    ///   - planID: The internal plan identifier of the product.
    ///   - title: The display name of the product.
    ///   - cycle: The billing cycle of the product.
    public init(orderID: UInt64, planID: PlanID, title: String, cycle: BillingCycle?) {
        self.orderID = orderID
        self.planID = planID
        self.title = title
        self.cycle = cycle
    }
}

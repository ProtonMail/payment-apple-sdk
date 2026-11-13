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

extension CorePurchasedProduct {
    package static let mock: CorePurchasedProduct = makeMock()

    package static let mocks: [CorePurchasedProduct] = [
        makeMock(title: "Product One Title"),
        makeMock(title: "Product Two Title"),
        makeMock(title: "Product Three Title"),
    ]

    package static func makeMock(
        title: String = "Product Title",
        amount: UInt64? = 1234,
        cycle: CoreBillingCycle? = CoreBillingCycle.month(UInt8(1)),
        currency: CoreCurrency = "CHF",
        planID: CorePlanID = "plan-id",
    ) -> CorePurchasedProduct {
        CorePurchasedProduct(
            title: title,
            cycle: cycle,
            planId: planID,
        )
    }
}

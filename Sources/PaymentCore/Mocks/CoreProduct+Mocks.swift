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

extension CoreProduct {
    package static let mock: CoreProduct = makeMock()

    package static let mocks: [CoreProduct] = [
        makeMock(id: "product-id-1"),
        makeMock(id: "product-id-2"),
        makeMock(id: "product-id-3"),
    ]

    package static func makeMock(
        id: CoreProductID = "product-id",
        planID: CorePlanID? = "plan-id",
        title: String = "Product Title",
        description: String = "Product description",
        offers: [CoreOffer] = CoreOffer.mocks,
        entitlements: [CoreEntitlement] = CoreEntitlement.mocks,
    ) -> CoreProduct {
        CoreProduct(
            id: id,
            planId: planID,
            title: title,
            description: description,
            offers: offers,
            entitlements: entitlements,
        )
    }
}

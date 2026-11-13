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

extension Product {
    package static let mock: Product = makeMock()

    package static let mocks: [Product] = [
        makeMock(id: "product-id-1"),
        makeMock(id: "product-id-2"),
        makeMock(id: "product-id-3"),
    ]

    package static func makeMock(
        id: ProductID = "product-id",
        title: String = "Product Title",
        description: String = "Product description",
        offers: [Offer] = Offer.mocks,
        entitlements: [Entitlement] = Entitlement.mocks,
        planID: PlanID? = "plan-id",
    ) -> Product {
        Product(
            id: id,
            title: title,
            description: description,
            offers: offers,
            entitlements: entitlements,
            planID: planID,
        )
    }
}

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

extension Subscription {
    package static let mock: Subscription = makeMock()

    package static let mocks: [Subscription] = [
        makeMock(id: "subscription-id-1"),
        makeMock(id: "subscription-id-2"),
        makeMock(id: "subscription-id-3"),
    ]

    package static func makeMock(
        id: String? = "subscription-id",
        planID: PlanID? = "plan-id",
        localizedTitle: String = "Subscription Title",
        localizedDescription: String = "Subscription description",
        cycle: BillingCycle? = BillingCycle.month(count: 1),
        periodStart: Date? = Date(timeIntervalSince1970: 0),
        periodEnd: Date? = Date(timeIntervalSince1970: 1),
        provider: Provider = Provider.web,
        entitlements: [Entitlement] = Entitlement.mocks,
        renew: RenewalState = RenewalState.disabled,
        productID: ProductID? = "product-id",
    ) -> Subscription {
        Subscription(
            id: id,
            planID: planID,
            localizedTitle: localizedTitle,
            localizedDescription: localizedDescription,
            cycle: cycle,
            periodStart: periodStart,
            periodEnd: periodEnd,
            provider: provider,
            entitlements: entitlements,
            renew: renew,
            productID: productID,
        )
    }
}

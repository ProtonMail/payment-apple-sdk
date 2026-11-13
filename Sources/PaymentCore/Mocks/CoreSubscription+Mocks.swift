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

extension CoreSubscription {
    package static let mock: CoreSubscription = makeMock()

    package static let mocks: [CoreSubscription] = [
        makeMock(id: "subscription-id-1"),
        makeMock(id: "subscription-id-2"),
        makeMock(id: "subscription-id-3"),
    ]

    package static func makeMock(
        id: String? = "subscription-id",
        planID: CorePlanID? = "plan-id",
        title: String = "Subscription Title",
        description: String = "Subscription description",
        cycle: CoreBillingCycle = CoreBillingCycle.month(1),
        periodStart: TimeInterval? = TimeInterval(0.0),
        periodEnd: TimeInterval? = TimeInterval(1.0),
        provider: CoreProvider? = CoreProvider.web,
        productId: CoreProductID? = "product-id",
        entitlements: [CoreEntitlement] = CoreEntitlement.mocks,
        renew: CoreRenewalState? = CoreRenewalState.disabled,
    ) -> CoreSubscription {
        CoreSubscription(
            id: id,
            planId: planID,
            title: title,
            description: description,
            cycle: cycle,
            periodStart: periodStart.map(UInt64.init),
            periodEnd: periodEnd.map(UInt64.init),
            provider: provider,
            productId: productId,
            entitlements: entitlements,
            renew: renew,
        )
    }
}

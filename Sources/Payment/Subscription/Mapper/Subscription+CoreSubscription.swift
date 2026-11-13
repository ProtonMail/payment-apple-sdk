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
import PaymentCore

extension Subscription {
    /// Creates a subscription from its core representation.
    ///
    /// - Parameter subscription: The core subscription to map.
    init(from subscription: CoreSubscription) {
        self.init(
            id: subscription.id,
            planID: subscription.planId,
            localizedTitle: subscription.title,
            localizedDescription: subscription.description,
            cycle: subscription.cycle.map(BillingCycle.init),
            periodStart: subscription.periodStart.map { period in
                Date(timeIntervalSince1970: TimeInterval(period))
            },
            periodEnd: subscription.periodEnd.map { period in
                Date(timeIntervalSince1970: TimeInterval(period))
            },
            provider: subscription.provider.map(Provider.init),
            entitlements: subscription.entitlements.map(Entitlement.init),
            renew: subscription.renew.map(RenewalState.init),
            productID: subscription.productId,
        )
    }
}

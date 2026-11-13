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

import PaymentCore

extension CorePricingPeriod {
    /// Creates a core pricing period from a store pricing period.
    ///
    /// The initializer fails if the period's price can't be represented as a core monetary value.
    ///
    /// - Parameter period: The store pricing period to map.
    init?(from period: StorePricingPeriod) {
        guard
            let coreMoney = CoreMoney(
                from: period.amount,
                currency: period.currency,
                displayPrice: period.displayPrice,
            )
        else {
            return nil
        }

        self.init(
            price: coreMoney,
            count: CoreBillingCount(from: period.cycleRecurrence),
            cycle: CoreBillingCycle(from: period.cycleDurationUnit, with: period.cycleDurationCount),
        )
    }
}

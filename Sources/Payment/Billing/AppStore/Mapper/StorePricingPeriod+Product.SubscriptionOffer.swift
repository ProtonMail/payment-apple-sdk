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

import StoreKit

extension StorePricingPeriod {
    /// Creates the pricing period of a store subscription offer.
    ///
    /// The initializer fails if the offer's period unit isn't recognized.
    ///
    /// - Parameters:
    ///   - offer: The store subscription offer whose price to map.
    ///   - currency: The ISO 4217 currency code of the offer's price.
    init?(from offer: StoreKit.Product.SubscriptionOffer, currency: String) {
        guard
            let cycleDurationUnit = StorePricingDuration(from: offer.period.unit)
        else {
            return nil
        }

        self.init(
            amount: offer.price,
            currency: currency,
            displayPrice: offer.displayPrice,
            cycleRecurrence: offer.periodCount,
            cycleDurationUnit: cycleDurationUnit,
            cycleDurationCount: offer.period.value,
        )
    }
}

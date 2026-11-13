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
    /// Creates the base pricing period of a store subscription product.
    ///
    /// The initializer fails if the subscription's period unit isn't recognized.
    ///
    /// - Parameters:
    ///   - product: The store product whose price to map.
    ///   - subscription: The subscription details of `product`.
    init?(from product: StoreKit.Product, subscription: StoreKit.Product.SubscriptionInfo) {
        guard
            let cycleDurationUnit = StorePricingDuration(from: subscription.subscriptionPeriod.unit)
        else {
            return nil
        }

        self.init(
            amount: product.price,
            currency: product.priceFormatStyle.currencyCode,
            displayPrice: product.displayPrice,
            cycleRecurrence: 0,
            cycleDurationUnit: cycleDurationUnit,
            cycleDurationCount: subscription.subscriptionPeriod.value,
        )
    }
}

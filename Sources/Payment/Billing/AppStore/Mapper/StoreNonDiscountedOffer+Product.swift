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

extension StoreNonDiscountedOffer {
    /// Creates the non-discounted offer for a store product.
    ///
    /// The initializer fails if the product isn't a subscription, or its billing period unit isn't recognized.
    ///
    /// - Parameter product: The store product whose base price to map.
    init?(from product: StoreKit.Product) {
        guard
            // The subscription property is always non-nil for type .autoRenewable.
            // We only support auto-renewable subsriptions, so if it is indeed nil,
            // we do not display the product for purchase.
            let subscription = product.subscription,
            let pricingPeriod = StorePricingPeriod(from: product, subscription: subscription)
        else {
            return nil
        }

        self.init(pricingPeriod: pricingPeriod)
    }
}

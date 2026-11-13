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

extension [StoreDiscountedOffer] {
    /// Creates the discounted offers available for a store product, omitting any that can't be mapped.
    ///
    /// - Parameters:
    ///   - product: The store product whose offers to map.
    ///   - introOfferEligible: Whether the user is eligible for the product's introductory offer.
    init(from product: StoreKit.Product, introOfferEligible: Bool) {
        guard
            let subscription = product.subscription
        else {
            self = []
            return
        }

        let currency = product.priceFormatStyle.currencyCode
        var discountedOffers: [StoreDiscountedOffer] = []

        if introOfferEligible,
            let subscriptionOffer = subscription.introductoryOffer,
            let discountedOffer = StoreDiscountedOffer(introductory: subscriptionOffer, currency: currency)
        {
            discountedOffers.append(discountedOffer)
        }

        discountedOffers += subscription.promotionalOffers.compactMap { offer in
            StoreDiscountedOffer(promotional: offer, currency: currency)
        }

        if #available(iOS 18.0, macOS 15.0, tvOS 18.0, *) {
            discountedOffers += subscription.winBackOffers.compactMap { offer in
                StoreDiscountedOffer(winBack: offer, currency: currency)
            }
        }

        self = discountedOffers
    }
}

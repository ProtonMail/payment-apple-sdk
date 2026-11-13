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

extension StoreDiscountedOffer {
    /// Creates an introductory offer from a store subscription offer.
    ///
    /// The initializer fails if the offer's billing period unit isn't recognized.
    ///
    /// - Parameters:
    ///   - offer: The store subscription offer to map.
    ///   - currency: The ISO 4217 currency code of the offer's price.
    init?(introductory offer: StoreKit.Product.SubscriptionOffer, currency: String) {
        guard
            let pricingPeriod = StorePricingPeriod(from: offer, currency: currency)
        else {
            return nil
        }

        self = .introductory(pricingPeriod: pricingPeriod)
    }

    /// Creates a promotional offer from a store subscription offer.
    ///
    /// The initializer fails if the offer has no identifier, or its billing period unit isn't recognized.
    ///
    /// - Parameters:
    ///   - offer: The store subscription offer to map.
    ///   - currency: The ISO 4217 currency code of the offer's price.
    init?(promotional offer: StoreKit.Product.SubscriptionOffer, currency: String) {
        guard
            let offerID = offer.id,
            let pricingPeriod = StorePricingPeriod(from: offer, currency: currency)
        else {
            return nil
        }

        self = .promotional(offerID: offerID, pricingPeriod: pricingPeriod)
    }

    /// Creates a win-back offer from a store subscription offer.
    ///
    /// The initializer fails if the offer has no identifier, or its billing period unit isn't recognized.
    ///
    /// - Parameters:
    ///   - offer: The store subscription offer to map.
    ///   - currency: The ISO 4217 currency code of the offer's price.
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, *)
    init?(winBack offer: StoreKit.Product.SubscriptionOffer, currency: String) {
        guard
            let offerID = offer.id,
            let pricingPeriod = StorePricingPeriod(from: offer, currency: currency)
        else {
            return nil
        }

        self = .winBack(offerID: offerID, pricingPeriod: pricingPeriod)
    }
}

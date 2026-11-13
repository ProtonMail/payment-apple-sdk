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

extension [StoreOffer] {
    /// Creates the offers available for a store product.
    ///
    /// The initializer fails if the product has no non-discounted (base) offer.
    ///
    /// - Parameters:
    ///   - product: The store product whose offers to map.
    ///   - introOfferEligible: Whether the user is eligible for the product's introductory offer.
    init?(from product: StoreKit.Product, introOfferEligible: Bool) {
        guard
            // If we don't have at least a non-discounted offer, then
            // the entire product is invalid, so fail early and propagate.
            let nonDiscountedOffer = StoreNonDiscountedOffer(from: product)
        else {
            return nil
        }

        let discountedOffers = [StoreDiscountedOffer](from: product, introOfferEligible: introOfferEligible)

        self = [.nonDiscounted(nonDiscountedOffer)] + discountedOffers.map(StoreOffer.discounted)
    }
}

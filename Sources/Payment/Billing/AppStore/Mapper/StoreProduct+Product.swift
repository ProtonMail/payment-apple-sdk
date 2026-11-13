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

extension StoreProduct {
    /// Creates a store product from its App Store counterpart.
    ///
    /// The initializer fails if the product has no non-discounted (base) offer.
    ///
    /// - Parameters:
    ///   - product: The App Store product to map.
    ///   - introOfferEligible: Whether the user is eligible for the product's introductory offer.
    init?(from product: StoreKit.Product, introOfferEligible: Bool) {
        guard
            let storeProductOffers = [StoreOffer](from: product, introOfferEligible: introOfferEligible)
        else {
            return nil
        }

        self.init(
            id: product.id,
            title: product.displayName,
            description: product.description,
            offers: storeProductOffers,
        )
    }
}

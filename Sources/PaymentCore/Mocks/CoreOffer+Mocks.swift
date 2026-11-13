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

extension CoreOffer {
    // MARK: - Offer

    package static let mocks: [CoreOffer] = [
        .nonDiscounted(pricingPeriod: CorePricingPeriod.mock),
        .discounted(offer: makeIntroductoryDiscountedMock()),
        .discounted(offer: makePromotionalDiscountedMock()),
        .discounted(offer: makeWinBackDiscountedMock()),
    ]

    // MARK: - Discounted

    package static func makeIntroductoryDiscountedMock(
        pricingPeriod: CorePricingPeriod = CorePricingPeriod.mock
    ) -> CoreDiscountedOffer {
        CoreDiscountedOffer.introductory(pricingPeriod: pricingPeriod)
    }

    package static func makePromotionalDiscountedMock(
        offerID: CoreOfferID = "offer-id",
        pricingPeriod: CorePricingPeriod = CorePricingPeriod.mock,
    ) -> CoreDiscountedOffer {
        CoreDiscountedOffer.promotional(pricingPeriod: pricingPeriod, offerId: offerID)
    }

    package static func makeWinBackDiscountedMock(
        offerID: CoreOfferID = "offer-id",
        pricingPeriod: CorePricingPeriod = CorePricingPeriod.mock,
    ) -> CoreDiscountedOffer {
        CoreDiscountedOffer.winBack(pricingPeriod: pricingPeriod, offerId: offerID)
    }
}

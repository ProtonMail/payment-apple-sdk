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

extension Offer {
    // MARK: - Offer

    static let mocks: [Offer] = [
        .nonDiscounted(makeNonDiscountedMock()),
        .discounted(makeIntroductoryDiscountedMock()),
        .discounted(makePromotionalDiscountedMock()),
        .discounted(makeWinBackDiscountedMock()),
    ]

    // MARK: - Non Discounted

    static func makeNonDiscountedMock(
        pricingPeriod: PricingPeriod = PricingPeriod.mock
    ) -> NonDiscountedOffer {
        NonDiscountedOffer(pricingPeriod: pricingPeriod)
    }

    // MARK: - Discounted

    static func makeIntroductoryDiscountedMock(
        pricingPeriod: PricingPeriod = PricingPeriod.mock
    ) -> DiscountedOffer {
        DiscountedOffer.introductory(pricingPeriod: pricingPeriod)
    }

    static func makePromotionalDiscountedMock(
        offerID: OfferID = "offer-id",
        pricingPeriod: PricingPeriod = PricingPeriod.mock,
    ) -> DiscountedOffer {
        DiscountedOffer.promotional(offerID: offerID, pricingPeriod: pricingPeriod)
    }

    static func makeWinBackDiscountedMock(
        offerID: OfferID = "offer-id",
        pricingPeriod: PricingPeriod = PricingPeriod.mock,
    ) -> DiscountedOffer {
        DiscountedOffer.winBack(offerID: offerID, pricingPeriod: pricingPeriod)
    }
}

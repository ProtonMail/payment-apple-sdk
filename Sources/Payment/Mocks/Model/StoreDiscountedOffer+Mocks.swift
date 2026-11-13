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

extension StoreDiscountedOffer {
    static let introductoryMock: StoreDiscountedOffer = makeIntroductoryMock()

    static let promotionalMock: StoreDiscountedOffer = makePromotionalMock()

    static let winBackMock: StoreDiscountedOffer = makeWinBackMock()

    static func makeIntroductoryMock(
        pricingPeriod: StorePricingPeriod = StorePricingPeriod.mock
    ) -> StoreDiscountedOffer {
        .introductory(pricingPeriod: pricingPeriod)
    }

    static func makePromotionalMock(
        offerID: String = "offer-id",
        pricingPeriod: StorePricingPeriod = StorePricingPeriod.mock,
    ) -> StoreDiscountedOffer {
        .promotional(offerID: offerID, pricingPeriod: pricingPeriod)
    }

    static func makeWinBackMock(
        offerID: String = "offer-id",
        pricingPeriod: StorePricingPeriod = StorePricingPeriod.mock,
    ) -> StoreDiscountedOffer {
        .winBack(offerID: offerID, pricingPeriod: pricingPeriod)
    }
}

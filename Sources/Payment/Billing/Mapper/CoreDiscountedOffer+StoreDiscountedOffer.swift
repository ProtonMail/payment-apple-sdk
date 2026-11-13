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

import PaymentCore

extension CoreDiscountedOffer {
    /// Creates a core discounted offer from a store discounted offer.
    ///
    /// The initializer fails if the offer's price can't be represented as a core monetary value.
    ///
    /// - Parameter offer: The store discounted offer to map.
    init?(from offer: StoreDiscountedOffer) {
        switch offer {
        case .introductory(let pricingPeriod):
            guard
                let corePricingPeriod = CorePricingPeriod(from: pricingPeriod)
            else {
                return nil
            }

            self = .introductory(pricingPeriod: corePricingPeriod)
        case .promotional(let offerID, let pricingPeriod):
            guard
                let corePricingPeriod = CorePricingPeriod(from: pricingPeriod)
            else {
                return nil
            }

            self = .promotional(pricingPeriod: corePricingPeriod, offerId: offerID)
        case .winBack(let offerID, let pricingPeriod):
            guard
                let corePricingPeriod = CorePricingPeriod(from: pricingPeriod)
            else {
                return nil
            }

            self = .winBack(pricingPeriod: corePricingPeriod, offerId: offerID)
        }
    }
}

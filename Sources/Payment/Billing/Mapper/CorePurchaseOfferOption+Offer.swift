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

extension CorePurchaseOfferOption {
    /// Creates the core option for redeeming an offer with a purchase.
    ///
    /// - Parameters:
    ///   - offer: The offer to redeem.
    ///   - bundleIdentifier: The bundle identifier of the app.
    init(from offer: Offer, bundleIdentifier: String) {
        switch offer {
        case .nonDiscounted:
            self = .none
        case .discounted(let offer):
            self = CorePurchaseOfferOption(from: offer, bundleIdentifier: bundleIdentifier)
        }
    }

    private init(from offer: DiscountedOffer, bundleIdentifier: String) {
        switch offer {
        case .introductory(_):
            self = .none
        case .winBack(let offerID, _):
            self = .winback(offerID)
        case .promotional(let offerID, _):
            self = .promotional(CorePromotionalOffer(offerId: offerID, bundleId: bundleIdentifier))
        }
    }
}

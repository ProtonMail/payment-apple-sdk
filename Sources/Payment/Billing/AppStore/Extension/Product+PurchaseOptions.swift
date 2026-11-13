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

extension StoreKit.Product {
    /// Builds the options for purchasing this product with an offer.
    ///
    /// - Parameters:
    ///   - userID: The identifier of the purchasing user, or `nil` if credential-less.
    ///   - offer: The offer to redeem with the purchase.
    /// - Returns: The purchase options, or `nil` if the offer can't be applied.
    func purchaseOptions(for userID: String?, with offer: StorePurchaseOffer) -> Set<StoreKit.Product.PurchaseOption>? {
        guard var options = offerPurchaseOptions(with: offer) else {
            return nil
        }

        if let userID, let uuid = UUID(uuidString: userID) {
            options.insert(.appAccountToken(uuid))
        }

        return options
    }

    private func offerPurchaseOptions(with offer: StorePurchaseOffer) -> Set<StoreKit.Product.PurchaseOption>? {
        switch offer {
        case .none:
            return []
        case .promotional(let id, let signature):
            return Set(StoreKit.Product.PurchaseOption.promotionalOffer(id, compactJWS: signature))
        case .winBack(let id):
            guard #available(iOS 18.0, macOS 15.0, tvOS 18.0, *) else {
                return nil
            }

            guard let winBackOffer = self.subscription?.winBackOffers.first(where: { $0.id == id }) else {
                return nil
            }

            return [StoreKit.Product.PurchaseOption.winBackOffer(winBackOffer)]
        }
    }
}

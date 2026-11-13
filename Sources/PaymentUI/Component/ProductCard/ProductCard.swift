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

import Payment
import SwiftUI

// MARK: - Component

/// A card component used for the display of a single subscription product.
public struct ProductCard: View {
    // MARK: - Properties

    @Environment(\.locale) private var locale

    private let product: Product
    private let isInitiallyExpanded: Bool
    private let isTransacting: Bool
    private let onPurchaseTap: (ProductID, Offer) -> Void

    private var baseOffer: Offer? {
        product.offers.nonDiscounted()
    }

    private var basePricingPeriod: PricingPeriod? {
        guard case .nonDiscounted(let offer) = baseOffer else {
            return nil
        }

        return offer.pricingPeriod
    }

    // MARK: - Initializer

    /// Creates a card for a subscription product.
    ///
    /// - Parameters:
    ///   - product: The full product model to present.
    ///   - isInitiallyExpanded: Whether this card should initially show expanded.
    ///   - isTransacting: Whether there is an ongoing purchase already happening.
    ///   - onPurchaseTap: Triggered when the purchase button in the card body is tapped.
    public init(
        product: Product,
        isInitiallyExpanded: Bool = false,
        isTransacting: Bool = false,
        onPurchaseTap: @escaping (ProductID, Offer) -> Void,
    ) {
        self.product = product
        self.isInitiallyExpanded = isInitiallyExpanded
        self.isTransacting = isTransacting
        self.onPurchaseTap = onPurchaseTap
    }

    // MARK: - View

    public var body: some View {
        ExpandableCard(
            isToggleable: true,
            isInitiallyExpanded: isInitiallyExpanded,
            header: {
                ProductCardHeader(
                    title: product.title,
                    description: product.description,
                    // TODO: Price should be guaranteed at this point for a valid product
                    price: basePricingPeriod?.price.localizedAmount ?? "",
                    period: BillingPeriodFormatter.string(for: basePricingPeriod?.cycle, locale: locale),
                )
            },
            content: {
                VStack(alignment: .leading, spacing: 16) {
                    EntitlementList(entitlements: product.entitlements)
                    Button(
                        action: {
                            if let baseOffer {
                                onPurchaseTap(product.id, baseOffer)
                            }
                        },
                        label: {
                            Text("product_card_get_button_label \(product.title)", bundle: .module)
                                .frame(maxWidth: .infinity)
                        },
                    )
                    .buttonStyle(PaymentPrimaryButtonStyle(isLoading: isTransacting))
                    .disabled(isTransacting)
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            },
        )
    }
}

// MARK: - Preview

#Preview("Default", traits: .sizeThatFitsLayout) {
    ProductCard(
        product: Product.mock,
        isInitiallyExpanded: true,
        isTransacting: false,
        onPurchaseTap: { _, _ in },
    )
}

#Preview("Loading", traits: .sizeThatFitsLayout) {
    ProductCard(
        product: Product.mock,
        isInitiallyExpanded: true,
        isTransacting: true,
        onPurchaseTap: { _, _ in },
    )
}

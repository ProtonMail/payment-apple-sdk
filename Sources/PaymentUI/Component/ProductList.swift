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

/// Displays a vertical list of products, each in a product card.
public struct ProductList: View {
    // MARK: - Properties

    private let products: [Product]
    private let isTransacting: Bool
    private let onPurchaseTap: (ProductID, Offer) -> Void

    // MARK: - Initializer

    /// Creates a list of products.
    ///
    /// - Parameters:
    ///   - products: The list of products to display.
    ///   - isTransacting: Indicates whether there is an ongoing purchase.
    ///   - onPurchaseTap: The callback for when a purchase button in a card is tapped.
    public init(
        products: [Product],
        isTransacting: Bool = false,
        onPurchaseTap: @escaping (ProductID, Offer) -> Void,
    ) {
        self.products = products
        self.isTransacting = isTransacting
        self.onPurchaseTap = onPurchaseTap
    }

    // MARK: - View

    public var body: some View {
        VStack(spacing: 12) {
            ForEach(products) { product in
                ProductCard(
                    product: product,
                    isTransacting: isTransacting,
                    onPurchaseTap: onPurchaseTap,
                )
            }
        }
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    ProductList(
        products: Product.mocks,
        onPurchaseTap: { _, _ in },
    )
}

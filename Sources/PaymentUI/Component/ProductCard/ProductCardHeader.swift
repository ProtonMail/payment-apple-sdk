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

/// Header slot content for a product card, showing the product name, price, and description.
struct ProductCardHeader: View {
    // MARK: - Theme

    @Environment(\.paymentTheme) private var theme

    // MARK: - Properties

    private let title: String
    private let description: String
    private let price: String
    private let period: String?

    // MARK: - Initializer

    /// Creates a header for a product card.
    ///
    /// - Parameters:
    ///   - title: The product display name.
    ///   - description: The product description.
    ///   - price: The formatted price to display.
    ///   - period: The billing period label shown beneath the price, if any.
    init(
        title: String,
        description: String,
        price: String,
        period: String?,
    ) {
        self.title = title
        self.description = description
        self.price = price
        self.period = period
    }

    // MARK: - View

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(theme.fonts.subheadline)
                    .foregroundStyle(theme.colors.foreground)
                Text(description)
                    .font(theme.fonts.caption)
                    .foregroundStyle(theme.colors.mutedForeground)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text(price)
                    .font(theme.fonts.headline)
                    .foregroundStyle(theme.colors.foreground)

                if let period {
                    Text(period)
                        .font(theme.fonts.caption)
                        .foregroundStyle(theme.colors.mutedForeground)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    ProductCardHeader(
        title: "Product Title",
        description: "Product description",
        price: "123.45 CHF",
        period: "Per month",
    )
}

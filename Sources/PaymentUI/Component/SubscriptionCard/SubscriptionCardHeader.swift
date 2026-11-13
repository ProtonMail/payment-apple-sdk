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

/// Header slot content for a subscription card, showing the subscribed product's name.
struct SubscriptionCardHeader: View {
    // MARK: - Theme

    @Environment(\.paymentTheme) private var theme

    // MARK: - Properties

    private let title: String

    // MARK: - Initializer

    /// Creates a header for a subscription card.
    ///
    /// - Parameter title: The product display name.
    init(
        title: String
    ) {
        self.title = title
    }

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(theme.fonts.subheadline)
                .foregroundStyle(theme.colors.foreground)
            Text("subscription_card_header_current_plan_label", bundle: .module)
                .font(theme.fonts.caption)
                .foregroundStyle(theme.colors.mutedForeground)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    SubscriptionCardHeader(
        title: "Subscription Card Title"
    )
}

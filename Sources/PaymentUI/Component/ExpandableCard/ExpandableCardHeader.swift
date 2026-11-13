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

import SwiftUI

// MARK: - Component

/// A base expandable header component, for use within an expandable card's header slot.
struct ExpandableCardHeader<Content: View>: View {
    @Environment(\.paymentTheme) private var theme

    private let isExpanded: Bool
    private let content: () -> Content

    /// Creates a header for an expandable card.
    ///
    /// - Parameters:
    ///   - isExpanded: Whether the card is expanded.
    ///   - content: The content to be displayed in this component.
    init(
        isExpanded: Bool,
        @ViewBuilder content: @escaping () -> Content,
    ) {
        self.isExpanded = isExpanded
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            content()

            HStack {
                Spacer()
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
                    .foregroundStyle(theme.colors.primary)
                    .frame(width: 24, height: 24)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .padding()
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    ExpandableCardHeader(
        isExpanded: true,
        content: {
            VStack(alignment: .leading) {
                Text("Header Title")
                Text("Header subtitle")
            }
        },
    )
}

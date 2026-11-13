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

/// A base expandable card component that supports header and body content.
///
/// When the inner expanded state is `true`, the body content is shown; otherwise, it is hidden.
public struct ExpandableCard<Header: View, Content: View>: View {
    @State private var isExpanded: Bool

    @Environment(\.paymentTheme) private var theme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @FocusState private var isHeaderFocused: Bool

    private let isToggleable: Bool
    private let header: () -> Header
    private let content: () -> Content

    /// Creates an expandable card from a header and a body.
    ///
    /// - Parameters:
    ///   - isToggleable: Whether this card can be toggled between an idle and a selected state.
    ///   - isInitiallyExpanded: When `true`, this card appears expanded.
    ///   - header: A slot to insert a header component.
    ///   - content: A slot to insert a body component.
    public init(
        isToggleable: Bool = false,
        isInitiallyExpanded: Bool = false,
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder content: @escaping () -> Content,
    ) {
        self.isToggleable = isToggleable
        self._isExpanded = State(initialValue: isInitiallyExpanded)
        self.header = header
        self.content = content
    }

    public var body: some View {
        let cardShape = RoundedRectangle(cornerRadius: theme.design.borderRadiusLarge)

        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(reduceMotion ? nil : .default) {
                    isExpanded.toggle()
                }
            } label: {
                ExpandableCardHeader(isExpanded: isExpanded, content: header)
            }
            .buttonStyle(CardHeaderButtonStyle())
            .focused($isHeaderFocused)
            .accessibilityValue(isExpanded ? "Expanded" : "Collapsed")

            if isExpanded {
                content()
            }
        }
        .frame(maxWidth: .infinity)
        .background(theme.colors.background, in: cardShape)
        .clipShape(cardShape)
        .overlay {
            cardShape
                .strokeBorder(
                    isHeaderFocused || (isToggleable && isExpanded) ? theme.colors.primary : theme.colors.border,
                    lineWidth: isHeaderFocused ? 4 : 2,
                )
                .opacity(isHeaderFocused || !isToggleable || isExpanded ? 1 : 0)
                .allowsHitTesting(false)
        }
    }
}

private struct CardHeaderButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    VStack {
        ExpandableCard(
            isToggleable: true,
            isInitiallyExpanded: true,
            header: {
                Text("Header")
                    .frame(maxWidth: .infinity, alignment: .leading)
            },
            content: {
                Text("Content")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            },
        )
    }
    .padding()
}

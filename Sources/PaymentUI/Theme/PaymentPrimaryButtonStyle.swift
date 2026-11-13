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

/// The button style for primary actions.
public struct PaymentPrimaryButtonStyle: ButtonStyle {
    // MARK: - Theme

    @Environment(\.paymentTheme) private var theme

    // MARK: - Properties

    /// Whether the button shows its loading appearance.
    let isLoading: Bool

    @Environment(\.isFocused) private var isFocused

    private var foregroundColor: Color {
        isLoading ? theme.colors.primaryForegroundDisabled : theme.colors.primaryForeground
    }

    private var backgroundColor: Color {
        isLoading ? theme.colors.primaryDisabled : theme.colors.primary
    }

    // MARK: - Initializer

    /// Creates a primary button style.
    ///
    /// - Parameter isLoading: Whether the button shows its loading appearance.
    public init(
        isLoading: Bool = false
    ) {
        self.isLoading = isLoading
    }

    // MARK: - View

    public func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .trailing) {
            configuration.label
                .font(theme.fonts.subheadline)
                .foregroundStyle(foregroundColor)
                .padding()
                .background(
                    configuration.isPressed ? backgroundColor.opacity(0.85) : backgroundColor,
                    in: .rect(cornerRadius: theme.design.borderRadiusMedium),
                )

            if isLoading {
                ProgressView()
                    .tint(theme.colors.primaryForegroundDisabled)
                    .padding(.trailing)
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: theme.design.borderRadiusMedium)
                .strokeBorder(theme.colors.primaryForeground, lineWidth: 4)
                .opacity(isFocused ? 1 : 0)
                .allowsHitTesting(false)
        }
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    VStack(spacing: 16) {
        Button(
            action: {},
            label: {
                Text("Button")
                    .frame(maxWidth: .infinity)
            },
        )
        .buttonStyle(PaymentPrimaryButtonStyle())

        Button(
            action: {},
            label: {
                Text("Button")
                    .frame(maxWidth: .infinity)
            },
        )
        .buttonStyle(PaymentPrimaryButtonStyle(isLoading: true))
    }
    .padding()
}

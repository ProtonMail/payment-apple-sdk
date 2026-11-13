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

/// Loads an entitlement icon by name, tinted to the theme's primary color.
///
/// The icon is loaded from the icon CDN. A placeholder is shown while loading, and a fallback icon if the load fails.
struct PaymentAsyncIcon: View {
    // MARK: - Theme

    @Environment(\.paymentTheme) private var theme

    // MARK: - Properties

    private static let cdnBaseURL = "https://mail.proton.me/api/payments/v5/resources/icons/"
    private var url: URL? { URL(string: Self.cdnBaseURL + iconName) }

    private let iconName: String
    private let size: CGFloat

    // MARK: - Initializer

    /// Creates an icon for the given icon name.
    ///
    /// - Parameters:
    ///   - iconName: The icon's file name on the CDN.
    ///   - size: The rendered icon size.
    init(
        iconName: String,
        size: CGFloat = 24.0,
    ) {
        self.iconName = iconName
        self.size = size
    }

    // MARK: - View

    var body: some View {
        AsyncImage(url: url) { phase in
            if case .success(let image) = phase {
                image
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
            } else {
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
            }
        }
        .foregroundStyle(theme.colors.primary)
        .frame(width: size, height: size)
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    PaymentAsyncIcon(
        iconName: "envelope"
    )
}

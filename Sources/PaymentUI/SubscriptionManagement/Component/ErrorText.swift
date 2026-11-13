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

/// A line of text that displays an error message in the theme's danger color.
struct ErrorText: View {
    // MARK: - Properties

    @Environment(\.paymentTheme) private var theme
    private let text: String

    // MARK: - Initializer

    /// Creates text that displays an error message.
    ///
    /// - Parameter text: The error message to display.
    init(_ text: String) {
        self.text = text
    }

    // MARK: - View

    var body: some View {
        Text(text)
            .font(theme.fonts.subheadline)
            .foregroundStyle(theme.colors.danger)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    ErrorText("Oops! Something went wrong, try again later")
        .padding()
}

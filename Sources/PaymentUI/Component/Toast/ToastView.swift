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

/// A rounded banner that displays a toast message.
struct ToastView: View {
    // MARK: - Properties

    @Environment(\.paymentTheme) private var theme

    /// The text that the toast displays.
    let message: String

    /// The background color of the toast.
    let backgroundColor: Color

    /// The color of the toast message.
    let foregroundColor: Color

    // MARK: - View

    var body: some View {
        let shape = RoundedRectangle(cornerRadius: theme.design.borderRadiusMedium)

        Text(message)
            .foregroundStyle(foregroundColor)
            .font(theme.fonts.subheadline)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.vertical, 22)
            .background(backgroundColor, in: shape)
            .shadow(color: Color.black.opacity(0.2), radius: 8, y: 6)
            .padding(.horizontal)
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    ToastView(message: "ToastView message", backgroundColor: PaymentColors.default.danger, foregroundColor: .white)
}

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

/// Displays a single description entitlement, showing an icon and label for the entitlement.
///
/// This is specifically for use with a `DescriptionEntitlement`.
struct EntitlementRow: View {
    // MARK: - Theme

    @Environment(\.paymentTheme) private var theme

    // MARK: - Properties

    private let entitlement: DescriptionEntitlement

    // MARK: - Initializer

    /// Creates a row for a description entitlement.
    ///
    /// - Parameter entitlement: The entitlement to display.
    init(
        entitlement: DescriptionEntitlement
    ) {
        self.entitlement = entitlement
    }

    // MARK: - View

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            PaymentAsyncIcon(
                iconName: entitlement.iconName,
                size: 16,
            )
            .padding(.top, 1)

            Text(entitlement.text)
                .font(theme.fonts.subheadline)
                .foregroundStyle(theme.colors.foreground)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Preivew

#Preview(traits: .sizeThatFitsLayout) {
    EntitlementRow(
        entitlement: Entitlement.makeDescriptionMock()
    )
}

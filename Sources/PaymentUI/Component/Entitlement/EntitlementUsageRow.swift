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

/// Displays a single usage entitlement, showing how much of the entitlement has currently been utilized.
///
/// This is specifically for use with a `ProgressEntitlement`.
struct EntitlementUsageRow: View {
    // MARK: - Theme

    @Environment(\.paymentTheme) private var theme

    // MARK: - Properties

    private let entitlement: ProgressEntitlement

    private var progress: Double {
        guard entitlement.max != entitlement.min else {
            return 0.0
        }

        return Double(entitlement.current - entitlement.min) / Double(entitlement.max - entitlement.min)
    }

    // MARK: - Initializer

    /// Creates a row for a usage entitlement.
    ///
    /// - Parameter entitlement: The entitlement to display utilization for.
    init(
        entitlement: ProgressEntitlement
    ) {
        self.entitlement = entitlement
    }

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(entitlement.text)
                .font(theme.fonts.subheadline)
                .foregroundStyle(theme.colors.foreground)
            ProgressView(value: progress)
                .tint(theme.colors.primary)
        }
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    EntitlementUsageRow(
        entitlement: Entitlement.makeProgressMock()
    )
}

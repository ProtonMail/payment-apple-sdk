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

/// Displays a list of entitlements.
///
/// This component displays entitlements in a list based on their type.
public struct EntitlementList: View {
    // MARK: - Properties

    private let entitlements: [Entitlement]

    // MARK: - Initializer

    /// Creates a list of entitlements.
    ///
    /// - Parameter entitlements: The list of entitlements to be displayed.
    public init(
        entitlements: [Entitlement]
    ) {
        self.entitlements = entitlements
    }

    // MARK: - View

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(entitlements.indices, id: \.self) { index in
                switch entitlements[index] {
                case .description(let entitlement):
                    EntitlementRow(entitlement: entitlement)
                case .progress(let entitlement):
                    EntitlementUsageRow(entitlement: entitlement)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    EntitlementList(
        entitlements: Entitlement.mocks
    )
}

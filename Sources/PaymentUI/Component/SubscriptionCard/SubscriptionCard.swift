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

/// A card component used for the display of a single user subscription.
public struct SubscriptionCard: View {
    // MARK: - Properties

    private let subscription: Subscription
    private let isInitiallyExpanded: Bool

    // MARK: - Initializer

    /// Creates a card for a user subscription.
    ///
    /// - Parameters:
    ///   - subscription: The subscription model to present.
    ///   - isInitiallyExpanded: Whether this card should initially show expanded.
    public init(
        subscription: Subscription,
        isInitiallyExpanded: Bool = false,
    ) {
        self.subscription = subscription
        self.isInitiallyExpanded = isInitiallyExpanded
    }

    // MARK: - View

    public var body: some View {
        ExpandableCard(
            isToggleable: false,
            isInitiallyExpanded: isInitiallyExpanded,
            header: {
                SubscriptionCardHeader(title: subscription.localizedTitle)
            },
            content: {
                EntitlementList(entitlements: subscription.entitlements)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            },
        )
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    SubscriptionCard(
        subscription: Subscription.mock,
        isInitiallyExpanded: true,
    )
}

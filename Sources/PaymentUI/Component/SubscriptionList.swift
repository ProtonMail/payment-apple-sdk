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

/// Displays a vertical list of subscriptions, each in a subscription card.
public struct SubscriptionList: View {
    // MARK: - Properties

    private let subscriptions: [Subscription]

    // MARK: - Initializer

    /// Creates a list of subscriptions.
    ///
    /// - Parameter subscriptions: The list of subscriptions to display.
    public init(
        subscriptions: [Subscription]
    ) {
        self.subscriptions = subscriptions
    }

    // MARK: - View

    public var body: some View {
        let isInitiallyExpanded = subscriptions.count == 1

        VStack(spacing: 12) {
            ForEach(subscriptions) { subscription in
                SubscriptionCard(
                    subscription: subscription,
                    isInitiallyExpanded: isInitiallyExpanded,
                )
            }
        }
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    SubscriptionList(
        subscriptions: Subscription.mocks
    )
}

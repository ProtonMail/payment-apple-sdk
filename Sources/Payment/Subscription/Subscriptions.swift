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

/// Provides subscription-related operations.
public struct Subscriptions: Sendable {
    // MARK: - Properties

    private let subscriptionRepository: any SubscriptionRepository

    // MARK: - Initializer

    /// Creates the subscription operations, backed by the given repository.
    ///
    /// - Parameter subscriptionRepository: The repository that supplies subscriptions.
    init(subscriptionRepository: any SubscriptionRepository) {
        self.subscriptionRepository = subscriptionRepository
    }

    // MARK: - Events

    /// Fetches the active subscriptions held by the session user.
    ///
    /// The list contains only active subscriptions, that is, those that have not yet expired. It is possible to hold
    /// multiple subscriptions simultaneously. If there are no active subscriptions, a default free subscription is
    /// returned.
    ///
    /// - Returns: The list of active subscriptions for the session user.
    /// - Throws: ``PaymentError`` if the subscriptions cannot be fetched.
    public func all() async throws(PaymentError) -> [Subscription] {
        try await subscriptionRepository.subscriptions()
    }
}

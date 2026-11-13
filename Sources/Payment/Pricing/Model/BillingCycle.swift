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

/// A single subscription billing cycle.
///
/// Each case is considered a duration unit. Representative examples:
/// - ``BillingCycle/month(count:)`` with a count of 1: a monthly subscription.
/// - ``BillingCycle/year(count:)`` with a count of 2: a biennial subscription.
/// - ``BillingCycle/week(count:)`` with a count of 2: a subscription billed every two weeks.
///
/// In each case, this model indicates precisely how long a single cycle lasts. Alone, it does not indicate how many
/// times a single cycle is repeated.
public enum BillingCycle: Sendable, Equatable, Hashable {
    /// A duration unit of day.
    ///
    /// - Parameter count: The number of duration units this cycle represents.
    case day(count: Int)

    /// A duration unit of week.
    ///
    /// - Parameter count: The number of duration units this cycle represents.
    case week(count: Int)

    /// A duration unit of month.
    ///
    /// - Parameter count: The number of duration units this cycle represents.
    case month(count: Int)

    /// A duration unit of year.
    ///
    /// - Parameter count: The number of duration units this cycle represents.
    case year(count: Int)
}

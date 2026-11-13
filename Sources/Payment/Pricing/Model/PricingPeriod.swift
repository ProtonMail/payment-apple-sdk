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

/// A period of time over which a billing cycle is applied.
///
/// The ``PricingPeriod/cycle`` repeats as described by ``PricingPeriod/recurrence``, and ``PricingPeriod/price`` is
/// charged for each cycle. Representative examples:
/// - A price of 123.45 CHF, a one-month cycle, and an infinite recurrence: an indefinite monthly subscription,
///   charged at 123.45 CHF per month until cancellation.
/// - A price of 9.99 CHF, a one-month cycle, and a finite recurrence with a count of 3: a discounted offer, charged
///   at 9.99 CHF per month for three months.
public struct PricingPeriod: Sendable, Equatable {
    /// The cost of a single cycle.
    public let price: Money

    /// The duration a single billing cycle lasts.
    public let cycle: BillingCycle

    /// How many times the cycle repeats.
    ///
    /// The value is ``BillingRecurrence/infinite`` if the cycle repeats until cancellation.
    public let recurrence: BillingRecurrence
}

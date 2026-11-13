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

import Foundation

/// A store-agnostic billing pricing period.
///
/// A user is charged in pricing periods. A single pricing period may cycle finitely or infinitely (until
/// cancellation). A pricing period is a subscription billing cycle; for example, a user is charged a fixed amount
/// for a yearly subscription.
struct StorePricingPeriod: Sendable, Equatable {
    /// The monetary amount billed for the period.
    let amount: Decimal

    /// The currency code that the amount is localized in.
    let currency: String

    /// The localized, formatted amount with its currency.
    let displayPrice: String

    /// How many times the pricing period recurs.
    ///
    /// A value of `0` means infinite.
    let cycleRecurrence: Int

    /// The unit of duration one cycle represents.
    let cycleDurationUnit: StorePricingDuration

    /// The number of duration units one cycle represents.
    let cycleDurationCount: Int
}

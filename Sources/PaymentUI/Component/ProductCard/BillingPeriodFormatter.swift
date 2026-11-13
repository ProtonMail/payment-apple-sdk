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
import Payment

/// Formats the duration charged by the displayed base price, independently of recurrence.
enum BillingPeriodFormatter {
    /// Missing pricing or an invalid duration has no billing-period label.
    static func string(for cycle: BillingCycle?, locale: Locale = .current) -> String? {
        guard let cycle else { return nil }

        let count =
            switch cycle {
            case .day(let count), .week(let count), .month(let count), .year(let count): count
            }
        guard count > 0 else { return nil }

        let label: String.LocalizationValue =
            switch cycle {
            case .day(count: 1): "pricing_period_daily"
            case .day(let count): "pricing_period_days \(count)"
            case .week(count: 1): "pricing_period_weekly"
            case .week(let count): "pricing_period_weeks \(count)"
            case .month(count: 1): "pricing_period_monthly"
            case .month(let count): "pricing_period_months \(count)"
            case .year(count: 1): "pricing_period_yearly"
            case .year(let count): "pricing_period_years \(count)"
            }
        return String(
            localized: LocalizedStringResource(
                label,
                locale: locale,
                bundle: .atURL(Bundle.module.bundleURL),
            ))
    }
}

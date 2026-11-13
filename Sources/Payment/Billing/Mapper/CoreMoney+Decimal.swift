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
import PaymentCore

extension CoreMoney {
    /// Creates a core monetary value from a decimal amount.
    ///
    /// The initializer fails if the amount is negative or doesn't fit in an unsigned 64-bit integer.
    ///
    /// - Parameters:
    ///   - amount: The monetary amount.
    ///   - currency: The ISO 4217 currency code of the amount.
    ///   - displayPrice: The localized, formatted amount with its currency.
    init?(from amount: Decimal, currency: String, displayPrice: String) {
        guard
            amount >= 0
        else {
            return nil
        }

        let scale = abs(min(amount.exponent, 0))
        let scaledAmount = NSDecimalNumber(decimal: amount).multiplying(byPowerOf10: Int16(scale))

        guard
            let unscaledAmount = UInt64(exactly: scaledAmount)
        else {
            return nil
        }

        self.init(
            amount: unscaledAmount,
            scale: UInt8(scale),
            currency: currency,
            formattedAmount: displayPrice,
        )
    }
}

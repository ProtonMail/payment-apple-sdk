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

import PaymentCore

extension CoreBillingCount {
    /// Creates a core billing count from the number of times a cycle recurs.
    ///
    /// - Parameter count: The number of times the cycle recurs, or `0` for infinite.
    init(from count: Int) {
        switch count {
        case 0:
            self = CoreBillingCount.infinite
        default:
            self = CoreBillingCount.finite(UInt8(count))
        }
    }
}

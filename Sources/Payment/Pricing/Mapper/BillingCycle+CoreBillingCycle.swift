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

extension BillingCycle {
    /// Creates a billing cycle from its core representation.
    ///
    /// - Parameter coreCycle: The core billing cycle to map.
    init(from coreCycle: CoreBillingCycle) {
        switch coreCycle {
        case .day(let count):
            self = .day(count: Int(count))
        case .week(let count):
            self = .week(count: Int(count))
        case .month(let count):
            self = .month(count: Int(count))
        case .year(let count):
            self = .year(count: Int(count))
        }
    }
}

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

import StoreKit

extension Transaction {
    /// Whether the transaction is unexpired, unrevoked, and not superseded by an upgrade.
    var isActive: Bool {
        !isExpired && !isRevoked && !isUpgraded
    }

    /// Whether the transaction was created by a subscription renewal.
    var isRenewal: Bool {
        self.reason == .renewal
    }

    /// Whether the transaction has been revoked.
    var isRevoked: Bool {
        self.revocationDate != nil
    }

    /// Whether the transaction's subscription period has ended.
    var isExpired: Bool {
        (self.expirationDate ?? .distantFuture) < Date()
    }
}

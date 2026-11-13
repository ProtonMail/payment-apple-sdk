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

/// Subscription metadata used to determine when a product change takes effect.
struct StoreSubscription: Sendable {
    let groupID: String
    let groupLevel: Int
    let periodUnit: StorePricingDuration
    let periodValue: Int

    func changesAtRenewal(to requested: StoreSubscription) -> Bool {
        guard groupID == requested.groupID, groupLevel > 0, requested.groupLevel > 0 else {
            return false
        }

        return requested.groupLevel > groupLevel
            || (requested.groupLevel == groupLevel
                && (requested.periodUnit != periodUnit || requested.periodValue != periodValue))
    }
}

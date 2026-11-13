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

/// Represents a single purchase update for an implemented store.
///
/// Includes scheduled subscription changes that complete without producing a new purchase receipt.
enum StorePurchaseUpdate: Sendable {
    /// A purchase was canceled by the user.
    case canceled

    /// A purchase is pending further action, and will be delivered by a later transaction update.
    case pending

    /// A purchase was successful.
    ///
    /// The associated value is the purchase to reconcile.
    case success(StorePurchase)

    /// The store accepted a subscription change that takes effect at the next renewal.
    case modificationScheduled

    /// A purchase failed.
    ///
    /// The associated value is the store error describing the failure.
    case failure(StorePurchaseError)
}

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

/// Error codes for in-app purchase store failures.
///
/// Raw values fall in the 3xx range.
public enum PaymentStoreErrorCode: Int, Sendable {
    /// The store failed to acknowledge a completed purchase.
    case acknowledgement = 301

    /// The store failed to return product details.
    case fetchProducts = 302

    /// An unclassified error occurred inside the store client.
    case coreFailure = 303

    /// The store failed to complete the purchase flow.
    case purchase = 304

    /// The store is unavailable.
    case unavailable = 305

    /// No unfinished store transaction was found to reconcile.
    case noUnfinishedTransactionFound = 307
}

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

/// Represents an error occurring from a failed store purchase.
enum StorePurchaseError: Error, Sendable {
    /// The selected offer could not be applied to the purchase.
    case offerUnavailable(StorePurchaseOffer)

    /// No store product could be found for the requested identifier.
    case productNotFound(String)

    /// An unknown result was returned from the store purchase.
    case unknownPurchaseResult

    /// An unverified transaction was returned from the store purchase.
    case unverifiedTransaction

    /// The store returned another product's transaction that does not represent a deferred change.
    case unexpectedProduct

    /// A debug message for the error.
    var message: String {
        switch self {
        case .offerUnavailable(let offer):
            return "The selected offer could not be applied: \(offer)"
        case .productNotFound(let storeProductID):
            return "No matching product for ID: \(storeProductID)"
        case .unknownPurchaseResult:
            return "An unknown transaction result was received"
        case .unverifiedTransaction:
            return "An unverified transaction error was received"
        case .unexpectedProduct:
            return "The store returned a transaction for an unexpected product"
        }
    }
}

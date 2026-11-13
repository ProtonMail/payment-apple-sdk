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

extension PaymentStoreErrorCode {
    /// The localized message shown for this error code.
    var message: String {
        switch self {
        case .acknowledgement:
            return String(localized: "payment_exception_store_acknowledgement", bundle: .module)
        case .fetchProducts:
            return String(localized: "payment_exception_store_fetch_products", bundle: .module)
        case .coreFailure:
            return String(localized: "payment_exception_store_internal", bundle: .module)
        case .purchase:
            return String(localized: "payment_exception_store_purchase", bundle: .module)
        case .unavailable:
            return String(localized: "payment_exception_store_unavailable", bundle: .module)
        case .noUnfinishedTransactionFound:
            return String(localized: "payment_exception_store_no_unfinished_transaction_found", bundle: .module)
        }
    }
}

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

extension PaymentError {
    /// Creates the payment error matching the origin of an error raised by the core.
    ///
    /// The payment error carries the original error as its cause.
    ///
    /// - Parameter error: The error to map.
    init(from error: any Error) {
        guard
            let coreError = error as? CoreError
        else {
            self = PaymentError.other(code: PaymentOtherErrorCode.unexpected, cause: error)
            return
        }

        switch coreError {
        case .Http(let networkError):
            self = PaymentError(from: networkError)
        case .Iap(let storeError):
            self = PaymentError(from: storeError)
        case .Logging(_):
            self = PaymentError.core(code: PaymentCoreErrorCode.logging, cause: coreError)
        case .Parsing(_):
            self = PaymentError.core(code: PaymentCoreErrorCode.parsing, cause: coreError)
        case .TokenPolling(_):
            self = PaymentError.core(code: PaymentCoreErrorCode.tokenPolling, cause: coreError)
        case .SessionInProgress:
            self = PaymentError.core(code: PaymentCoreErrorCode.sessionInProgress, cause: coreError)
        case .RecoverFlowUserMisalignment:
            self = PaymentError.core(code: PaymentCoreErrorCode.recoverFlowUserMisalignment, cause: coreError)
        case .UnsupportedPlatform:
            self = PaymentError.core(code: PaymentCoreErrorCode.unsupportedPlatform, cause: coreError)
        case .MissingOfferToken:
            self = PaymentError.core(code: PaymentCoreErrorCode.missingOfferToken, cause: coreError)
        case .DisabledVendor(_):
            self = PaymentError.core(code: PaymentCoreErrorCode.disabledPaymentMethod, cause: coreError)
        case .CredentiallessReconcile:
            self = PaymentError.core(code: PaymentCoreErrorCode.credentialLessReconcile, cause: coreError)
        case .DisallowedSubscription(_):
            self = PaymentError.core(code: PaymentCoreErrorCode.disallowedSubscription, cause: coreError)
        }
    }
}

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

extension PaymentCoreErrorCode {
    /// The localized message shown for this error code.
    var message: String {
        switch self {
        case .disabledPaymentMethod:
            return String(localized: "payment_exception_core_disabled_payment_method", bundle: .module)
        case .logging:
            return String(localized: "payment_exception_core_logging", bundle: .module)
        case .parsing:
            return String(localized: "payment_exception_core_parsing", bundle: .module)
        case .tokenPolling:
            return String(localized: "payment_exception_core_token_polling", bundle: .module)
        case .credentialLessReconcile:
            return String(localized: "payment_exception_core_credential_less_reconcile", bundle: .module)
        case .missingOfferToken:
            return String(localized: "payment_exception_core_missing_offer_token", bundle: .module)
        case .recoverFlowUserMisalignment:
            return String(localized: "payment_exception_core_recover_flow_user_misalignment", bundle: .module)
        case .sessionInProgress:
            return String(localized: "payment_exception_core_session_in_progress", bundle: .module)
        case .unsupportedPlatform:
            return String(localized: "payment_exception_core_unsupported_platform", bundle: .module)
        case .disallowedSubscription:
            return String(localized: "payment_exception_core_disallowed_subscription", bundle: .module)
        }
    }
}

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

extension PaymentNetworkErrorCode {
    /// The localized message shown for this error code.
    var message: String {
        switch self {
        case .failedToParse:
            return String(localized: "payment_exception_network_failed_to_parse", bundle: .module)
        case .coreFailure:
            return String(localized: "payment_exception_network_internal", bundle: .module)
        case .unreachable:
            return String(localized: "payment_exception_network_unreachable", bundle: .module)
        case .conflict:
            return String(localized: "payment_exception_network_conflict", bundle: .module)
        case .failedWithCode:
            return String(localized: "payment_exception_network_failed_with_code", bundle: .module)
        case .misdirectedRequest:
            return String(localized: "payment_exception_network_misdirected_request", bundle: .module)
        case .requestTimeout:
            return String(localized: "payment_exception_network_request_timeout", bundle: .module)
        case .server:
            return String(localized: "payment_exception_network_server", bundle: .module)
        case .tooManyRequests:
            return String(localized: "payment_exception_network_too_many_requests", bundle: .module)
        case .unprocessableEntity:
            return String(localized: "payment_exception_network_unprocessable_entity", bundle: .module)
        case .badGateway:
            return String(localized: "payment_exception_network_bad_gateway", bundle: .module)
        case .badRequest:
            return String(localized: "payment_exception_network_bad_request", bundle: .module)
        case .forbidden:
            return String(localized: "payment_exception_network_forbidden", bundle: .module)
        case .internalServerError:
            return String(localized: "payment_exception_network_internal_server_error", bundle: .module)
        case .networkNotAvailable:
            return String(localized: "payment_exception_network_network_not_available", bundle: .module)
        case .notFound:
            return String(localized: "payment_exception_network_not_found", bundle: .module)
        case .notImplemented:
            return String(localized: "payment_exception_network_not_implemented", bundle: .module)
        case .serviceUnavailable:
            return String(localized: "payment_exception_network_service_unavailable", bundle: .module)
        case .unauthorized:
            return String(localized: "payment_exception_network_unauthorized", bundle: .module)
        }
    }
}

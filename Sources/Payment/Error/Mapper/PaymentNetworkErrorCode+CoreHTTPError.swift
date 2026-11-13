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

extension PaymentNetworkErrorCode {
    /// Creates the network error code for a core HTTP error.
    ///
    /// - Parameter error: The core HTTP error to map.
    init(from error: CoreHTTPError) {
        switch error {
        case .RequestTimeout:
            self = .requestTimeout
        case .Conflict:
            self = .conflict
        case .MisdirectedRequest:
            self = .misdirectedRequest
        case .UnprocessableEntity:
            self = .unprocessableEntity
        case .TooManyRequests:
            self = .tooManyRequests
        case .Server(_):
            self = .server
        case .FailedWithCode(_):
            self = .failedWithCode
        case .FailedToParse(_):
            self = .failedToParse
        case .FfiError(_):
            self = .coreFailure
        case .Unreachable(_):
            self = .unreachable
        case .BadGateway:
            self = .badGateway
        case .BadRequest:
            self = .badRequest
        case .Forbidden:
            self = .forbidden
        case .InternalServerError:
            self = .internalServerError
        case .NetworkNotAvailable:
            self = .networkNotAvailable
        case .NotFound:
            self = .notFound
        case .NotImplemented:
            self = .notImplemented
        case .ServiceUnavailable:
            self = .serviceUnavailable
        case .Unauthorized:
            self = .unauthorized
        }
    }
}

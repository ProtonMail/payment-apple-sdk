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

/// Error codes for networking (HTTP) failures.
///
/// Raw values fall in the 2xx range.
public enum PaymentNetworkErrorCode: Int, Sendable {
    /// The response body could not be parsed.
    case failedToParse = 201

    /// An unclassified error occurred inside the HTTP layer.
    case coreFailure = 202

    /// The host could not be reached.
    case unreachable = 203

    /// The request conflicts with the current state of the resource.
    ///
    /// Corresponds to HTTP status 409.
    case conflict = 204

    /// The request failed with an API status code that has no more specific mapping.
    case failedWithCode = 205

    /// The request was directed at a server that cannot produce a response.
    ///
    /// Corresponds to HTTP status 421.
    case misdirectedRequest = 206

    /// The server timed out waiting for the request.
    ///
    /// Corresponds to HTTP status 408.
    case requestTimeout = 207

    /// The server returned an unclassified error response.
    case server = 208

    /// The client has sent too many requests and should retry later.
    ///
    /// Corresponds to HTTP status 429.
    case tooManyRequests = 209

    /// The request was well-formed but semantically invalid.
    ///
    /// Corresponds to HTTP status 422.
    case unprocessableEntity = 210

    /// An upstream server returned an invalid response.
    ///
    /// Corresponds to HTTP status 502.
    case badGateway = 211

    /// The request was malformed.
    ///
    /// Corresponds to HTTP status 400.
    case badRequest = 212

    /// The session is not permitted to access the resource.
    ///
    /// Corresponds to HTTP status 403.
    case forbidden = 213

    /// The server encountered an unexpected error.
    ///
    /// Corresponds to HTTP status 500.
    case internalServerError = 214

    /// The device has no network connection available.
    case networkNotAvailable = 215

    /// The requested resource does not exist.
    ///
    /// Corresponds to HTTP status 404.
    case notFound = 216

    /// The server does not support the requested functionality.
    ///
    /// Corresponds to HTTP status 501.
    case notImplemented = 217

    /// The server is temporarily unable to handle the request.
    ///
    /// Corresponds to HTTP status 503.
    case serviceUnavailable = 218

    /// The session is missing or no longer valid.
    ///
    /// Corresponds to HTTP status 401.
    case unauthorized = 219
}

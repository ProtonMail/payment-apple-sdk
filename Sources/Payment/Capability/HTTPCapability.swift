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

/// Defines the HTTP operations the SDK requires.
///
/// Implement this protocol to provide HTTP request handling to the SDK. The SDK delegates request execution to the
/// consumer, keeping the SDK agnostic of session lifecycle, authentication, and user.
///
/// Implementations must return an ``HTTPResponse`` for any request that receives an HTTP response, including non-2xx
/// statuses. The SDK uses the status code to decide whether a failed call should be retried. Only throw when no HTTP
/// response was received at all.
public protocol HTTPCapability: Sendable {
    /// Makes a GET request to the given endpoint.
    ///
    /// - Parameter endpoint: The URI to execute a request on.
    /// - Returns: The response, wrapped in an ``HTTPResponse``.
    /// - Throws: An error only when no HTTP response was received, such as on a transport failure or cancellation.
    func get(endpoint: String) async throws -> HTTPResponse

    /// Makes a generic POST request.
    ///
    /// - Parameters:
    ///   - endpoint: The URI to execute a request on.
    ///   - body: The request body to post, or `nil` to send none.
    /// - Returns: The response, wrapped in an ``HTTPResponse``.
    /// - Throws: An error only when no HTTP response was received, such as on a transport failure or cancellation.
    func post(endpoint: String, body: Data?) async throws -> HTTPResponse
}

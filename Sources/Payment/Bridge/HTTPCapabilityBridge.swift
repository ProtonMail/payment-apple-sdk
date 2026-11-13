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
import PaymentCore

/// Bridges the consumer's HTTP capability and the core's HTTP interface.
///
/// This is so that the raw FFI types can be kept internal to the SDK, and only domain models and protocols are
/// exposed.
final class HTTPCapabilityBridge: CoreHTTPCapability {
    // MARK: Properties

    private let httpCapability: any HTTPCapability

    // MARK: Initialization

    /// Creates a bridge that forwards the core's requests to an HTTP capability.
    ///
    /// - Parameter capability: The consumer's capability that performs the requests.
    init(capability: any HTTPCapability) {
        self.httpCapability = capability
    }

    // MARK: Request

    /// Sends a core request through the consumer's HTTP capability.
    ///
    /// - Parameter request: The request the core wants to send.
    /// - Returns: The encoded response.
    /// - Throws: `CoreHTTPError` if the request fails.
    func sendRequest(request: CoreHTTPRequest) async throws -> Data {
        do {
            let response: HTTPResponse

            switch request.method {
            case .get:
                response = try await httpCapability.get(endpoint: request.endpoint)
            case .post:
                response = try await httpCapability.post(endpoint: request.endpoint, body: request.body)
            case .put, .patch, .delete:
                throw HTTPError.unsupportedMethod("Method \(request.method) is unsupported")
            }

            return try response.encoded()
        } catch {
            throw CoreHTTPError(from: error)
        }
    }
}

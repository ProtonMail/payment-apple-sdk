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

/// A generic wrapper for raw HTTP responses returned from network operations.
///
/// The response mirrors the shape the core expects.
public struct HTTPResponse {
    /// The HTTP status code.
    public let status: Int

    /// The decoded JSON body.
    public let body: [String: Any]

    /// Creates a response from a status code and a decoded JSON body.
    ///
    /// - Parameters:
    ///   - status: The HTTP status code.
    ///   - body: The decoded JSON body.
    public init(status: Int, body: [String: Any]) {
        self.status = status
        self.body = body
    }
}

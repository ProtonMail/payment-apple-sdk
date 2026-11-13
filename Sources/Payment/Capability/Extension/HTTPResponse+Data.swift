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

extension HTTPResponse {
    /// Converts this response to JSON data in the shape the core expects.
    ///
    /// - Returns: The encoded response object.
    /// - Throws: ``HTTPError/responseEncodingFailed`` if the body isn't a valid JSON object.
    func encoded() throws -> Data {
        let outputObject: [String: Any] = ["status": status, "body": body]

        guard
            JSONSerialization.isValidJSONObject(outputObject)
        else {
            throw HTTPError.responseEncodingFailed
        }

        return try JSONSerialization.data(withJSONObject: outputObject)
    }
}

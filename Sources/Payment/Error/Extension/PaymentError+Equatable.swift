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

extension PaymentError: Equatable {
    public static func == (left: PaymentError, right: PaymentError) -> Bool {
        func equal<Code: Equatable, Cause: Equatable>(
            code: (left: Code, right: Code),
            cause: (left: any Error, right: any Error),
            as _: Cause.Type,
        ) -> Bool {
            guard
                let leftCause = cause.left as? Cause,
                let rightCause = cause.right as? Cause
            else {
                // Unexpected type on both sides: use reflection so the same value still equals itself.
                return code.left == code.right && String(reflecting: cause.left) == String(reflecting: cause.right)
            }

            return code.left == code.right && leftCause == rightCause
        }

        switch (left, right) {
        case (
            .core(let leftCode, let leftCause),
            .core(let rightCode, let rightCause),
        ):
            return equal(code: (leftCode, rightCode), cause: (leftCause, rightCause), as: CoreError.self)
        case (
            .network(let leftCode, let leftCause),
            .network(let rightCode, let rightCause),
        ):
            return equal(code: (leftCode, rightCode), cause: (leftCause, rightCause), as: CoreHTTPError.self)
        case (
            .store(let leftCode, let leftCause),
            .store(let rightCode, let rightCause),
        ):
            return equal(code: (leftCode, rightCode), cause: (leftCause, rightCause), as: CoreStoreError.self)
        case (
            .other(let leftCode, let leftCause),
            .other(let rightCode, let rightCause),
        ):
            return leftCode == rightCode && String(reflecting: leftCause) == String(reflecting: rightCause)
        case (
            .configuration(let leftCode, let leftCause),
            .configuration(let rightCode, let rightCause),
        ):
            return leftCode == rightCode && String(reflecting: leftCause) == String(reflecting: rightCause)
        default:
            return false
        }
    }
}

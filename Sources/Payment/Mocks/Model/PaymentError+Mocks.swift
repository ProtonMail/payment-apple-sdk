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
    static let mocks: [PaymentError] = [
        makeCoreMock(),
        makeNetworkMock(),
        makeStoreMock(),
        makeOtherMock(),
        makeConfigurationMock(),
    ]

    static func makeCoreMock(
        code: PaymentCoreErrorCode = .parsing,
        debugMessage: String = "Sample response could not be parsed",
    ) -> PaymentError {
        .core(code: code, cause: CoreError.Parsing(debugMessage))
    }

    static func makeNetworkMock(
        code: PaymentNetworkErrorCode = .unreachable,
        debugMessage: String = "Sample server could not be reached",
    ) -> PaymentError {
        .network(code: code, cause: CoreHTTPError.Unreachable(debugMessage))
    }

    static func makeStoreMock(
        code: PaymentStoreErrorCode = .unavailable,
        debugMessage: String = "Sample store is unavailable",
    ) -> PaymentError {
        .store(code: code, cause: CoreStoreError.StoreUnavailable(debugMessage))
    }

    static func makeOtherMock(
        code: PaymentOtherErrorCode = .unexpected,
        cause: any Error = MockUnexpectedPaymentError(),
    ) -> PaymentError {
        .other(code: code, cause: cause)
    }

    static func makeConfigurationMock(
        code: PaymentConfigurationErrorCode = .missingBundleIdentifier,
        cause: any Error = MissingBundleIdentifierError(),
    ) -> PaymentError {
        .configuration(code: code, cause: cause)
    }
}

private struct MockUnexpectedPaymentError: Error {}

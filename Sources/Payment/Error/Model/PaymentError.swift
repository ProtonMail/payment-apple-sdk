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

/// Represents a failure originating from the Payment SDK.
public enum PaymentError: Error, Sendable {
    /// An error originating from the internal SDK core.
    ///
    /// - Parameters:
    ///   - code: The code for the error.
    ///   - cause: The underlying error.
    case core(
        code: PaymentCoreErrorCode,
        cause: any Error,
    )

    /// A network or API-layer error.
    ///
    /// - Parameters:
    ///   - code: The code for the error.
    ///   - cause: The underlying error.
    case network(
        code: PaymentNetworkErrorCode,
        cause: any Error,
    )

    /// An in-app purchase store error.
    ///
    /// - Parameters:
    ///   - code: The code for the error.
    ///   - cause: The underlying error.
    case store(
        code: PaymentStoreErrorCode,
        cause: any Error,
    )

    /// An unknown or unexpected error.
    ///
    /// - Parameters:
    ///   - code: The code for the error.
    ///   - cause: The underlying error.
    case other(
        code: PaymentOtherErrorCode,
        cause: any Error,
    )

    /// An error caused by missing or invalid configuration in the host app.
    ///
    /// - Parameters:
    ///   - code: The code for the error.
    ///   - cause: The underlying error.
    case configuration(
        code: PaymentConfigurationErrorCode,
        cause: any Error,
    )
}

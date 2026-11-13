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

func paymentErrorDebugMessage(from error: any Error) -> String? {
    switch error {
    case let error as CoreError:
        return paymentErrorDebugMessage(from: error)
    case let error as CoreHTTPError:
        return paymentErrorDebugMessage(from: error)
    case let error as CoreStoreError:
        return paymentErrorDebugMessage(from: error)
    default:
        return nil
    }
}

private func paymentErrorDebugMessage(from error: CoreError) -> String? {
    switch error {
    case .Http(let error):
        return paymentErrorDebugMessage(from: error)
    case .Iap(let error):
        return paymentErrorDebugMessage(from: error)
    case .Logging(let message),
        .Parsing(let message),
        .TokenPolling(let message),
        .DisabledVendor(let message),
        .DisallowedSubscription(let message):
        return message
    default:
        return nil
    }
}

private func paymentErrorDebugMessage(from error: CoreHTTPError) -> String? {
    switch error {
    case .Server(let code), .FailedWithCode(let code):
        return String(code)
    case .FailedToParse(let message), .FfiError(let message), .Unreachable(let message):
        return message
    default:
        return nil
    }
}

private func paymentErrorDebugMessage(from error: CoreStoreError) -> String? {
    switch error {
    case .FfiError(let message),
        .Acknowledgement(let message),
        .FetchProducts(let message),
        .Purchase(let message),
        .StoreUnavailable(let message):
        return message
    case .NoUnfinishedTransactionFound:
        return nil
    }
}

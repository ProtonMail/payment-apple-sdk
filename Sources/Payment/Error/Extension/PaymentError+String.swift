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

extension PaymentError {
    /// A localized message suitable for showing to a user.
    public var message: String {
        switch self {
        case .core(let code, _):
            return code.message
        case .network(let code, _):
            return code.message
        case .store(let code, _):
            return code.message
        case .other(let code, _):
            return code.message
        case .configuration(let code, _):
            return code.message
        }
    }

    /// Additional information about the error for debugging, when available.
    public var debugMessage: String? {
        switch self {
        case .core(_, let cause),
            .network(_, let cause),
            .store(_, let cause),
            .other(_, let cause),
            .configuration(_, let cause):
            return paymentErrorDebugMessage(from: cause)
        }
    }
}

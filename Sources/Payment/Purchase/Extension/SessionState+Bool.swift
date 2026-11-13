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

extension SessionState {
    private func purchasing() -> Bool {
        switch self {
        case .purchasing(.inFlight),
            .purchasing(.terminal(.awaitingReceipt)),
            .purchasing(.terminal(.readyToReconcile)):
            true
        default:
            false
        }
    }

    private func reconciling() -> Bool {
        switch self {
        case .reconciling(.inFlight), .reconciling(.resolving):
            true
        default:
            false
        }
    }

    /// Indicates whether a purchase flow is in progress.
    ///
    /// An in-progress state is any in-flight state, or one of the three non-final states that transition to another
    /// in-flight state:
    /// - ``PurchasingTerminal/awaitingReceipt``
    /// - ``PurchasingTerminal/readyToReconcile``
    /// - ``Reconciling/resolving``
    ///
    /// - Returns: `true` when the session state is not a final state, `false` otherwise.
    public func transacting() -> Bool {
        purchasing() || reconciling()
    }
}

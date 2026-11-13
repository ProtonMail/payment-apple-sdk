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

extension SessionState {
    // MARK: Session State

    /// Creates a session state from its core equivalent, treating an absent state as idle.
    ///
    /// The core reports no state before the first session begins, which is indistinguishable from being between
    /// sessions.
    ///
    /// - Parameter state: The core session state to map.
    init(from state: CoreSessionState?) {
        switch state {
        case .purchasing(let purchasingState):
            self = SessionState(from: purchasingState)
        case .reconciling(let reconcilingState):
            self = SessionState(from: reconcilingState)
        case .idle, nil:
            self = .idle
        }
    }

    // MARK: - Purchasing

    private init(from state: CorePurchasing) {
        switch state {
        case .inFlight(let purchasingInFlightState):
            self = SessionState(from: purchasingInFlightState)
        case .terminal(let purchasingTerminalState):
            self = SessionState(from: purchasingTerminalState)
        }
    }

    // MARK: - Purchasing In Flight

    private init(from state: CorePurchasingInFlight) {
        switch state {
        case .checkingSubscription:
            self = .purchasing(.inFlight(.checkingSubscriptionValidity))
        case .processingPurchaseRequest:
            self = .purchasing(.inFlight(.processingPurchaseRequest))
        case .purchasing:
            self = .purchasing(.inFlight(.purchasing))
        }
    }

    // MARK: - Purchasing Terminal

    private init(from state: CorePurchasingTerminal) {
        switch state {
        case .awaitingReceipt:
            self = .purchasing(.terminal(.awaitingReceipt))
        case .readyToReconcile:
            self = .purchasing(.terminal(.readyToReconcile))
        case .modificationScheduled:
            self = .purchasing(.terminal(.modificationScheduled))
        case .cancelled:
            self = .purchasing(.terminal(.canceled))
        case .failure(let error):
            self = .purchasing(.terminal(.failure(PaymentError(from: error))))
        }
    }

    // MARK: - Reconciling

    private init(from state: CoreReconciling) {
        switch state {
        case .inFlight(let reconcilingInFlightState):
            self = SessionState(from: reconcilingInFlightState)
        case .terminal(let reconcilingTerminalState):
            self = SessionState(from: reconcilingTerminalState)
        case .resolving:
            self = .reconciling(.resolving)
        }
    }

    // MARK: - Reconciling In Flight

    private init(from state: CoreReconcilingInFlight) {
        switch state {
        case .acknowledging:
            self = .reconciling(.inFlight(.acknowledging))
        case .awaitingTokenValidation:
            self = .reconciling(.inFlight(.awaitingTokenValidation))
        case .creatingNewSubscription:
            self = .reconciling(.inFlight(.creatingNewSubscription))
        case .postingToken:
            self = .reconciling(.inFlight(.postingToken))
        }
    }

    // MARK: - Reconciling Terminal

    private init(from state: CoreReconcilingTerminal) {
        switch state {
        case .failure(let error):
            self = .reconciling(.terminal(.failure(PaymentError(from: error))))
        case .pendingAccountCreation:
            self = .reconciling(.terminal(.pendingAccountCreation))
        case .success(let reconciledPurchase):
            self = .reconciling(.terminal(.success(ReconciledPurchase(from: reconciledPurchase))))
        }
    }
}

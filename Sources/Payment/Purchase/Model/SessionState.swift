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

// MARK: - SessionState

/// The state of the SDK's purchase session.
///
/// A session starts ``SessionState/idle``, moves through ``SessionState/purchasing(_:)`` while the store transaction
/// is carried out, and then through ``SessionState/reconciling(_:)`` while the resulting receipt is exchanged with
/// Proton's backend and the subscription is created. Both phases separate their transient, in-flight states from
/// their terminal end states.
///
/// Use ``SessionState/transacting()`` to test whether a flow is still in progress.
public enum SessionState: Sendable, Equatable {
    /// An inactive state, with no transaction in flight.
    case idle

    /// A transaction is in the purchasing phase.
    ///
    /// A product is being purchased, and the payment is being facilitated and processed.
    case purchasing(Purchasing)

    /// A receipt for the purchase was received, and the transaction is in the reconciliation phase.
    ///
    /// The purchase must be confirmed and consumed within Proton's systems.
    case reconciling(Reconciling)
}

// MARK: - Purchasing

/// The steps of a purchase session's purchasing phase.
public enum Purchasing: Sendable, Equatable {
    /// The purchasing phase is actively ongoing.
    case inFlight(PurchasingInFlight)

    /// The purchasing phase has reached a terminal step.
    case terminal(PurchasingTerminal)
}

/// The in-progress steps of a purchase session's purchasing phase.
public enum PurchasingInFlight: Sendable, Equatable {
    /// Checking whether the projected subscription is valid.
    case checkingSubscriptionValidity

    /// A purchase has been initiated via user action.
    case processingPurchaseRequest

    /// A purchase is in progress, and a purchase result is awaited.
    case purchasing
}

/// The final steps of a purchase session's purchasing phase.
public enum PurchasingTerminal: Sendable, Equatable {
    /// The purchase was accepted, or awaits approval, and its receipt is awaited asynchronously.
    case awaitingReceipt

    /// A receipt for the successful purchase was received.
    case readyToReconcile

    /// The store accepted a subscription change for the next renewal. The current subscription remains active.
    ///
    /// This completes the purchase session without reconciliation. The scheduled change may later be canceled
    /// or replaced, and takes effect only if the subscription renews successfully.
    case modificationScheduled

    /// The user canceled the purchase, and no transaction was initiated.
    case canceled

    /// A purchase failed.
    ///
    /// The associated value contains the cause of the failure.
    case failure(PaymentError)
}

// MARK: - Reconciling

/// The steps of a purchase session's reconciliation phase.
public enum Reconciling: Sendable, Equatable {
    /// Determining the step at which reconciliation should start.
    case resolving

    /// The reconciliation phase is actively ongoing.
    case inFlight(ReconcilingInFlight)

    /// The reconciliation phase has reached a terminal step.
    case terminal(ReconcilingTerminal)
}

/// The in-progress steps of a purchase session's reconciliation phase.
public enum ReconcilingInFlight: Sendable, Equatable {
    /// The purchase receipt is being tokenized, whereby it is exchanged for an internal system token.
    case postingToken

    /// The system token is waiting to be provisioned for usage.
    case awaitingTokenValidation

    /// The system token is being used to register the new subscription.
    case creatingNewSubscription

    /// The purchase has been reconciled, and the store provider is being told the user received their entitlements.
    case acknowledging
}

/// The final steps of a purchase session's reconciliation phase.
public enum ReconcilingTerminal: Sendable, Equatable {
    /// Reconciliation was attempted with a credential-less user session.
    ///
    /// Purchases can only be reconciled on full-fledged accounts; this state indicates that account creation is needed.
    case pendingAccountCreation

    /// Reconciliation was successful, and the transaction is complete.
    ///
    /// The associated value is the purchase that was successfully reconciled.
    case success(ReconciledPurchase)

    /// Reconciliation failed.
    ///
    /// The associated value contains the cause of the failure.
    case failure(PaymentError)
}

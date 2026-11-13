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

/// Error codes for failures originating from the internal SDK core.
///
/// Raw values fall in the 1xx range.
public enum PaymentCoreErrorCode: Int, Sendable {
    /// In-app purchases are disabled for the user, so products cannot be fetched.
    case disabledPaymentMethod = 101

    /// The core's logging could not be set up.
    case logging = 102

    /// The core could not parse a response it received.
    case parsing = 103

    /// Polling for the payment token's validation outcome failed.
    case tokenPolling = 104

    /// Reconciliation was attempted on a credential-less session.
    ///
    /// Purchases can only be reconciled once the account has credentials.
    case credentialLessReconcile = 105

    /// The selected offer has no token, so the purchase cannot identify which offer to buy.
    case missingOfferToken = 106

    /// The purchase being recovered belongs to a different account than the current session.
    case recoverFlowUserMisalignment = 107

    /// A purchase session is already in progress.
    ///
    /// Only one may run at a time.
    case sessionInProgress = 108

    /// The current platform does not support purchases.
    case unsupportedPlatform = 109

    /// The requested subscription is not one this account is allowed to purchase.
    case disallowedSubscription = 110
}

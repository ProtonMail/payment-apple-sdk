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
import PaymentCore

/// The composition root for the SDK and its internal core dependencies.
///
/// The container isn't exposed to consumers, so that ``Payments`` only provides public client protocols.
final class PaymentContainer {
    // MARK: - Core

    private let paymentCore: DefaultPaymentCore

    // MARK: - Repositories

    /// The repository for store products, purchases, and transactions.
    let billingRepository: any BillingRepository

    /// The repository for the product catalog.
    let productRepository: any ProductRepository

    /// The repository for purchase flows and session state.
    let purchaseRepository: any PurchaseRepository

    /// The repository for the user's subscriptions.
    let subscriptionRepository: any SubscriptionRepository

    // MARK: - Observers

    private let observabilityWorker: any ObservabilityWorker
    private let storePurchaseUpdatesObserver: any StorePurchaseUpdatesObserver

    /// The observer that publishes purchase session state updates.
    let sessionStateObserver: any SessionStateObserver

    // MARK: - Constructor

    /// Creates the SDK's dependency graph and starts its background work.
    ///
    /// - Parameter httpCapability: The consumer's capability that performs HTTP requests for the SDK.
    init(httpCapability: any HTTPCapability) {
        let bundleIdentifier = Bundle.main.bundleIdentifier

        self.billingRepository = AppStoreBillingRepository()
        self.paymentCore = DefaultPaymentCore(
            http: HTTPCapabilityBridge(capability: httpCapability),
            iap: StoreCapability(billingRepository: self.billingRepository),
            time: TimeCapability(),
            store: StorageCapability(),
            telemetryConsent: TelemetryCapability(),
        )
        self.productRepository = DefaultProductRepository(paymentCore: self.paymentCore)
        self.purchaseRepository = DefaultPurchaseRepository(
            paymentCore: self.paymentCore,
            bundleIdentifier: bundleIdentifier,
        )
        self.subscriptionRepository = DefaultSubscriptionRepository(paymentCore: self.paymentCore)

        // TODO: Consider abstracting into separate function.
        try? paymentCore.startLogging(level: .debug, logger: LogCapability())

        self.observabilityWorker = DefaultObservabilityWorker(paymentCore: self.paymentCore)
        self.storePurchaseUpdatesObserver = DefaultStorePurchaseUpdatesObserver(
            billingRepository: self.billingRepository,
            purchaseRepository: self.purchaseRepository,
        )
        self.sessionStateObserver = DefaultSessionStateObserver(purchaseRepository: self.purchaseRepository)

        startObservabilityWorker()
        startCollectingStorePurchaseUpdates()
        startCollectingSessionStateUpdates()
    }

    // MARK: - Initializers

    private func startObservabilityWorker() {
        self.observabilityWorker.start()
    }

    private func startCollectingStorePurchaseUpdates() {
        self.storePurchaseUpdatesObserver.start()
    }

    private func startCollectingSessionStateUpdates() {
        self.sessionStateObserver.start()
    }
}

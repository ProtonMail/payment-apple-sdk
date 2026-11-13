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

import Observation
import Payment

@MainActor
@Observable
/// The view model backing the subscription management screen.
///
/// Loads subscriptions and products when the screen appears and refreshes them whenever a purchase reconciles
/// successfully. Session state updates track progress and reconciliation outcomes.
final class SubscriptionManagementViewModel {
    // MARK: - Properties

    private let payments: Payments
    @ObservationIgnored private var effectContinuation: AsyncStream<SubscriptionManagementEffect>.Continuation?

    /// A resource that, when successful, contains the available products.
    private(set) var products: Resource<[Product]> = .idle

    /// A resource that, when successful, contains the active subscriptions.
    private(set) var subscriptions: Resource<[Subscription]> = .idle

    /// Indicates whether a purchase is currently in progress.
    private(set) var isTransacting: Bool = false

    // MARK: - Initialization

    /// Creates a view model backed by the given SDK instance.
    ///
    /// - Parameter payments: The SDK entry point.
    init(payments: Payments) {
        self.payments = payments
    }

    // MARK: - Data fetching

    private func fetchProducts() async {
        products = .loading

        do {
            let result = try await payments.products.all()
            products = .success(result)
        } catch let error {
            products = .error(error)
        }
    }

    private func fetchSubscriptions() async {
        subscriptions = .loading

        do {
            let result = try await payments.subscriptions.all()
            subscriptions = .success(result)
        } catch let error {
            subscriptions = .error(error)
        }
    }

    /// Loads the user's active subscriptions and the purchasable products concurrently.
    func loadDataSources() async {
        async let subscriptions = fetchSubscriptions()
        async let products = fetchProducts()

        _ = await (subscriptions, products)
    }

    // MARK: - Effects

    /// Subscribes to transient UI effects, replacing the previous screen subscription.
    ///
    /// - Returns: A stream that buffers the latest effect while the screen is subscribed.
    func effects() -> AsyncStream<SubscriptionManagementEffect> {
        effectContinuation?.finish()
        return AsyncStream(bufferingPolicy: .bufferingNewest(1)) { continuation in
            effectContinuation = continuation
        }
    }

    // MARK: - Session state

    /// Tracks purchase session state updates.
    func observeSessionStates() async {
        for await state in await payments.purchase.sessionStates() {
            isTransacting = state.transacting()

            switch state {
            case .purchasing(.terminal(.failure(let error))), .reconciling(.terminal(.failure(let error))):
                effectContinuation?.yield(.transactionFailed(error))
            case .reconciling(.terminal(.success)):
                await loadDataSources()
            default:
                break
            }
        }
    }

    // MARK: - Events

    /// Initiates a purchase and emits any resulting notification.
    ///
    /// - Parameters:
    ///   - productID: The unique product identifier.
    ///   - offer: The selected product offer.
    func purchase(productID: ProductID, offer: Offer) async {
        // Session observation owns failure notifications.
        if case .modificationScheduled? = try? await payments.purchase.initiate(productID: productID, offer: offer) {
            effectContinuation?.yield(.modificationScheduled)
        }
    }

    deinit {
        effectContinuation?.finish()
    }
}

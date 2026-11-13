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

/// A store purchase updates observer that handles each update the store emits.
actor DefaultStorePurchaseUpdatesObserver: StorePurchaseUpdatesObserver {
    // MARK: - Properties

    private let billingRepository: any BillingRepository
    private let purchaseRepository: any PurchaseRepository
    private var updatesTask: Task<Void, Never>?

    // MARK: - Initialization

    /// Creates an observer of a billing repository's purchase updates.
    ///
    /// - Parameters:
    ///   - billingRepository: The repository whose purchase updates to observe.
    ///   - purchaseRepository: The repository that reconciles successful purchases and records failures.
    init(
        billingRepository: any BillingRepository,
        purchaseRepository: any PurchaseRepository,
    ) {
        self.billingRepository = billingRepository
        self.purchaseRepository = purchaseRepository
    }

    // MARK: - Conformance

    nonisolated func start() {
        Task {
            await collect()
        }
    }

    // MARK: - Observation

    private func collect() {
        updatesTask = Task {
            for await update in billingRepository.purchaseUpdates {
                await handle(update)
            }
        }
    }

    /// Handles a single purchase update.
    ///
    /// - Parameter update: The purchase update to handle.
    func handle(_ update: StorePurchaseUpdate) async {
        switch update {
        case .success(let storePurchase):
            try? await purchaseRepository.reconcile(storePurchase)
        case .failure(let error):
            purchaseRepository.fail(error)
        case .canceled, .pending, .modificationScheduled:
            break
        }
    }

    // MARK: - Cleanup

    deinit {
        updatesTask?.cancel()
    }
}

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

/// A session state observer that polls the core in its own task.
actor DefaultSessionStateObserver: SessionStateObserver {
    // MARK: - Properties

    private let purchaseRepository: any PurchaseRepository
    private var sessionStatesTask: Task<Void, Never>?
    private var latestState: SessionState?
    private var subscribers: [UUID: AsyncStream<SessionState>.Continuation] = [:]

    // MARK: - Initialization

    /// Creates a session state observer that polls the given repository.
    ///
    /// - Parameter purchaseRepository: The repository that supplies each new session state.
    init(purchaseRepository: any PurchaseRepository) {
        self.purchaseRepository = purchaseRepository
    }

    // MARK: - Conformance

    nonisolated func start() {
        Task {
            await collect()
        }
    }

    func observe() -> AsyncStream<SessionState> {
        let id = UUID()
        let (updates, emitter) = AsyncStream<SessionState>.makeStream()

        subscribers[id] = emitter
        if let latestState {
            emitter.yield(latestState)
        }
        emitter.onTermination = { [self] _ in
            Task {
                await self.removeSubscriber(id: id)
            }
        }

        return updates
    }

    // MARK: - Observation

    private func collect() {
        sessionStatesTask = Task {
            while !Task.isCancelled {
                let state = await purchaseRepository.nextSessionState()
                latestState = state

                for emitter in subscribers.values {
                    emitter.yield(state)
                }
            }
        }
    }

    // MARK: - Cleanup

    private func removeSubscriber(id: UUID) {
        subscribers[id] = nil
    }

    deinit {
        sessionStatesTask?.cancel()
    }
}

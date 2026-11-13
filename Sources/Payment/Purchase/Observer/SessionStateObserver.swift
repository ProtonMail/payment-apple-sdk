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

/// Polls the current session state from the core and broadcasts it to subscribers.
protocol SessionStateObserver: Sendable {
    /// A stream of session state updates.
    ///
    /// Each subscriber receives the latest known state, if available, followed by subsequent updates.
    ///
    /// - Returns: A stream of session state updates.
    func observe() async -> AsyncStream<SessionState>

    /// Manually initializes the state polling mechanism.
    ///
    /// The observer polls the core for the current session state.
    nonisolated func start()
}

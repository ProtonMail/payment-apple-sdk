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

/// Provides the time operations the SDK requires.
///
/// At the moment, this class lets the core suspend for a period of time.
final class TimeCapability: CoreTimeCapability {
    /// Suspends the caller for a period of time.
    ///
    /// - Parameter milliseconds: The length of the delay, in milliseconds.
    func delay(milliseconds: UInt64) async {
        do {
            try await Task.sleep(for: .milliseconds(milliseconds))
        } catch {
            // If the Task is canceled we return, delay() is non-throwing.
        }
    }
}

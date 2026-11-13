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
import SwiftUI

@MainActor
@Observable
/// An object that displays one toast message at a time.
final class ToastPresenter {
    /// The toast currently on screen.
    private(set) var currentToast: ToastConfig?
    @ObservationIgnored private var dismissTask: Task<Void, Never>?

    /// Shows a toast, replacing any toast already on screen.
    ///
    /// - Parameter toast: The toast to show.
    func show(_ toast: ToastConfig) {
        currentToast = toast
        AccessibilityNotification.Announcement(toast.message).post()

        dismissTask?.cancel()
        dismissTask = Task { [weak self] in
            do {
                try await Task.sleep(for: .seconds(toast.duration))
            } catch {
                return
            }
            self?.currentToast = nil
        }
    }

    deinit {
        dismissTask?.cancel()
    }
}

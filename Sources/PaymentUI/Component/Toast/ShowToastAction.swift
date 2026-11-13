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

import SwiftUI

/// An action that shows a toast message through a toast presenter.
struct ShowToastAction {
    /// The presenter that displays toasts.
    let presenter: ToastPresenter?

    private let colors: PaymentColors

    /// Creates a toast action.
    ///
    /// - Parameters:
    ///   - presenter: The presenter that displays toasts.
    ///   - colors: The palette used to style toast messages.
    init(presenter: ToastPresenter? = nil, colors: PaymentColors = .default) {
        self.presenter = presenter
        self.colors = colors
    }

    /// Shows an error message using the theme's error color.
    ///
    /// - Parameter message: The text to display.
    @MainActor
    func error(message: String) {
        presenter?
            .show(
                .init(message: message, backgroundColor: colors.danger, foregroundColor: .white))
    }

    /// Shows an informational message using the theme's inverted colors.
    ///
    /// - Parameter message: The text to display.
    @MainActor
    func info(message: String) {
        presenter?
            .show(
                .init(
                    message: message,
                    backgroundColor: colors.foreground,
                    foregroundColor: colors.background,
                ))
    }
}

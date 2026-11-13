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

/// A view modifier that overlays the current toast message along the bottom edge of its content.
struct PresentToastsModifier: ViewModifier {
    @Environment(\.showToast) private var showToast
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private var presenter: ToastPresenter? { showToast.presenter }

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                if let toast = presenter?.currentToast {
                    ToastView(
                        message: toast.message, backgroundColor: toast.backgroundColor,
                        foregroundColor: toast.foregroundColor,
                    )
                    .transition(reduceMotion ? .opacity : .move(edge: .bottom).combined(with: .opacity))
                    .padding(.bottom)
                }
            }
            .animation(.easeInOut, value: presenter?.currentToast != nil)
    }
}

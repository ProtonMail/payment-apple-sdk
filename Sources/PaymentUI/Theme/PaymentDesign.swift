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

/// The semantic layout values that the payment views use.
public struct PaymentDesign: Sendable {
    // MARK: - Properties

    /// The corner radius applied to surface content, such as cards.
    public var borderRadiusLarge: CGFloat

    /// The corner radius applied to buttons, toasts, and other smaller elements.
    public var borderRadiusMedium: CGFloat

    // MARK: - Initializer

    /// Creates a set of design values.
    ///
    /// - Parameters:
    ///   - borderRadiusLarge: The corner radius applied to surface content, such as cards.
    ///   - borderRadiusMedium: The corner radius applied to buttons, toasts, and other smaller elements.
    public init(
        borderRadiusLarge: CGFloat = Self.defaultBorderRadiusLarge,
        borderRadiusMedium: CGFloat = Self.defaultBorderRadiusMedium,
    ) {
        self.borderRadiusLarge = borderRadiusLarge
        self.borderRadiusMedium = borderRadiusMedium
    }

    // MARK: - Defaults

    /// The built-in design values.
    public static let `default`: PaymentDesign = PaymentDesign()

    /// The built-in corner radius for surface content, such as cards.
    public static let defaultBorderRadiusLarge: CGFloat = 12.0

    /// The built-in corner radius for buttons, toasts, and other smaller elements.
    public static let defaultBorderRadiusMedium: CGFloat = 8.0
}

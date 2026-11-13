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

/// The semantic colors that the payment views use.
public struct PaymentColors: Sendable {
    // MARK: - Properties

    /// The accent color for buttons, icons, progress indicators, and other highlighted elements.
    public var primary: Color

    /// The accent color for buttons in a loading state.
    public var primaryDisabled: Color

    /// The background color for surface content, such as cards.
    public var background: Color

    /// The color of titles and other primary text content.
    public var foreground: Color

    /// The color of secondary text content, such as descriptions.
    public var mutedForeground: Color

    /// The color of text and icons displayed on the accent color.
    public var primaryForeground: Color

    /// The color of text and icons displayed on the disabled accent color.
    public var primaryForegroundDisabled: Color

    /// The color for error messages.
    public var danger: Color

    /// The color of borders around surface content, such as cards.
    public var border: Color

    // MARK: - Initializer

    /// Creates a color palette.
    ///
    /// - Parameters:
    ///   - primary: The accent color for buttons, icons, progress indicators, and other highlighted elements.
    ///   - primaryDisabled: The accent color for buttons in a loading state.
    ///   - background: The background color for surface content, such as cards.
    ///   - foreground: The color of titles and other primary text content.
    ///   - mutedForeground: The color of secondary text content, such as descriptions.
    ///   - primaryForeground: The color of text and icons displayed on the accent color.
    ///   - primaryForegroundDisabled: The color of text and icons displayed on the disabled accent color.
    ///   - danger: The color for error messages.
    ///   - border: The color of borders around surface content, such as cards.
    public init(
        primary: Color = Self.defaultPrimary,
        primaryDisabled: Color = Self.defaultPrimaryDisabled,
        background: Color = Self.defaultBackground,
        foreground: Color = Self.defaultForeground,
        mutedForeground: Color = Self.defaultMutedForeground,
        primaryForeground: Color = Self.defaultPrimaryForeground,
        primaryForegroundDisabled: Color = Self.defaultPrimaryForegroundDisabled,
        danger: Color = Self.defaultDanger,
        border: Color = Self.defaultBorder,
    ) {
        self.primary = primary
        self.primaryDisabled = primaryDisabled
        self.background = background
        self.foreground = foreground
        self.mutedForeground = mutedForeground
        self.primaryForeground = primaryForeground
        self.primaryForegroundDisabled = primaryForegroundDisabled
        self.danger = danger
        self.border = border
    }

    // MARK: - Defaults

    /// The built-in color palette.
    public static let `default`: PaymentColors = PaymentColors()

    /// The built-in accent color for buttons, icons, progress indicators, and other highlighted elements.
    public static let defaultPrimary: Color = Color("primary", bundle: .module)

    /// The built-in accent color for buttons in a loading state.
    public static let defaultPrimaryDisabled: Color = Color("primaryDisabled", bundle: .module)

    /// The built-in background color for surface content, such as cards.
    public static let defaultBackground: Color = Color("background", bundle: .module)

    /// The built-in color of titles and other primary text content.
    public static let defaultForeground: Color = Color("foreground", bundle: .module)

    /// The built-in color of secondary text content, such as descriptions.
    public static let defaultMutedForeground: Color = Color("mutedForeground", bundle: .module)

    /// The built-in color of text and icons displayed on the accent color.
    public static let defaultPrimaryForeground: Color = Color("primaryForeground", bundle: .module)

    /// The built-in color of text and icons displayed on the disabled accent color.
    public static let defaultPrimaryForegroundDisabled: Color = Color("primaryForegroundDisabled", bundle: .module)

    /// The built-in color for error messages.
    public static let defaultDanger: Color = Color("danger", bundle: .module)

    /// The built-in color of borders around surface content, such as cards.
    public static let defaultBorder: Color = Color("border", bundle: .module)
}

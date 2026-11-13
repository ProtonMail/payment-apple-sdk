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

/// The colors, fonts, and layout values that style the payment views.
public struct PaymentTheme: Sendable {
    // MARK: - Properties

    /// The semantic colors that the payment views use.
    public var colors: PaymentColors

    /// The semantic fonts that the payment views use.
    public var fonts: PaymentFonts

    /// The semantic layout values that the payment views use.
    public var design: PaymentDesign

    // MARK: - Initializer

    /// Creates a theme.
    ///
    /// - Parameters:
    ///   - colors: The semantic colors that the payment views use.
    ///   - fonts: The semantic fonts that the payment views use.
    ///   - design: The semantic layout values that the payment views use.
    public init(
        colors: PaymentColors = PaymentColors.default,
        fonts: PaymentFonts = PaymentFonts.default,
        design: PaymentDesign = PaymentDesign.default,
    ) {
        self.colors = colors
        self.fonts = fonts
        self.design = design
    }

    // MARK: - Defaults

    /// The built-in theme.
    public static let `default`: PaymentTheme = PaymentTheme()
}

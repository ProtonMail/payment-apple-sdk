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

/// The semantic fonts that the payment views use.
public struct PaymentFonts: Sendable {
    // MARK: - Properties

    /// The font for the most emphasized text, such as headings.
    public var headline: Font

    /// The font for titles, body text, and button labels.
    public var subheadline: Font

    /// The font for secondary or muted text, such as descriptions.
    public var caption: Font

    // MARK: - Initializer

    /// Creates a set of fonts.
    ///
    /// - Parameters:
    ///   - headline: The font for the most emphasized text, such as headings.
    ///   - subheadline: The font for titles, body text, and button labels.
    ///   - caption: The font for secondary or muted text, such as descriptions.
    public init(
        headline: Font = Self.defaultHeadline,
        subheadline: Font = Self.defaultSubheadline,
        caption: Font = Self.defaultCaption,
    ) {
        self.headline = headline
        self.subheadline = subheadline
        self.caption = caption
    }

    // MARK: - Defaults

    /// The built-in fonts.
    public static let `default`: PaymentFonts = PaymentFonts()

    /// The built-in font for the most emphasized text, such as headings.
    public static let defaultHeadline: Font = .headline

    /// The built-in font for titles, body text, and button labels.
    public static let defaultSubheadline: Font = .subheadline

    /// The built-in font for secondary or muted text, such as descriptions.
    public static let defaultCaption: Font = .caption
}

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

/// An entitlement represented as a descriptive text label.
public struct DescriptionEntitlement: Sendable, Equatable {
    /// The display text for this entitlement.
    public let text: String

    /// The name of the icon to display alongside the text.
    public let iconName: String

    /// Optional supplementary hint text for the label.
    public let hint: String?

    /// Creates a description entitlement.
    ///
    /// - Parameters:
    ///   - text: The display text for this entitlement.
    ///   - iconName: The name of the icon to display alongside the text.
    ///   - hint: Optional supplementary hint text for the label.
    public init(
        text: String,
        iconName: String,
        hint: String? = nil,
    ) {
        self.text = text
        self.iconName = iconName
        self.hint = hint
    }
}

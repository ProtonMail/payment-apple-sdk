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

/// An entitlement represented as a bounded numeric progress value.
public struct ProgressEntitlement: Sendable, Equatable {
    /// The display text for this entitlement.
    public let text: String

    /// The name of the icon to display alongside the text, if any.
    public let iconName: String?

    /// The title label for the progress indicator.
    public let title: String

    /// The minimum value of the progress range.
    public let min: Int

    /// The maximum value of the progress range.
    public let max: Int

    /// The current value within the progress range.
    public let current: Int

    /// Creates a progress entitlement.
    ///
    /// - Parameters:
    ///   - text: The display text for this entitlement.
    ///   - iconName: The name of the icon to display alongside the text, if any.
    ///   - title: The title label for the progress indicator.
    ///   - min: The minimum value of the progress range.
    ///   - max: The maximum value of the progress range.
    ///   - current: The current value within the progress range.
    public init(
        text: String,
        iconName: String? = nil,
        title: String,
        min: Int,
        max: Int,
        current: Int,
    ) {
        self.text = text
        self.iconName = iconName
        self.title = title
        self.min = min
        self.max = max
        self.current = current
    }
}

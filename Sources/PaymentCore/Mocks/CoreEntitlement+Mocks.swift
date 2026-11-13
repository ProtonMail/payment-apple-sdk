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

extension CoreEntitlement {
    // MARK: - Entitlement

    package static let mocks: [CoreEntitlement] = [
        .progress(makeProgressMock()),
        .description(makeDescriptionMock()),
    ]

    // MARK: - Description

    package static func makeDescriptionMock(
        type: String = "entitlement-type",
        text: String = "Entitlement",
        iconName: String = "icon-name",
        hint: String? = "Hint",
    ) -> CoreDescriptionEntitlement {
        CoreDescriptionEntitlement(
            type: type,
            text: text,
            iconName: iconName,
            hint: hint,
        )
    }

    // MARK: - Progress

    package static func makeProgressMock(
        title: String = "Progress Entitlement",
        type: String = "entitlement-type",
        text: String = "Entitlement",
        min: UInt64 = 0,
        max: UInt64 = 100,
        current: UInt64 = 50,
        iconName: String? = "icon-name",
    ) -> CoreProgressEntitlement {
        CoreProgressEntitlement(
            title: title,
            type: type,
            text: text,
            min: min,
            max: max,
            current: current,
            iconName: iconName,
        )
    }
}

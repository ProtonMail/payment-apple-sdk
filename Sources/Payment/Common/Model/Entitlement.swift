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

/// A benefit or feature granted to a user when a product is purchased.
///
/// Entitlements are either a description (a text label with an icon and an optional hint) or a progress (a
/// bounded numeric value shown as a progress indicator).
public enum Entitlement: Sendable, Equatable {
    /// An entitlement represented as a descriptive text label.
    case description(DescriptionEntitlement)

    /// An entitlement represented as a bounded numeric progress value.
    case progress(ProgressEntitlement)
}

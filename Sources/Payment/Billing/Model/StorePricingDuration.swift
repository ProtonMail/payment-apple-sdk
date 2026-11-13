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

/// A duration unit that a single billing cycle represents.
///
/// This must be combined with a count to understand how long a single cycle lasts.
enum StorePricingDuration: Sendable, Equatable {
    /// A duration unit of day.
    case day

    /// A duration unit of week.
    case week

    /// A duration unit of month.
    case month

    /// A duration unit of year.
    case year
}

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

/// A list of products that share a common plan identifier, also known as the plan name.
///
/// This model is exclusively produced by ``Swift/Array/groupByPlanID()``.
public struct ProductsByPlanID: Sendable, Equatable {
    /// The plan identifier, or plan name, that the products belong to.
    public let planID: PlanID

    /// The products that share the plan identifier.
    public let products: [Product]
}

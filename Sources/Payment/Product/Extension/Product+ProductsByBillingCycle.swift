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

extension [Product] {
    /// Groups products by a billing cycle key.
    ///
    /// Products with the same billing cycle appear in a single list under the shared cycle. A
    /// ``BillingCycle/month(count:)`` with a count of 1 represents a monthly subscription plan, so all monthly
    /// products are grouped together. Similarly, a ``BillingCycle/year(count:)`` with a count of 2 represents a
    /// biennial plan, and all two-year plans are grouped together. Products without a non-discounted offer are omitted.
    ///
    /// - Returns: One ``ProductsByBillingCycle`` per distinct ``BillingCycle`` found.
    public func groupByBillingCycle() -> [ProductsByBillingCycle] {
        let groups = Dictionary(
            grouping: self,
            by: { product -> BillingCycle? in
                guard case .nonDiscounted(let offer) = product.offers.nonDiscounted() else {
                    return nil
                }

                return offer.pricingPeriod.cycle
            },
        )

        return groups.compactMap { (cycle, products) in
            guard let cycle else { return nil }

            return ProductsByBillingCycle(cycle: cycle, products: products)
        }
    }
}

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

import PaymentCore

/// Provides a port for SDK consumers to allow or deny consent for capturing and sending telemetry events.
final class TelemetryCapability: CoreTelemetryCapability {
    /// Reports whether the core may collect telemetry.
    ///
    /// - Returns: Always `false`.
    func canCollectTelemetry() -> Bool {
        // TODO: For now we do not expose telemetry consent to consumers.
        false
    }
}

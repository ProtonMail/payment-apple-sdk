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
import os

/// Provides an internal implementation for sending core logs to the unified logging system.
///
/// The SDK routes logs outwardly and expects them to be handled either internally or by the consuming app. For now,
/// the SDK provides a basic internal implementation.
final class LogCapability: CoreLogCapability {
    // MARK: - Properties

    private let logger = Logger(subsystem: "ch.proton.payment", category: "core")

    // MARK: - Conformance

    /// Logs an event emitted by the core.
    ///
    /// - Parameter event: The event to log.
    func onLog(event: CoreLogEvent) {
        let level: OSLogType = event.isPanic ? .fault : OSLogType(from: event.level)

        logger.log(
            level: level,
            "\(event.tag): \(event.message, privacy: .public)",
        )
    }
}

extension OSLogType {
    fileprivate init(from level: CoreLogLevel) {
        switch level {
        case .error:
            self = .error
        case .warn:
            self = .default
        case .info:
            self = .info
        case .debug:
            self = .debug
        case .trace:
            self = .debug
        }
    }
}

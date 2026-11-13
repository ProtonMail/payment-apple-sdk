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

/// Provides the persistent storage the core uses to queue records between publishes.
///
/// Such records include telemetry events awaiting an upload. For now, nothing is persisted and records are
/// discarded.
final class StorageCapability: CoreStorageCapability {
    /// Reads the records held under a scope.
    ///
    /// - Parameters:
    ///   - scope: The scope to read records from.
    ///   - limit: The maximum number of records to return.
    /// - Returns: The stored records.
    /// - Throws: An error if reading from persistent storage fails once persistence is implemented.
    func read(scope: CoreRecordScope, limit: UInt32) async throws -> [CoreRecord] {
        // TODO: Return the records held for this scope once storage is implemented.
        []
    }

    /// Stores records under a scope.
    ///
    /// - Parameters:
    ///   - scope: The scope to store the records under.
    ///   - records: The records to store.
    /// - Throws: An error if writing to persistent storage fails once persistence is implemented.
    func write(scope: CoreRecordScope, records: [CoreRecord]) async throws {
        // TODO: Persist the records under this scope, upserting by record id, once storage is implemented.
    }

    /// Deletes records from a scope.
    ///
    /// - Parameters:
    ///   - scope: The scope to delete records from.
    ///   - ids: The identifiers of the records to delete.
    /// - Throws: An error if deleting from persistent storage fails once persistence is implemented.
    func delete(scope: CoreRecordScope, ids: [CoreRecordID]) async throws {
        // TODO: Delete the identified records from this scope once storage is implemented.
    }
}

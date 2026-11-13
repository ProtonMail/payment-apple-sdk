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

import SwiftUI

// MARK: - Component

/// A circular loading indicator with an arc that expands and contracts while rotating.
struct ProgressSpinner: View {
    // MARK: - Theme

    @Environment(\.paymentTheme) private var theme

    // MARK: - Properties

    private static let maxTrimEnd: CGFloat = 0.6
    private static let lineWidth: CGFloat = 2
    private static let rotationOffsetDegrees: Double = 270
    private static let strokeAnimationDuration: Double = 1.5
    private static let rotationDuration: TimeInterval = 1
    private static let size: CGFloat = 20

    @State private var trimEnd: CGFloat = 0

    // MARK: - Initializer

    /// Creates a progress spinner.
    init() {}

    // MARK: - View

    var body: some View {
        TimelineView(.animation) { timeline in
            let elapsedFraction =
                timeline.date.timeIntervalSinceReferenceDate
                .truncatingRemainder(dividingBy: Self.rotationDuration) / Self.rotationDuration

            Circle()
                .trim(from: 0, to: trimEnd)
                .stroke(
                    LinearGradient(
                        colors: [.clear, theme.colors.primary],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing,
                    ),
                    style: StrokeStyle(lineWidth: Self.lineWidth, lineCap: .round, lineJoin: .round),
                )
                .frame(width: Self.size, height: Self.size)
                .rotationEffect(.degrees(Self.rotationOffsetDegrees + elapsedFraction * 360))
        }
        .animation(
            .easeIn(duration: Self.strokeAnimationDuration).repeatForever(autoreverses: true),
            value: trimEnd,
        )
        .onAppear {
            trimEnd = Self.maxTrimEnd
        }
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    ProgressSpinner()
        .padding()
}

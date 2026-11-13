// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Payment",
    defaultLocalization: "en",
    platforms: [.iOS("17.0"), .macOS("14.0"), .tvOS("17.0")],
    products: [
        .library(name: "Payment", targets: ["Payment"]),
        .library(name: "PaymentUI", targets: ["PaymentUI"]),
    ],
    targets: [
        .binaryTarget(
            name: "payment",
            path: "Sources/PaymentCore/Frameworks/payment.xcframework"
        ),
        .target(
            name: "Payment",
            dependencies: ["PaymentCore"],
            path: "Sources/Payment",
            resources: [.process("Resources")]
        ),
        .target(
            name: "PaymentCore",
            dependencies: ["payment"],
            path: "Sources/PaymentCore",
            exclude: ["Frameworks"],
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .target(
            name: "PaymentUI",
            dependencies: ["Payment"],
            path: "Sources/PaymentUI",
            resources: [.process("Resources")]
        ),
    ]
)

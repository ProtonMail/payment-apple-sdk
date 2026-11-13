# Proton Payment Apple SDK

The SDK provides access to the Proton product catalog, subscriptions and Apple
in-app purchase flows through StoreKit.

## Requirements

- iOS 17.0+ or macOS 14.0+
- Swift 6.2+

## Installation

Add the Swift package dependency, replacing `<version>` with a published release
tag:

```swift
dependencies: [
    .package(
        url: "https://github.com/ProtonMail/payment-apple-sdk.git",
        exact: "<version>"
    )
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "Payment", package: "payment-apple-sdk"),
            .product(name: "PaymentUI", package: "payment-apple-sdk")
        ]
    )
]
```

`Payment` provides the SDK API. `PaymentUI` is optional and provides SwiftUI
components, including `SubscriptionManagementView`.

## Initialization

The SDK uses your application's HTTP client through `HTTPCapability`. Implement
its `get(endpoint:)` and `post(endpoint:body:)` methods. Return an `HTTPResponse`
with the status code and JSON body for HTTP responses, including error statuses;
throw only when no HTTP response was received.

Initialize the SDK once at app launch and retain the returned instance for the
app's lifetime:

```swift
import Payment

let payments = Payments.initialize(httpCapability: httpCapability)
```

Here, `httpCapability` is your implementation of `HTTPCapability`. Use
`payments.products`, `payments.purchase` and `payments.subscriptions` to access
the catalog, purchases and subscriptions.

## License

[GNU General Public License, version 3 or later](LICENSE).

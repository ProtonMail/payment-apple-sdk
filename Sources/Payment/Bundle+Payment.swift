import Foundation

#if !SWIFT_PACKAGE
    extension Bundle {
        /// The bundle that holds this module's resources when it isn't built as a Swift package.
        static let module: Bundle = {
            let candidates = [Bundle.main, Bundle(for: BundleFinder.self)]
                .compactMap { $0.resourceURL?.appendingPathComponent("PaymentResources.bundle") }
            for candidate in candidates {
                if let bundle = Bundle(url: candidate) {
                    return bundle
                }
            }
            return Bundle(for: BundleFinder.self)
        }()

        private class BundleFinder {}
    }
#endif

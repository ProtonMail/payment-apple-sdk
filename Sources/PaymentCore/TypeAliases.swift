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

#if !SWIFT_PACKAGE
    import PaymentBindings
#endif

// MARK: - Capability

package typealias CoreHTTPCapability = Http
package typealias CoreLogCapability = PlatformLogger
package typealias CoreStorageCapability = Store
package typealias CoreStoreCapability = Iap
package typealias CoreTelemetryCapability = TelemetryConsent
package typealias CoreTimeCapability = Time

// MARK: - Core

package typealias DefaultPaymentCore = PaymentFfi
package typealias PaymentCoreProtocol = PaymentFfiProtocol

// MARK: - Common

package typealias CoreCurrency = Currency
package typealias CoreDescriptionEntitlement = DescriptionEntitlement
package typealias CoreEntitlement = Entitlement
package typealias CoreError = FfiError
package typealias CoreHTTPError = HttpError
package typealias CoreHTTPMethod = HttpMethod
package typealias CoreHTTPRequest = HttpRequest
package typealias CoreMoney = Money
package typealias CorePlanID = PlanId
package typealias CoreProgressEntitlement = ProgressEntitlement
package typealias CoreProvider = Provider
package typealias CoreRenewalState = RenewalState

// MARK: - Product

package typealias CoreBillingCount = BillingCount
package typealias CoreBillingCycle = BillingCycle
package typealias CoreDiscountedOffer = AppleDiscountedOffer
package typealias CoreOffer = Offer
package typealias CoreOfferID = OfferId
package typealias CorePricingPeriod = PricingPeriod
package typealias CoreProduct = ProtonProduct
package typealias CoreProductID = ProductId
package typealias CorePurchasedProduct = PurchasedProduct

// MARK: - Purchase

package typealias CoreAvailability = Availability
package typealias CoreOfferSignature = OfferSignature
package typealias CorePaymentAvailability = PaymentAvailability
package typealias CorePaymentMethod = PaymentMethod
package typealias CorePromotionalOffer = PromotionalOffer
package typealias CorePurchaseArguments = PurchaseArguments
package typealias CorePurchaseOfferOption = PurchaseOfferOption
package typealias CoreAppleIapReceiptDetails = AppleIapReceiptDetails
package typealias CorePurchaseReceipt = PurchaseReceipt
package typealias CorePurchaseRequest = PurchaseRequest
package typealias CorePurchasing = PurchasingState
package typealias CorePurchasingInFlight = PurchasingInFlightState
package typealias CorePurchasingTerminal = PurchasingTerminal
package typealias CoreReconciledPurchase = ReconciledPurchase
package typealias CoreReconciling = ReconcilingState
package typealias CoreReconcilingInFlight = ReconcilingInFlightState
package typealias CoreReconcilingTerminal = ReconcilingTerminal
package typealias CoreSessionState = SessionState
package typealias CoreSessionStateStream = SessionStateStream
package typealias CoreSignedPromotionalOffer = SignedPromotionalOffer
package typealias CoreStorePurchaseOffer = ResolvedOfferOption
package typealias CoreTransaction = Transaction
package typealias CoreUserID = UserId

// MARK: - Subscription

package typealias CoreSubscription = Subscription

// MARK: - Storage

package typealias CoreRecord = Record
package typealias CoreRecordID = RecordId
package typealias CoreRecordScope = RecordScope
package typealias CoreStorageError = StoreError

// MARK: - Store

package typealias CoreStoreDetails = IapDetails
package typealias CoreStoreError = IapError
package typealias CoreStoreProduct = IapProduct
package typealias CoreStoreStatus = IapStatus

// MARK: - Utility

package typealias CoreLogEvent = LogEvent
package typealias CoreLogger = PlatformLogger
package typealias CoreLogLevel = LogLevel
package typealias CoreTelemetryEvent = PaymentTelemetryEvent
package typealias CoreTracingLevel = TracingLevel

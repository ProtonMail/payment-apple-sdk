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

import Payment
import SwiftUI

// MARK: - Component

/// The SDK's ready-made subscription management screen, showing active subscriptions and products to purchase.
public struct SubscriptionManagementView: View {
    // MARK: - Properties

    @Environment(\.paymentTheme) private var theme
    @State private var viewModel: SubscriptionManagementViewModel
    @State private var toastPresenter = ToastPresenter()

    private var showToast: ShowToastAction {
        ShowToastAction(presenter: toastPresenter, colors: theme.colors)
    }

    // MARK: - Initializer

    /// Creates a subscription management screen.
    ///
    /// - Parameter payments: The SDK entry point.
    public init(payments: Payments) {
        self.viewModel = SubscriptionManagementViewModel(payments: payments)
    }

    // MARK: - View

    public var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                switch viewModel.subscriptions {
                case .idle:
                    // For now, idle does not have a specific view.
                    EmptyView()
                case .loading:
                    ResourceLoadingIndicator()
                case .success(let data):
                    SubscriptionList(subscriptions: data)
                case .error(let error):
                    ErrorText(error.message)
                }

                Text("subscription_management_screen_heading_upgrade", bundle: .module)
                    .font(theme.fonts.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 32, leading: 0, bottom: 24, trailing: 0))

                switch viewModel.products {
                case .idle:
                    // For now, idle does not have a specific view.
                    EmptyView()
                case .loading:
                    ResourceLoadingIndicator()
                case .success(let data):
                    ProductList(
                        products: data,
                        isTransacting: viewModel.isTransacting,
                        onPurchaseTap: purchase,
                    )
                case .error(let error):
                    ErrorText(error.message)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(.background.secondary)
        .navigationTitle(Text("subscription_management_screen_title", bundle: .module))
        .toolbarTitleDisplayMode(.inline)
        .presentToasts()
        .environment(\.showToast, showToast)
        .task {
            let effects = viewModel.effects()
            async let sessionStates = viewModel.observeSessionStates()
            async let loadDataSources = viewModel.loadDataSources()

            for await effect in effects {
                handleEffect(effect)
            }

            _ = await (sessionStates, loadDataSources)
        }
    }

    // MARK: - Events

    private func purchase(productID: ProductID, offer: Offer) {
        Task {
            await viewModel.purchase(productID: productID, offer: offer)
        }
    }

    private func handleEffect(_ effect: SubscriptionManagementEffect) {
        switch effect {
        case .transactionFailed(let error):
            showToast.error(message: error.message)
        case .modificationScheduled:
            showToast.info(
                message: String(
                    localized: "subscription_management_modification_scheduled",
                    bundle: .module,
                )
            )
        }
    }
}

// MARK: - Preview

#Preview {
    SubscriptionManagementView(payments: Payments.preview)
}

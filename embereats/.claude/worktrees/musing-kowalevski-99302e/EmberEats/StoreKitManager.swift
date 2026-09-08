import Foundation
import StoreKit

// MARK: - StoreKit 2 Manager

/// Manages StoreKit 2 interactions for EmberEats purchases
@MainActor
final class StoreKitManager: ObservableObject {
    static let shared = StoreKitManager()

    // Product identifiers
    static let premiumProductID = "com.gfamlabs.EmberEats.premium"

    static let allProductIDs: Set<String> = [
        premiumProductID,
        "com.gfamlabs.EmberEats.pack.ultralight",
        "com.gfamlabs.EmberEats.pack.bikepacking",
        "com.gfamlabs.EmberEats.pack.family",
        "com.gfamlabs.EmberEats.pack.winter",
        "com.gfamlabs.EmberEats.pack.quickmeals",
    ]

    // Fallback display prices shown when StoreKit products fail to load.
    // These must match the prices configured in App Store Connect.
    static let fallbackPrices: [String: String] = [
        premiumProductID: "$4.99",
        "com.gfamlabs.EmberEats.pack.ultralight": "$0.99",
        "com.gfamlabs.EmberEats.pack.bikepacking": "$0.99",
        "com.gfamlabs.EmberEats.pack.family": "$0.99",
        "com.gfamlabs.EmberEats.pack.winter": "$0.99",
        "com.gfamlabs.EmberEats.pack.quickmeals": "$0.99",
    ]

    // Published state
    @Published private(set) var products: [Product] = []
    @Published private(set) var purchasedProductIDs: Set<String> = []
    @Published private(set) var isLoading = true
    @Published private(set) var errorMessage: String?

    // Transaction listener task
    private var updateListenerTask: Task<Void, Error>?

    private init() {
        updateListenerTask = listenForTransactions()
        Task {
            await loadProducts()
            await updatePurchasedProducts()
        }
    }

    deinit {
        updateListenerTask?.cancel()
    }

    // MARK: - Product Loading

    func loadProducts() async {
        isLoading = true
        errorMessage = nil

        // Retry up to 3 times with increasing delay
        for attempt in 1...3 {
            do {
                let storeProducts = try await Product.products(for: Self.allProductIDs)
                products = storeProducts
                isLoading = false
                return
            } catch {
                if attempt < 3 {
                    try? await Task.sleep(for: .seconds(Double(attempt)))
                } else {
                    errorMessage = "Unable to load prices. Check your connection and try again."
                    isLoading = false
                }
            }
        }
    }

    // MARK: - Purchase

    func purchase() async -> Bool {
        await purchase(productID: Self.premiumProductID)
    }

    func purchase(productID: String) async -> Bool {
        // Retry loading products if they haven't loaded yet
        if products.isEmpty {
            await loadProducts()
        }

        guard let product = products.first(where: { $0.id == productID }) else {
            errorMessage = "Product not available. Please try again."
            return false
        }

        isLoading = true
        errorMessage = nil

        do {
            let result = try await product.purchase()

            switch result {
            case .success(let verification):
                let transaction = try checkVerified(verification)
                await updatePurchasedProducts()
                await transaction.finish()
                isLoading = false
                return true

            case .userCancelled:
                isLoading = false
                return false

            case .pending:
                errorMessage = "Purchase is pending approval."
                isLoading = false
                return false

            @unknown default:
                errorMessage = "Unknown purchase result."
                isLoading = false
                return false
            }
        } catch {
            errorMessage = "Purchase failed. Please try again."
            isLoading = false
            return false
        }
    }

    // MARK: - Restore Purchases

    func restorePurchases() async {
        isLoading = true
        errorMessage = nil

        do {
            try await AppStore.sync()
            await updatePurchasedProducts()
            isLoading = false

            if purchasedProductIDs.isEmpty {
                errorMessage = "No purchases to restore."
            }
        } catch {
            errorMessage = "Unable to restore purchases."
            isLoading = false
        }
    }

    // MARK: - Premium Status

    var hasPremium: Bool {
        purchasedProductIDs.contains(Self.premiumProductID)
    }

    var premiumProduct: Product? {
        products.first { $0.id == Self.premiumProductID }
    }

    var hasProducts: Bool {
        !products.isEmpty
    }

    var formattedPrice: String {
        premiumProduct?.displayPrice ?? Self.fallbackPrices[Self.premiumProductID] ?? "$4.99"
    }

    func product(for productID: String) -> Product? {
        products.first { $0.id == productID }
    }

    func formattedPrice(for productID: String) -> String {
        product(for: productID)?.displayPrice ?? Self.fallbackPrices[productID] ?? "$0.99"
    }

    // MARK: - Transaction Handling

    private func listenForTransactions() -> Task<Void, Error> {
        return Task {
            for await result in Transaction.updates {
                do {
                    let transaction = try self.checkVerified(result)
                    await self.updatePurchasedProducts()
                    await transaction.finish()
                } catch {
                    // Transaction verification failed
                }
            }
        }
    }

    private func updatePurchasedProducts() async {
        var purchased: Set<String> = []

        for await result in Transaction.currentEntitlements {
            do {
                let transaction = try checkVerified(result)
                if Self.allProductIDs.contains(transaction.productID) {
                    purchased.insert(transaction.productID)
                }
            } catch {
                // Skip unverified transactions
            }
        }

        purchasedProductIDs = purchased
    }

    private func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            throw StoreError.verificationFailed
        case .verified(let safe):
            return safe
        }
    }
}

// MARK: - Store Error

enum StoreError: Error {
    case verificationFailed
    case productNotFound
    case purchaseFailed
}

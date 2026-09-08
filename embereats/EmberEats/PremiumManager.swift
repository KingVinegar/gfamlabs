import Foundation
import Combine

// MARK: - Premium State Management

@MainActor
final class PremiumManager: ObservableObject {
    static let shared = PremiumManager()

    @Published private(set) var isPremium: Bool = false
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?
    @Published private(set) var purchasedProductIDs: Set<String> = []

    private var storeKitManager: StoreKitManager { StoreKitManager.shared }
    private var cancellables = Set<AnyCancellable>()

    private init() {
        // Don't trust cached value — wait for StoreKit verification.
        // isPremium starts as false (its default) and will be set
        // when updatePurchaseStatus fires from the Combine subscription.

        // Observe StoreKitManager for purchase changes
        storeKitManager.$purchasedProductIDs
            .sink { [weak self] productIDs in
                self?.updatePurchaseStatus(from: productIDs)
            }
            .store(in: &cancellables)

        storeKitManager.$isLoading
            .assign(to: &$isLoading)

        storeKitManager.$errorMessage
            .assign(to: &$errorMessage)
    }

    // MARK: - Status Updates

    private func updatePurchaseStatus(from productIDs: Set<String>) {
        purchasedProductIDs = productIDs
        let hasPurchased = productIDs.contains(StoreKitManager.premiumProductID)
        isPremium = hasPurchased
    }

    /// Whether the user has the full premium unlock ($4.99)
    var hasFullPremium: Bool {
        isPremium
    }

    /// Convenience — same as hasFullPremium for backward compatibility
    var hasPremium: Bool {
        isPremium
    }

    /// Product IDs of individually purchased packs
    var unlockedPacks: Set<String> {
        purchasedProductIDs.subtracting([StoreKitManager.premiumProductID])
    }

    /// Whether a recipe is accessible (free, or user has premium/matching pack)
    func canAccess(recipe: Recipe) -> Bool {
        if !recipe.isPremium { return true }
        if hasFullPremium { return true }

        // Check if any of the recipe's tags match an unlocked pack
        for pack in RecipePack.allPacks {
            if recipe.tags.contains(pack.tag) &&
               purchasedProductIDs.contains(pack.productID) {
                return true
            }
        }

        return false
    }

    /// Whether a pack's recipes are accessible
    func canAccess(pack: RecipePack) -> Bool {
        hasFullPremium || purchasedProductIDs.contains(pack.productID)
    }

    // MARK: - StoreKit Actions

    func purchase() {
        Task {
            let success = await storeKitManager.purchase()
            if success {
                isPremium = true
            }
        }
    }

    func purchase(productID: String) {
        Task {
            _ = await storeKitManager.purchase(productID: productID)
        }
    }

    func restorePurchase() {
        Task {
            await storeKitManager.restorePurchases()
            if storeKitManager.hasPremium {
                isPremium = true
            }
        }
    }

    func retryLoadProducts() {
        Task {
            await storeKitManager.loadProducts()
        }
    }

    // MARK: - Product Info

    /// Whether StoreKit products have been loaded successfully
    var hasProducts: Bool {
        storeKitManager.hasProducts
    }

    var formattedPrice: String {
        storeKitManager.formattedPrice
    }

    func formattedPrice(for productID: String) -> String {
        storeKitManager.formattedPrice(for: productID)
    }
}

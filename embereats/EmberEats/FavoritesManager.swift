import Foundation
import SwiftUI

// MARK: - Favorites Persistence

@MainActor
final class FavoritesManager: ObservableObject {
    static let shared = FavoritesManager()

    private let storageKey = "favoriteRecipeIDs"

    @Published private(set) var favoriteIDs: Set<String> = []

    private init() {
        loadFavorites()
    }

    // MARK: - Public API

    func toggle(recipeID: String) {
        if favoriteIDs.contains(recipeID) {
            favoriteIDs.remove(recipeID)
        } else {
            favoriteIDs.insert(recipeID)
            ReviewManager.shared.logFavoriteAdded(totalFavorites: favoriteIDs.count)
        }
        saveFavorites()
    }

    func isFavorite(recipeID: String) -> Bool {
        favoriteIDs.contains(recipeID)
    }

    // MARK: - Persistence

    private func loadFavorites() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) else {
            return
        }
        favoriteIDs = decoded
    }

    private func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favoriteIDs) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
}

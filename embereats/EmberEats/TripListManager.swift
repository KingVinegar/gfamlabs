import Foundation
import SwiftUI

// MARK: - Trip List Persistence

@MainActor
final class TripListManager: ObservableObject {
    static let shared = TripListManager()

    private let storageKey = "tripRecipeIDs"

    @Published private(set) var tripRecipeIDs: [String] = []

    private init() {
        loadTripList()
    }

    // MARK: - Public API

    func add(recipeID: String) {
        guard !tripRecipeIDs.contains(recipeID) else { return }
        tripRecipeIDs.append(recipeID)
        saveTripList()
        ReviewManager.shared.logTripRecipeAdded(totalTripRecipes: tripRecipeIDs.count)
    }

    func remove(recipeID: String) {
        tripRecipeIDs.removeAll { $0 == recipeID }
        saveTripList()
    }

    func clear() {
        tripRecipeIDs.removeAll()
        saveTripList()
    }

    func isInTrip(recipeID: String) -> Bool {
        tripRecipeIDs.contains(recipeID)
    }

    // MARK: - Persistence

    private func loadTripList() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode([String].self, from: data) else {
            return
        }
        tripRecipeIDs = decoded
    }

    private func saveTripList() {
        if let encoded = try? JSONEncoder().encode(tripRecipeIDs) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
}

import StoreKit
import SwiftUI

// MARK: - Review Prompt Manager

@MainActor
final class ReviewManager: ObservableObject {
    static let shared = ReviewManager()

    @AppStorage("reviewPromptCount") private var promptCount = 0
    @AppStorage("lastReviewPromptDate") private var lastPromptDate = ""
    @AppStorage("userTappedRate") private var userTappedRate = false
    @AppStorage("recipesViewedCount") private var recipesViewedCount = 0

    private let maxAutoPrompts = 2
    private let cooldownDays = 90

    private init() {}

    // MARK: - Engagement Triggers

    func logRecipeViewed() {
        recipesViewedCount += 1
        if recipesViewedCount == 3 {
            requestReviewIfEligible()
        }
    }

    func logFavoriteAdded(totalFavorites: Int) {
        if totalFavorites == 3 {
            requestReviewIfEligible()
        }
    }

    func logTripRecipeAdded(totalTripRecipes: Int) {
        if totalTripRecipes == 3 {
            requestReviewIfEligible()
        }
    }

    // MARK: - Settings (always opens)

    func requestReviewFromSettings() {
        userTappedRate = true
        guard let scene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
            return
        }
        SKStoreReviewController.requestReview(in: scene)
    }

    // MARK: - Private

    private func requestReviewIfEligible() {
        guard !userTappedRate else { return }
        guard promptCount < maxAutoPrompts else { return }
        guard !isCooldownActive() else { return }

        guard let scene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
            return
        }

        SKStoreReviewController.requestReview(in: scene)
        promptCount += 1
        lastPromptDate = ISO8601DateFormatter().string(from: Date())
    }

    private func isCooldownActive() -> Bool {
        guard !lastPromptDate.isEmpty else { return false }
        let formatter = ISO8601DateFormatter()
        guard let last = formatter.date(from: lastPromptDate) else { return false }
        let daysSince = Calendar.current.dateComponents([.day], from: last, to: Date()).day ?? 0
        return daysSince < cooldownDays
    }
}

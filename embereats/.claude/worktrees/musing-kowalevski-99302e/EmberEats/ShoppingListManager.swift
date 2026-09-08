import Foundation
import SwiftUI

// MARK: - Shopping List Manager

@MainActor
final class ShoppingListManager: ObservableObject {
    static let shared = ShoppingListManager()

    @Published private(set) var shoppingItems: [ShoppingCategory] = []
    @Published private(set) var checkedItems: Set<String> = []

    private let checkedStorageKey = "shoppingListCheckedItems"

    private init() {
        loadCheckedItems()
    }

    // MARK: - Data Structures

    struct ShoppingItem: Identifiable, Hashable {
        let id: String
        let name: String
        let amount: String
        let category: IngredientCategory

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }

    struct ShoppingCategory: Identifiable {
        let id: String
        let category: IngredientCategory
        let items: [ShoppingItem]
    }

    // MARK: - Generate Shopping List

    func generateList(from recipeIDs: [String], guestCount: Int) {
        let recipes = recipeIDs.compactMap { id in
            RecipeDatabase.allRecipes.first { $0.id == id }
        }

        let multiplier = UserPreferences.scalingMultiplier(for: guestCount)

        // Aggregate ingredients across all trip recipes
        var ingredientMap: [String: (name: String, amounts: [String], category: IngredientCategory)] = [:]

        for recipe in recipes {
            for ingredient in recipe.ingredients {
                let key = normalizeIngredientName(ingredient.name)

                if var existing = ingredientMap[key] {
                    let scaledAmount = ingredient.scalable
                        ? scaleAmount(ingredient.amount, multiplier: multiplier)
                        : ingredient.amount
                    existing.amounts.append(scaledAmount)
                    ingredientMap[key] = existing
                } else {
                    let scaledAmount = ingredient.scalable
                        ? scaleAmount(ingredient.amount, multiplier: multiplier)
                        : ingredient.amount
                    ingredientMap[key] = (
                        name: ingredient.name,
                        amounts: [scaledAmount],
                        category: ingredient.category
                    )
                }
            }
        }

        // Build shopping items
        let allItems = ingredientMap.map { key, value in
            let combinedAmount = value.amounts.count > 1
                ? value.amounts.joined(separator: " + ")
                : value.amounts.first ?? ""
            return ShoppingItem(
                id: key,
                name: value.name,
                amount: combinedAmount,
                category: value.category
            )
        }

        // Group by category in display order
        var categories: [ShoppingCategory] = []
        for category in IngredientCategory.allCases {
            let items = allItems
                .filter { $0.category == category }
                .sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
            if !items.isEmpty {
                categories.append(ShoppingCategory(
                    id: category.rawValue,
                    category: category,
                    items: items
                ))
            }
        }

        shoppingItems = categories
    }

    // MARK: - Check State

    func isChecked(_ itemID: String) -> Bool {
        checkedItems.contains(itemID)
    }

    func toggleCheck(_ itemID: String) {
        if checkedItems.contains(itemID) {
            checkedItems.remove(itemID)
        } else {
            checkedItems.insert(itemID)
        }
        saveCheckedItems()
    }

    func clearChecks() {
        checkedItems.removeAll()
        saveCheckedItems()
    }

    // MARK: - Export

    func exportAsText() -> String {
        var lines: [String] = ["Shopping List"]
        lines.append("============")
        lines.append("")

        for category in shoppingItems {
            lines.append(category.category.rawValue)
            lines.append(String(repeating: "-", count: category.category.rawValue.count))
            for item in category.items {
                let check = isChecked(item.id) ? "[x]" : "[ ]"
                lines.append("\(check) \(item.name) — \(item.amount)")
            }
            lines.append("")
        }

        return lines.joined(separator: "\n")
    }

    // MARK: - Private Helpers

    private func normalizeIngredientName(_ name: String) -> String {
        name.lowercased()
            .trimmingCharacters(in: .whitespaces)
            .replacingOccurrences(of: ", diced", with: "")
            .replacingOccurrences(of: ", chopped", with: "")
            .replacingOccurrences(of: ", sliced", with: "")
            .replacingOccurrences(of: ", minced", with: "")
            .replacingOccurrences(of: ", melted", with: "")
            .replacingOccurrences(of: ", crumbled", with: "")
            .replacingOccurrences(of: ", shredded", with: "")
            .replacingOccurrences(of: " (optional)", with: "")
    }

    private func scaleAmount(_ amount: String, multiplier: Double) -> String {
        guard multiplier != 1.0 else { return amount }
        // For simple numeric amounts, try to scale
        let components = amount.components(separatedBy: " ")
        guard let first = components.first, let number = Double(first) else {
            return amount
        }
        let scaled = number * multiplier
        let scaledStr = scaled.truncatingRemainder(dividingBy: 1) == 0
            ? String(format: "%.0f", scaled)
            : String(format: "%.1f", scaled)
        if components.count > 1 {
            return scaledStr + " " + components.dropFirst().joined(separator: " ")
        }
        return scaledStr
    }

    // MARK: - Persistence

    private func loadCheckedItems() {
        guard let data = UserDefaults.standard.data(forKey: checkedStorageKey),
              let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) else {
            return
        }
        checkedItems = decoded
    }

    private func saveCheckedItems() {
        if let encoded = try? JSONEncoder().encode(checkedItems) {
            UserDefaults.standard.set(encoded, forKey: checkedStorageKey)
        }
    }
}

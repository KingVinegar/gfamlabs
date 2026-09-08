import Foundation

// MARK: - Recipe Database

struct RecipeDatabase {
    /// All recipes across every cooking method
    static let allRecipes: [Recipe] =
        campfireRecipes +
        campStoveRecipes +
        dutchOvenRecipes +
        foilPacketRecipes +
        noCookRecipes

    /// Only free-tier recipes
    static let freeRecipes: [Recipe] = allRecipes.filter { !$0.isPremium }

    /// Only premium recipes
    static let premiumRecipes: [Recipe] = allRecipes.filter { $0.isPremium }

    /// Recipes filtered by cooking method
    static func recipes(for method: CookingMethod) -> [Recipe] {
        allRecipes.filter { $0.cookingMethod == method }
    }

    /// Recipes filtered by meal type
    static func recipes(for mealType: MealType) -> [Recipe] {
        allRecipes.filter { $0.mealType == mealType }
    }

    /// Search recipes by name (case-insensitive)
    static func search(_ query: String) -> [Recipe] {
        guard !query.isEmpty else { return allRecipes }
        return allRecipes.filter {
            $0.name.localizedCaseInsensitiveContains(query)
        }
    }

    /// Recipes matching any of the given recipe tags
    static func recipes(matching tags: Set<RecipeTag>) -> [Recipe] {
        guard !tags.isEmpty else { return allRecipes }
        return allRecipes.filter { !$0.tags.isDisjoint(with: tags) }
    }

    /// Recipes matching any of the given dietary tags
    static func recipes(matchingDietary dietary: Set<DietaryTag>) -> [Recipe] {
        guard !dietary.isEmpty else { return allRecipes }
        return allRecipes.filter { !$0.dietaryTags.isDisjoint(with: dietary) }
    }

    /// Featured recipe — deterministic daily rotation from free recipes
    static var featuredRecipe: Recipe {
        let free = freeRecipes
        guard !free.isEmpty else { return allRecipes[0] }
        let daysSinceEpoch = Int(Date().timeIntervalSince1970) / 86400
        return free[daysSinceEpoch % free.count]
    }

    /// Quick recipes under a given time in minutes
    static func quickRecipes(under minutes: Int) -> [Recipe] {
        allRecipes.filter { $0.totalTime <= minutes }
    }

    /// Campfire classic recipes — iconic camping staples
    static let campfireClassics: [Recipe] = allRecipes.filter { $0.tags.contains(.campfireClassics) }
}

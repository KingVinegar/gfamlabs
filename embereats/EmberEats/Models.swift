import SwiftUI

// MARK: - Recipe

struct Recipe: Identifiable, Codable, Hashable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    let id: String
    let name: String
    let cookingMethod: CookingMethod
    let mealType: MealType
    let prepTime: Int          // minutes
    let cookTime: Int          // minutes
    let servings: Int          // base serving count
    let difficulty: Difficulty
    let introduction: String   // 1-2 sentences
    let ingredients: [Ingredient]
    let equipment: [String]
    let steps: [String]
    let proTip: String         // REQUIRED - camping wisdom
    let safetyNote: String?    // optional
    let dietaryTags: Set<DietaryTag>
    let tags: Set<RecipeTag>
    let isPremium: Bool

    /// Total time in minutes (prep + cook)
    var totalTime: Int {
        prepTime + cookTime
    }
}

// MARK: - CookingMethod

enum CookingMethod: String, CaseIterable, Codable, Identifiable {
    case campfire = "Campfire"
    case campStove = "Camp Stove"
    case dutchOven = "Dutch Oven"
    case foilPacket = "Foil Packets"
    case noCook = "No-Cook"

    var id: String { rawValue }

    /// SF Symbol icon name for this cooking method
    var icon: String {
        switch self {
        case .campfire: return "flame"
        case .campStove: return "flame.circle"
        case .dutchOven: return "cylinder.fill"
        case .foilPacket: return "rectangle.compress.vertical"
        case .noCook: return "leaf"
        }
    }

    /// Accent color for this cooking method
    var color: Color {
        DesignTokens.Colors.pine
    }
}

// MARK: - MealType

enum MealType: String, CaseIterable, Codable, Identifiable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snack = "Snacks"
    case dessert = "Desserts"
    case drink = "Drinks"

    var id: String { rawValue }
}

// MARK: - Difficulty

enum Difficulty: String, Codable {
    case easy = "Easy"
    case medium = "Medium"
    case advanced = "Advanced"
}

// MARK: - DietaryTag

enum DietaryTag: String, CaseIterable, Codable {
    case vegetarian = "Vegetarian"
    case vegan = "Vegan"
    case glutenFree = "Gluten-Free"
    case dairyFree = "Dairy-Free"
    case nutFree = "Nut-Free"
}

// MARK: - RecipeTag

enum RecipeTag: String, CaseIterable, Codable {
    case ultralight = "Ultralight"
    case bikepacking = "Bikepacking"
    case familyFriendly = "Family Friendly"
    case winterCamping = "Winter Camping"
    case quickMeals = "Under 20 Minutes"
    case onePot = "One-Pot"
    case campfireClassics = "Campfire Classics"
}

// MARK: - IngredientCategory

enum IngredientCategory: String, CaseIterable, Codable {
    case produce = "Produce"
    case meat = "Meat & Protein"
    case dairy = "Dairy"
    case pantry = "Pantry Staples"
    case spices = "Spices & Seasonings"
    case canned = "Canned Goods"
    case bread = "Bread & Bakery"
    case drinks = "Drinks"
    case other = "Other"
}

// MARK: - Ingredient

struct Ingredient: Codable, Hashable {
    let name: String
    let amount: String     // "2 cups", "1 lb", etc.
    let scalable: Bool     // whether to scale with group size
    let category: IngredientCategory
}

// MARK: - IngredientScaler

enum IngredientScaler {
    /// Common fraction mappings for clean display
    private static let commonFractions: [(threshold: Double, display: String)] = [
        (1.0/4.0, "1/4"),
        (1.0/3.0, "1/3"),
        (1.0/2.0, "1/2"),
        (2.0/3.0, "2/3"),
        (3.0/4.0, "3/4"),
    ]

    /// Scale an ingredient amount string by a multiplier.
    /// Returns the original string unmodified if it can't be parsed.
    static func scale(_ amount: String, by multiplier: Double) -> String {
        guard multiplier != 1.0 else { return amount }

        let trimmed = amount.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return amount }

        // Try to extract a leading number (with optional fraction/mixed number)
        guard let parsed = parseLeadingNumber(trimmed) else {
            return amount
        }

        let scaled = parsed.value * multiplier
        let formatted = formatNumber(scaled)
        let suffix = parsed.remainder

        if suffix.isEmpty {
            return formatted
        } else {
            return "\(formatted) \(suffix)"
        }
    }

    // MARK: - Parsing

    private struct ParseResult {
        let value: Double
        let remainder: String  // everything after the number
    }

    /// Parse a leading number from the string. Handles:
    /// - Whole: "8", "4"
    /// - Decimal: "1.5", "0.25"
    /// - Fraction: "1/2", "3/4"
    /// - Mixed: "2 1/2"
    private static func parseLeadingNumber(_ s: String) -> ParseResult? {
        var input = s[s.startIndex...]

        // Try to read first number (whole or decimal)
        guard let first = readNumber(&input) else { return nil }

        let afterFirst = input

        // Check if this is a fraction: first number followed by "/"
        if input.first == "/" {
            input = input.dropFirst() // skip "/"
            if let denominator = readNumber(&input), denominator > 0 {
                let value = first / denominator
                let remainder = String(input).trimmingCharacters(in: .whitespaces)
                return ParseResult(value: value, remainder: remainder)
            }
            // Failed to parse denominator, treat first as whole number
            input = afterFirst
        }

        // Check for mixed number: whole number followed by space then fraction
        let savedForMixed = input
        let skipped = input.drop(while: { $0 == " " })
        if skipped.startIndex != input.startIndex, let _ = readNumber(&input) {
            // We read spaces then a number; check for "/"
            // But we need to re-parse from skipped position
            var mixedInput = skipped
            if let num = readNumber(&mixedInput), mixedInput.first == "/" {
                mixedInput = mixedInput.dropFirst()
                if let den = readNumber(&mixedInput), den > 0 {
                    let value = first + num / den
                    let remainder = String(mixedInput).trimmingCharacters(in: .whitespaces)
                    return ParseResult(value: value, remainder: remainder)
                }
            }
            // Not a mixed number, restore
            input = savedForMixed
        } else {
            input = savedForMixed
        }

        // Just a whole/decimal number
        let remainder = String(input).trimmingCharacters(in: .whitespaces)
        return ParseResult(value: first, remainder: remainder)
    }

    /// Read a number (integer or decimal) from the front of the substring.
    /// Advances the substring past the consumed characters.
    private static func readNumber(_ input: inout Substring) -> Double? {
        var numStr = ""
        var hasDot = false

        for ch in input {
            if ch.isNumber {
                numStr.append(ch)
            } else if ch == "." && !hasDot {
                hasDot = true
                numStr.append(ch)
            } else {
                break
            }
        }

        guard !numStr.isEmpty, let value = Double(numStr) else { return nil }
        input = input.dropFirst(numStr.count)
        return value
    }

    // MARK: - Formatting

    /// Format a scaled number:
    /// - If it matches a common fraction (within tolerance), use fraction notation
    /// - If it's a whole number, show as integer
    /// - If it has a whole part + common fraction remainder, show as mixed number
    /// - Otherwise, round to 1 decimal place
    private static func formatNumber(_ value: Double) -> String {
        // Check if it's essentially zero
        if value < 0.01 { return "0" }

        let whole = Int(value)
        let fractional = value - Double(whole)

        // Pure whole number
        if fractional < 0.01 {
            return "\(whole)"
        }

        // Check fractional part against common fractions
        for (threshold, display) in commonFractions {
            if abs(fractional - threshold) < 0.01 {
                if whole == 0 {
                    return display
                } else {
                    return "\(whole) \(display)"
                }
            }
        }

        // Check if the full value itself is a common fraction (value < 1)
        if whole == 0 {
            for (threshold, display) in commonFractions {
                if abs(value - threshold) < 0.01 {
                    return display
                }
            }
        }

        // Fall back to 1 decimal place
        let rounded = (value * 10).rounded() / 10
        if rounded == rounded.rounded() {
            return "\(Int(rounded))"
        }
        return String(format: "%.1f", rounded)
    }
}

// MARK: - UserPreferences

struct UserPreferences {
    /// Calculate ingredient scaling multiplier from a guest count.
    /// Base recipe serves 4.
    static func scalingMultiplier(for guestCount: Int) -> Double {
        Double(guestCount) / 4.0
    }
}

// MARK: - RecipePack

struct RecipePack: Identifiable, Hashable {
    let id: String
    let name: String
    let subtitle: String
    let icon: String           // SF Symbol
    let tag: RecipeTag         // Which tag this pack unlocks
    let productID: String      // StoreKit product ID

    static let allPacks: [RecipePack] = [
        RecipePack(id: "ultralight", name: "Ultralight Pack", subtitle: "Minimal gear, maximum flavor", icon: "figure.hiking", tag: .ultralight, productID: "com.gfamlabs.EmberEats.pack.ultralight"),
        RecipePack(id: "bikepacking", name: "Bikepacking Pack", subtitle: "High-calorie meals for the road", icon: "bicycle", tag: .bikepacking, productID: "com.gfamlabs.EmberEats.pack.bikepacking"),
        RecipePack(id: "family", name: "Family Camping", subtitle: "Kid-approved meals the whole crew loves", icon: "figure.2.and.child.holdinghands", tag: .familyFriendly, productID: "com.gfamlabs.EmberEats.pack.family"),
        RecipePack(id: "winter", name: "Winter Camping", subtitle: "Hot, hearty meals for cold nights", icon: "snowflake", tag: .winterCamping, productID: "com.gfamlabs.EmberEats.pack.winter"),
        RecipePack(id: "quickmeals", name: "Quick Meals", subtitle: "Ready in under 20 minutes", icon: "timer", tag: .quickMeals, productID: "com.gfamlabs.EmberEats.pack.quickmeals"),
    ]
}

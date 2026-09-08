import SwiftUI

// MARK: - Recipe Detail View

struct RecipeDetailView: View {
    let recipe: Recipe

    @StateObject private var favoritesManager = FavoritesManager.shared
    @StateObject private var tripListManager = TripListManager.shared
    @StateObject private var premiumManager = PremiumManager.shared

    @AppStorage("guestCount") private var guestCount = 4

    var body: some View {
        if !premiumManager.canAccess(recipe: recipe) {
            PaywallView(teaserRecipe: recipe, embedded: true)
                .paperBackground()
                .navigationBarTitleDisplayMode(.inline)
        } else {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // MARK: - Recipe Name
                Text(recipe.name)
                    .font(.caveat(36, weight: .bold, relativeTo: .title))
                    .foregroundColor(DesignTokens.Colors.textPrimary)
                    .padding(.bottom, 10)

                // MARK: - Metadata Row
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        CookingMethodBadge(method: recipe.cookingMethod)

                        MetadataItem(icon: "clock", text: "Prep \(recipe.prepTime)m")
                        MetadataItem(icon: "flame", text: "Cook \(recipe.cookTime)m")
                        MetadataItem(icon: "person.2", text: "Serves \(guestCount)")
                        MetadataItem(icon: "chart.bar", text: recipe.difficulty.rawValue)
                    }
                }
                .padding(.bottom, 4)

                // MARK: - Introduction
                CookbookDivider()

                Text(recipe.introduction)
                    .font(.body)
                    .foregroundColor(DesignTokens.Colors.textPrimary)
                    .lineSpacing(5)

                // MARK: - Ingredients
                CookbookDivider()

                Text("Ingredients")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .roundedFont()
                    .foregroundColor(DesignTokens.Colors.textSecondary)
                    .sectionHeaderStyle()
                    .padding(.bottom, DesignTokens.Spacing.headerToBody)

                if guestCount != 4 {
                    Text("Scaled for \(guestCount) guests")
                        .font(.caption)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.textTertiary)
                        .padding(.bottom, 4)
                }

                ForEach(Array(recipe.ingredients.enumerated()), id: \.offset) { _, ingredient in
                    HStack(alignment: .top, spacing: 8) {
                        Text("\u{2022}")
                            .foregroundColor(DesignTokens.Colors.textTertiary)
                        Text(scaledIngredientText(ingredient))
                            .font(.body)
                            .foregroundColor(DesignTokens.Colors.textPrimary)
                    }
                    .padding(.vertical, 2)
                }

                // MARK: - Equipment
                CookbookDivider()

                Text("What You'll Need")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .roundedFont()
                    .foregroundColor(DesignTokens.Colors.textSecondary)
                    .sectionHeaderStyle()
                    .padding(.bottom, DesignTokens.Spacing.headerToBody)

                ForEach(recipe.equipment, id: \.self) { item in
                    HStack(alignment: .top, spacing: 8) {
                        Text("\u{2022}")
                            .foregroundColor(DesignTokens.Colors.textTertiary)
                        Text(item)
                            .font(.body)
                            .foregroundColor(DesignTokens.Colors.textPrimary)
                    }
                    .padding(.vertical, 2)
                }

                // MARK: - Steps
                CookbookDivider()

                Text("Steps")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .roundedFont()
                    .foregroundColor(DesignTokens.Colors.textSecondary)
                    .sectionHeaderStyle()
                    .padding(.bottom, DesignTokens.Spacing.headerToBody)

                ForEach(Array(recipe.steps.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .top, spacing: 10) {
                        Text("\(index + 1)")
                            .font(.title3)
                            .fontWeight(.regular)
                            .serifFont()
                            .foregroundColor(DesignTokens.Colors.textTertiary)
                            .frame(width: 28, alignment: .trailing)

                        Text(step)
                            .font(.body)
                            .foregroundColor(DesignTokens.Colors.textPrimary)
                            .lineSpacing(5)
                    }
                    .padding(.vertical, 4)
                    .accessibilityLabel("Step \(index + 1). \(step)")
                }

                // MARK: - Camper's Tip
                CookbookDivider()

                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "pencil.line")
                        .font(.callout)
                        .foregroundColor(DesignTokens.Colors.ember.opacity(0.7))

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Camper's Tip")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .roundedFont()
                            .foregroundColor(DesignTokens.Colors.ember)
                        Text(recipe.proTip)
                            .font(.callout)
                            .italic()
                            .foregroundColor(DesignTokens.Colors.textSecondary)
                            .lineSpacing(4)
                    }
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(DesignTokens.Colors.ember.opacity(0.05))
                )
                .accessibilityLabel("Pro tip: \(recipe.proTip)")

                // MARK: - Safety Note
                if let safetyNote = recipe.safetyNote {
                    CookbookDivider()

                    HStack(alignment: .top, spacing: 12) {
                        Rectangle()
                            .fill(DesignTokens.Colors.ember.opacity(0.25))
                            .frame(width: 3)

                        Text(safetyNote)
                            .font(.body)
                            .foregroundColor(DesignTokens.Colors.textPrimary)
                            .lineSpacing(4)
                    }
                    .accessibilityLabel("Safety note: \(safetyNote)")
                }
            }
            .notebookPage()
            .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
            .padding(.vertical, DesignTokens.Spacing.sectionGap)
        }
        .paperBackground()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { ReviewManager.shared.logRecipeViewed() }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                // MARK: - Trip List Button
                if premiumManager.hasPremium {
                    Button(action: {
                        if tripListManager.isInTrip(recipeID: recipe.id) {
                            tripListManager.remove(recipeID: recipe.id)
                        } else {
                            tripListManager.add(recipeID: recipe.id)
                        }
                    }) {
                        Image(systemName: tripListManager.isInTrip(recipeID: recipe.id) ? "list.clipboard.fill" : "list.clipboard")
                            .foregroundColor(
                                tripListManager.isInTrip(recipeID: recipe.id)
                                    ? DesignTokens.Colors.ember
                                    : DesignTokens.Colors.textTertiary
                            )
                    }
                    .accessibilityLabel(tripListManager.isInTrip(recipeID: recipe.id) ? "Remove from trip list" : "Add to trip list")
                    .accessibilityHint("Tap to toggle trip list status for \(recipe.name)")
                }

                // MARK: - Favorite Button
                Button(action: {
                    favoritesManager.toggle(recipeID: recipe.id)
                }) {
                    Image(systemName: favoritesManager.isFavorite(recipeID: recipe.id) ? "heart.fill" : "heart")
                        .foregroundColor(
                            favoritesManager.isFavorite(recipeID: recipe.id)
                                ? DesignTokens.Colors.ember
                                : DesignTokens.Colors.textTertiary
                        )
                }
                .accessibilityLabel(favoritesManager.isFavorite(recipeID: recipe.id) ? "Remove from favorites" : "Add to favorites")
                .accessibilityHint("Tap to toggle favorite for \(recipe.name)")

                // MARK: - Share Button
                ShareLink(item: "\(recipe.name) - from EmberEats") {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(DesignTokens.Colors.textTertiary)
                }
                .accessibilityLabel("Share recipe")
                .accessibilityHint("Share \(recipe.name) with others")
            }
        }
        }
    }

    // MARK: - Ingredient Scaling

    private func scaledIngredientText(_ ingredient: Ingredient) -> String {
        let amount: String
        if ingredient.scalable && guestCount != 4 {
            let multiplier = UserPreferences.scalingMultiplier(for: guestCount)
            amount = IngredientScaler.scale(ingredient.amount, by: multiplier)
        } else {
            amount = ingredient.amount
        }
        return "\(amount) \(ingredient.name)"
    }
}

// MARK: - Metadata Item

struct MetadataItem: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: icon)
                .font(.caption2)
            Text(text)
                .font(.caption)
                .roundedFont()
        }
        .foregroundColor(DesignTokens.Colors.textTertiary)
    }
}

#Preview {
    NavigationStack {
        RecipeDetailView(recipe: Recipe(
            id: "preview",
            name: "Campfire Mac & Cheese",
            cookingMethod: .campfire,
            mealType: .dinner,
            prepTime: 10,
            cookTime: 20,
            servings: 4,
            difficulty: .easy,
            introduction: "This works on any camp stove and feeds a crowd. Prep the dry mix at home to save time.",
            ingredients: [
                Ingredient(name: "elbow macaroni", amount: "2 cups", scalable: true, category: .pantry),
                Ingredient(name: "cheddar cheese, shredded", amount: "1.5 cups", scalable: true, category: .dairy),
                Ingredient(name: "butter", amount: "2 tbsp", scalable: true, category: .dairy),
                Ingredient(name: "milk", amount: "1/2 cup", scalable: true, category: .dairy),
                Ingredient(name: "salt", amount: "to taste", scalable: false, category: .spices)
            ],
            equipment: ["Large pot", "Stirring spoon", "Camp stove"],
            steps: [
                "Bring a large pot of water to a rolling boil over your camp stove.",
                "Add macaroni and cook for 8-10 minutes until tender. Drain.",
                "Return pasta to pot over low heat. Add butter and stir until melted.",
                "Add milk and cheese, stirring constantly until cheese melts and sauce is smooth.",
                "Season with salt. Serve hot."
            ],
            proTip: "Pre-shred your cheese at home and pack it in a zip-lock. It melts faster than a block.",
            safetyNote: "Handle the pot carefully with a towel or glove. The handle gets hot over open flame.",
            dietaryTags: [.vegetarian],
            tags: [],
            isPremium: false
        ))
    }
}

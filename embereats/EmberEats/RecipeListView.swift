import SwiftUI

// MARK: - Recipe List View

struct RecipeListView: View {
    let title: String
    let recipes: [Recipe]
    /// When set, the view is already filtered to a specific cooking method
    /// and the cooking method filter chips are hidden to prevent double-filtering.
    var filteringMethod: CookingMethod? = nil
    /// When set, the view is already filtered to a specific meal type
    /// and the meal type filter chips are hidden to prevent double-filtering.
    var filteringMealType: MealType? = nil

    @StateObject private var premiumManager = PremiumManager.shared
    @StateObject private var favoritesManager = FavoritesManager.shared

    @AppStorage("dietaryPreferencesData") private var dietaryPreferencesData = Data()

    @State private var selectedMethod: CookingMethod?
    @State private var selectedMealType: MealType?
    @State private var searchText = ""
    @State private var paywallRecipe: Recipe?
    @State private var selectedRecipe: Recipe?

    private var userDietaryTags: Set<DietaryTag> {
        guard let decoded = try? JSONDecoder().decode([String].self, from: dietaryPreferencesData) else {
            return []
        }
        return Set(decoded.compactMap { DietaryTag(rawValue: $0) })
    }

    /// Filtered recipes based on current selections
    private var filteredRecipes: [Recipe] {
        var result = recipes

        if let method = selectedMethod {
            result = result.filter { $0.cookingMethod == method }
        }

        if let mealType = selectedMealType {
            result = result.filter { $0.mealType == mealType }
        }

        if !userDietaryTags.isEmpty {
            result = result.filter { !$0.dietaryTags.isDisjoint(with: userDietaryTags) }
        }

        if !searchText.isEmpty {
            result = result.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }

        return result
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // MARK: - Cooking Method Filter
                if filteringMethod == nil {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            FilterChip(
                                label: "All",
                                isSelected: selectedMethod == nil,
                                action: { selectedMethod = nil }
                            )

                            ForEach(CookingMethod.allCases) { method in
                                FilterChip(
                                    label: method.rawValue,
                                    icon: method.icon,
                                    isSelected: selectedMethod == method,
                                    action: { selectedMethod = selectedMethod == method ? nil : method }
                                )
                            }
                        }
                        .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
                    }
                    .padding(.top, 8)
                }

                // MARK: - Meal Type Filter
                if filteringMealType == nil {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            FilterChip(
                                label: "All",
                                isSelected: selectedMealType == nil,
                                action: { selectedMealType = nil }
                            )

                            ForEach(MealType.allCases) { mealType in
                                FilterChip(
                                    label: mealType.rawValue,
                                    isSelected: selectedMealType == mealType,
                                    action: { selectedMealType = selectedMealType == mealType ? nil : mealType }
                                )
                            }
                        }
                        .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
                    }
                    .padding(.top, 10)
                }

                // MARK: - Recipe List
                if filteredRecipes.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 36))
                            .foregroundColor(DesignTokens.Colors.textTertiary)

                        Text("Nothing matches")
                            .font(.body)
                            .fontWeight(.semibold)
                            .serifFont()
                            .foregroundColor(DesignTokens.Colors.textSecondary)

                        Text("Try a different filter or browse all recipes.")
                            .font(.caption)
                            .foregroundColor(DesignTokens.Colors.textTertiary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 60)
                } else {
                    LazyVStack(spacing: DesignTokens.Spacing.recipeListCardGap) {
                        ForEach(filteredRecipes) { recipe in
                            Button(action: {
                                if !premiumManager.canAccess(recipe: recipe) {
                                    paywallRecipe = recipe
                                } else {
                                    selectedRecipe = recipe
                                }
                            }) {
                                RecipeCard(recipe: recipe)
                            }
                            .buttonStyle(SoftPressStyle())
                        }
                    }
                    .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
                    .padding(.top, DesignTokens.Spacing.sectionGap)
                    .padding(.bottom, 20)
                }
            }
        }
        .paperBackground()
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $searchText, prompt: "Search recipes")
        .navigationDestination(item: $selectedRecipe) { recipe in
            RecipeDetailView(recipe: recipe)
        }
        .sheet(item: $paywallRecipe) { recipe in
            PaywallView(teaserRecipe: recipe)
        }
    }
}

#Preview {
    NavigationStack {
        RecipeListView(title: "All Recipes", recipes: RecipeDatabase.allRecipes)
    }
}

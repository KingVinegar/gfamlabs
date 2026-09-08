import SwiftUI

// MARK: - Favorites View

struct FavoritesView: View {
    @StateObject private var favoritesManager = FavoritesManager.shared
    @StateObject private var premiumManager = PremiumManager.shared

    @State private var selectedRecipe: Recipe?
    @State private var paywallRecipe: Recipe?

    /// Recipes that are currently favorited
    private var favoriteRecipes: [Recipe] {
        RecipeDatabase.allRecipes.filter { favoritesManager.isFavorite(recipeID: $0.id) }
    }

    var body: some View {
        NavigationStack {
            Group {
                if favoriteRecipes.isEmpty {
                    // MARK: - Empty State
                    VStack(spacing: 12) {
                        Spacer()

                        Image(systemName: "heart")
                            .font(.system(size: 36))
                            .foregroundColor(DesignTokens.Colors.textTertiary)

                        Text("Nothing saved yet")
                            .font(.body)
                            .fontWeight(.semibold)
                            .serifFont()
                            .foregroundColor(DesignTokens.Colors.textSecondary)

                        Text("Heart any recipe to keep it here.")
                            .font(.caption)
                            .foregroundColor(DesignTokens.Colors.textTertiary)

                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    // MARK: - Favorites List
                    ScrollView {
                        LazyVStack(spacing: DesignTokens.Spacing.recipeListCardGap) {
                            ForEach(favoriteRecipes) { recipe in
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
                        .padding(.vertical, DesignTokens.Spacing.sectionGap)
                    }
                }
            }
            .paperBackground()
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(item: $selectedRecipe) { recipe in
                RecipeDetailView(recipe: recipe)
            }
            .sheet(item: $paywallRecipe) { recipe in
                PaywallView(teaserRecipe: recipe)
            }
        }
    }
}

#Preview {
    FavoritesView()
}

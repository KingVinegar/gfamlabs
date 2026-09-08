import SwiftUI

// MARK: - Paywall Presentation

struct PaywallPresentation: Identifiable {
    let id = UUID()
    var teaserRecipe: Recipe?
    var pack: RecipePack?
}

// MARK: - Explore View

struct ExploreView: View {
    @StateObject private var premiumManager = PremiumManager.shared
    @StateObject private var favoritesManager = FavoritesManager.shared

    @AppStorage("dietaryPreferencesData") private var dietaryPreferencesData = Data()

    @State private var searchText = ""
    @State private var selectedRecipe: Recipe?
    @State private var paywallPresentation: PaywallPresentation?

    /// Dietary tags the user selected
    private var userDietaryTags: Set<DietaryTag> {
        guard let decoded = try? JSONDecoder().decode([String].self, from: dietaryPreferencesData) else {
            return []
        }
        return Set(decoded.compactMap { DietaryTag(rawValue: $0) })
    }

    /// Filter any recipe list by the user's active dietary preferences
    private func applyDietaryFilter(_ recipes: [Recipe]) -> [Recipe] {
        guard !userDietaryTags.isEmpty else { return recipes }
        return recipes.filter { !$0.dietaryTags.isDisjoint(with: userDietaryTags) }
    }

    /// Recipes matching the user's dietary preferences (all recipes)
    private var dietaryMatches: [Recipe] {
        RecipeDatabase.recipes(matchingDietary: userDietaryTags)
    }

    /// Quick recipes (under 20 minutes), respecting dietary filters
    private var quickRecipes: [Recipe] {
        applyDietaryFilter(RecipeDatabase.quickRecipes(under: 20))
    }

    /// Campfire classics, respecting dietary filters
    private var campfireClassics: [Recipe] {
        applyDietaryFilter(RecipeDatabase.campfireClassics)
    }

    /// Search results when searching, respecting dietary filters
    private var searchResults: [Recipe] {
        applyDietaryFilter(RecipeDatabase.search(searchText))
    }

    /// Featured recipe — picks from dietary-filtered free recipes when filters are active
    private var featuredRecipe: Recipe {
        let candidates = applyDietaryFilter(RecipeDatabase.freeRecipes)
        guard !candidates.isEmpty else { return RecipeDatabase.featuredRecipe }
        let daysSinceEpoch = Int(Date().timeIntervalSince1970) / 86400
        return candidates[daysSinceEpoch % candidates.count]
    }

    private var isSearching: Bool {
        !searchText.isEmpty
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                if isSearching {
                    // MARK: - Search Results
                    searchResultsSection
                } else {
                    // MARK: - Discovery Layout
                    VStack(alignment: .leading, spacing: DesignTokens.Spacing.sectionGap) {
                        dietaryChipsSection
                        featuredSection
                        dietaryPreferencesSection
                        quickEasySection
                        campfireClassicsSection
                        byMethodSection
                        explorePacksSection
                        allRecipesSection
                    }
                    .padding(.bottom, 20)
                }
            }
            .paperBackground()
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "What are we making?")
            .navigationDestination(item: $selectedRecipe) { recipe in
                RecipeDetailView(recipe: recipe)
            }
            .sheet(item: $paywallPresentation) { presentation in
                PaywallView(teaserRecipe: presentation.teaserRecipe, pack: presentation.pack)
            }
        }
    }

    // MARK: - Dietary Filter Chips

    private var dietaryChipsSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                Image(systemName: "leaf")
                    .font(.caption)
                    .foregroundColor(DesignTokens.Colors.pine)

                ForEach(DietaryTag.allCases, id: \.rawValue) { tag in
                    let isSelected = userDietaryTags.contains(tag)
                    FilterChip(
                        label: tag.rawValue,
                        isSelected: isSelected,
                        action: { toggleDietaryTag(tag) }
                    )
                }
            }
            .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
        }
        .padding(.top, 4)
    }

    private func toggleDietaryTag(_ tag: DietaryTag) {
        var current = userDietaryTags
        if current.contains(tag) {
            current.remove(tag)
        } else {
            current.insert(tag)
        }
        let dietaryStrings = current.map { $0.rawValue }
        if let encoded = try? JSONEncoder().encode(dietaryStrings) {
            dietaryPreferencesData = encoded
        }
    }

    // MARK: - Featured Recipe

    private var featuredSection: some View {
        let recipe = featuredRecipe
        return Button {
            selectedRecipe = recipe
        } label: {
            VStack(alignment: .leading, spacing: 12) {
                Text("Today's Pick")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .roundedFont()
                    .foregroundColor(DesignTokens.Colors.ember)
                    .textCase(.uppercase)

                Text(recipe.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .serifFont()
                    .foregroundColor(DesignTokens.Colors.textPrimary)

                Text(recipe.introduction)
                    .font(.subheadline)
                    .foregroundColor(DesignTokens.Colors.textSecondary)
                    .lineLimit(2)

                HStack(spacing: 6) {
                    CookingMethodBadge(method: recipe.cookingMethod)
                    DotSeparator()
                    Text("\(recipe.totalTime) min")
                        .font(.caption)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.textTertiary)
                    DotSeparator()
                    Text(recipe.difficulty.rawValue)
                        .font(.caption)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.textTertiary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(DesignTokens.Spacing.cardPadding)
            .background(DesignTokens.Colors.card)
            .cornerRadius(DesignTokens.Radii.card)
            .shadow(
                color: DesignTokens.Shadows.cardColor,
                radius: DesignTokens.Shadows.cardRadius,
                x: 0,
                y: DesignTokens.Shadows.cardY
            )
        }
        .buttonStyle(SoftPressStyle())
        .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
        .padding(.top, 8)
    }

    // MARK: - Matches Your Preferences

    @ViewBuilder
    private var dietaryPreferencesSection: some View {
        if !userDietaryTags.isEmpty {
            VStack(alignment: .leading, spacing: DesignTokens.Spacing.headerToBody) {
                HStack {
                    Text("Matches Your Preferences")
                        .font(.headline)
                        .serifFont()
                        .foregroundColor(DesignTokens.Colors.textPrimary)

                    Spacer()

                    NavigationLink {
                        RecipeListView(
                            title: "Your Preferences",
                            recipes: dietaryMatches
                        )
                    } label: {
                        Text("See All")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .roundedFont()
                            .foregroundColor(DesignTokens.Colors.ember)
                    }
                }
                .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(Array(dietaryMatches.prefix(10))) { recipe in
                            HorizontalRecipeCard(recipe: recipe) {
                                handleRecipeTap(recipe)
                            }
                        }
                    }
                    .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
                }
            }
        }
    }

    // MARK: - Quick & Easy

    private var quickEasySection: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.headerToBody) {
            HStack {
                Text("Quick & Easy")
                    .font(.headline)
                    .serifFont()
                    .foregroundColor(DesignTokens.Colors.textPrimary)

                Spacer()

                NavigationLink {
                    RecipeListView(
                        title: "Under 20 Minutes",
                        recipes: quickRecipes
                    )
                } label: {
                    Text("See All")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.ember)
                }
            }
            .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Array(quickRecipes.prefix(10))) { recipe in
                        HorizontalRecipeCard(recipe: recipe) {
                            handleRecipeTap(recipe)
                        }
                    }
                }
                .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
            }
        }
    }

    // MARK: - Campfire Classics

    private var campfireClassicsSection: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.headerToBody) {
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: "flame")
                        .font(.caption)
                        .foregroundColor(DesignTokens.Colors.ember)
                    Text("Campfire Classics")
                        .font(.headline)
                        .serifFont()
                        .foregroundColor(DesignTokens.Colors.textPrimary)
                }

                Spacer()

                NavigationLink {
                    RecipeListView(
                        title: "Campfire Classics",
                        recipes: campfireClassics
                    )
                } label: {
                    Text("See All")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.ember)
                }
            }
            .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Array(campfireClassics.prefix(10))) { recipe in
                        HorizontalRecipeCard(recipe: recipe) {
                            handleRecipeTap(recipe)
                        }
                    }
                }
                .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
            }
        }
    }

    // MARK: - By Method

    private var byMethodSection: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.headerToBody) {
            Text("By Method")
                .font(.headline)
                .serifFont()
                .foregroundColor(DesignTokens.Colors.textPrimary)
                .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)

            let columns = [
                GridItem(.flexible(), spacing: 10),
                GridItem(.flexible(), spacing: 10)
            ]

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(CookingMethod.allCases) { method in
                    NavigationLink {
                        RecipeListView(
                            title: method.rawValue,
                            recipes: applyDietaryFilter(RecipeDatabase.recipes(for: method)),
                            filteringMethod: method
                        )
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: method.icon)
                                .font(.body)
                                .foregroundColor(DesignTokens.Colors.pine)
                            Text(method.rawValue)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .roundedFont()
                                .foregroundColor(DesignTokens.Colors.textPrimary)
                            Spacer()
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 14)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(DesignTokens.Radii.card)
                        .shadow(
                            color: DesignTokens.Shadows.cardColor,
                            radius: DesignTokens.Shadows.cardRadius,
                            x: 0,
                            y: DesignTokens.Shadows.cardY
                        )
                        .indexCardBorder(color: DesignTokens.Colors.pine)
                    }
                    .buttonStyle(SoftPressStyle())
                }

                // Browse All card
                NavigationLink {
                    RecipeListView(
                        title: "All Recipes",
                        recipes: applyDietaryFilter(RecipeDatabase.allRecipes)
                    )
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "book.closed")
                            .font(.body)
                            .foregroundColor(DesignTokens.Colors.pine)
                        Text("Browse All")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .roundedFont()
                            .foregroundColor(DesignTokens.Colors.textPrimary)
                        Spacer()
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 14)
                    .background(DesignTokens.Colors.card)
                    .cornerRadius(DesignTokens.Radii.card)
                    .shadow(
                        color: DesignTokens.Shadows.cardColor,
                        radius: DesignTokens.Shadows.cardRadius,
                        x: 0,
                        y: DesignTokens.Shadows.cardY
                    )
                    .indexCardBorder(color: DesignTokens.Colors.pine)
                }
                .buttonStyle(SoftPressStyle())
            }
            .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
        }
    }

    // MARK: - Explore Packs

    private var explorePacksSection: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.headerToBody) {
            HStack {
                HStack(spacing: 6) {
                    if !premiumManager.hasPremium {
                        Image(systemName: "lock.fill")
                            .font(.caption)
                            .foregroundColor(DesignTokens.Colors.ember)
                    }
                    Text("Recipe Packs")
                        .font(.headline)
                        .serifFont()
                        .foregroundColor(DesignTokens.Colors.textPrimary)
                }

                Spacer()

                NavigationLink {
                    PacksView()
                } label: {
                    Text("See All")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.ember)
                }
            }
            .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(RecipePack.allPacks) { pack in
                        if premiumManager.canAccess(pack: pack) {
                            NavigationLink {
                                RecipeListView(
                                    title: pack.name,
                                    recipes: RecipeDatabase.recipes(matching: [pack.tag])
                                )
                            } label: {
                                PackCardLabel(pack: pack)
                            }
                            .buttonStyle(SoftPressStyle())
                        } else {
                            PackCard(pack: pack) {
                                paywallPresentation = PaywallPresentation(pack: pack)
                            }
                        }
                    }
                }
                .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
            }
        }
    }

    // MARK: - All Recipes by Meal Type

    private var allRecipesSection: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.headerToBody) {
            Text("All Recipes")
                .font(.headline)
                .serifFont()
                .foregroundColor(DesignTokens.Colors.textPrimary)
                .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)

            let columns = [
                GridItem(.flexible(), spacing: 10),
                GridItem(.flexible(), spacing: 10)
            ]

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(MealType.allCases) { mealType in
                    let filtered = applyDietaryFilter(RecipeDatabase.recipes(for: mealType))
                    let count = filtered.count
                    NavigationLink {
                        RecipeListView(
                            title: mealType.rawValue,
                            recipes: filtered,
                            filteringMealType: mealType
                        )
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(mealType.rawValue)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .roundedFont()
                                    .foregroundColor(DesignTokens.Colors.textPrimary)
                                Text("\(count) recipes")
                                    .font(.caption2)
                                    .roundedFont()
                                    .foregroundColor(DesignTokens.Colors.textTertiary)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundColor(DesignTokens.Colors.textTertiary)
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 14)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(DesignTokens.Radii.card)
                        .shadow(
                            color: DesignTokens.Shadows.cardColor,
                            radius: DesignTokens.Shadows.cardRadius,
                            x: 0,
                            y: DesignTokens.Shadows.cardY
                        )
                        .indexCardBorder(color: DesignTokens.Colors.ember)
                    }
                    .buttonStyle(SoftPressStyle())
                }
            }
            .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
        }
    }

    // MARK: - Search Results

    private var searchResultsSection: some View {
        Group {
            if searchResults.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 36))
                        .foregroundColor(DesignTokens.Colors.textTertiary)

                    Text("Nothing matches")
                        .font(.body)
                        .fontWeight(.semibold)
                        .serifFont()
                        .foregroundColor(DesignTokens.Colors.textSecondary)

                    Text("Try a different search term.")
                        .font(.caption)
                        .foregroundColor(DesignTokens.Colors.textTertiary)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 60)
            } else {
                LazyVStack(spacing: DesignTokens.Spacing.recipeListCardGap) {
                    ForEach(searchResults) { recipe in
                        Button(action: { handleRecipeTap(recipe) }) {
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

    // MARK: - Actions

    private func handleRecipeTap(_ recipe: Recipe) {
        if !premiumManager.canAccess(recipe: recipe) {
            paywallPresentation = PaywallPresentation(teaserRecipe: recipe)
        } else {
            selectedRecipe = recipe
        }
    }
}

// MARK: - Horizontal Recipe Card

struct HorizontalRecipeCard: View {
    let recipe: Recipe
    let action: () -> Void
    @StateObject private var premiumManager = PremiumManager.shared

    private var isLocked: Bool {
        !premiumManager.canAccess(recipe: recipe)
    }

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 8) {
                Text(recipe.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .serifFont()
                    .foregroundColor(DesignTokens.Colors.textPrimary)
                    .lineLimit(2)

                Text(recipe.introduction)
                    .font(.caption)
                    .foregroundColor(DesignTokens.Colors.textSecondary)
                    .lineLimit(2)

                HStack(spacing: 4) {
                    CookingMethodBadge(method: recipe.cookingMethod)
                    if isLocked {
                        Spacer()
                        Image(systemName: "lock.fill")
                            .font(.caption2)
                            .foregroundColor(DesignTokens.Colors.textTertiary)
                    }
                }
            }
            .frame(width: 180, alignment: .leading)
            .padding(14)
            .background(DesignTokens.Colors.card)
            .cornerRadius(DesignTokens.Radii.card)
            .shadow(
                color: DesignTokens.Shadows.cardColor,
                radius: DesignTokens.Shadows.cardRadius,
                x: 0,
                y: DesignTokens.Shadows.cardY
            )
            .opacity(isLocked ? 0.75 : 1.0)
        }
        .buttonStyle(SoftPressStyle())
    }
}

// MARK: - Pack Card

struct PackCard: View {
    let pack: RecipePack
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 8) {
                Image(systemName: pack.icon)
                    .font(.title2)
                    .foregroundColor(DesignTokens.Colors.ember)

                Text(pack.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .roundedFont()
                    .foregroundColor(DesignTokens.Colors.textPrimary)

                Text(pack.subtitle)
                    .font(.caption)
                    .foregroundColor(DesignTokens.Colors.textSecondary)
                    .lineLimit(2)
            }
            .frame(width: 160, alignment: .leading)
            .padding(14)
            .background(DesignTokens.Colors.card)
            .cornerRadius(DesignTokens.Radii.card)
            .overlay(
                RoundedRectangle(cornerRadius: DesignTokens.Radii.card)
                    .stroke(DesignTokens.Colors.ember.opacity(0.2), lineWidth: 1)
            )
            .shadow(
                color: DesignTokens.Shadows.cardColor,
                radius: DesignTokens.Shadows.cardRadius,
                x: 0,
                y: DesignTokens.Shadows.cardY
            )
        }
        .buttonStyle(SoftPressStyle())
    }
}

// MARK: - Pack Card Label (visual-only, no Button — safe for NavigationLink labels)

struct PackCardLabel: View {
    let pack: RecipePack

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: pack.icon)
                .font(.title2)
                .foregroundColor(DesignTokens.Colors.ember)

            Text(pack.name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .roundedFont()
                .foregroundColor(DesignTokens.Colors.textPrimary)

            Text(pack.subtitle)
                .font(.caption)
                .foregroundColor(DesignTokens.Colors.textSecondary)
                .lineLimit(2)
        }
        .frame(width: 160, alignment: .leading)
        .padding(14)
        .background(DesignTokens.Colors.card)
        .cornerRadius(DesignTokens.Radii.card)
        .overlay(
            RoundedRectangle(cornerRadius: DesignTokens.Radii.card)
                .stroke(DesignTokens.Colors.ember.opacity(0.2), lineWidth: 1)
        )
        .shadow(
            color: DesignTokens.Shadows.cardColor,
            radius: DesignTokens.Shadows.cardRadius,
            x: 0,
            y: DesignTokens.Shadows.cardY
        )
    }
}

// MARK: - Filter Chip

struct FilterChip: View {
    let label: String
    var icon: String?
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.caption2)
                }
                Text(label)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .roundedFont()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .foregroundColor(isSelected ? DesignTokens.Colors.ember : DesignTokens.Colors.textSecondary)
            .background(
                isSelected
                    ? DesignTokens.Colors.ember.opacity(0.1)
                    : DesignTokens.Colors.raisedSurface
            )
            .cornerRadius(DesignTokens.Radii.chip)
            .overlay(
                RoundedRectangle(cornerRadius: DesignTokens.Radii.chip)
                    .stroke(isSelected ? DesignTokens.Colors.ember.opacity(0.3) : Color.clear, lineWidth: 1)
            )
        }
        .buttonStyle(SoftPressStyle())
        .accessibilityLabel(label)
        .accessibilityHint(isSelected ? "Currently selected. Tap to deselect." : "Tap to filter by \(label).")
    }
}

// MARK: - Recipe Card

struct RecipeCard: View {
    let recipe: Recipe
    @StateObject private var favoritesManager = FavoritesManager.shared
    @StateObject private var premiumManager = PremiumManager.shared

    private var isLocked: Bool {
        !premiumManager.canAccess(recipe: recipe)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Recipe name
            HStack {
                Text(recipe.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .serifFont()
                    .foregroundColor(DesignTokens.Colors.textPrimary)

                if isLocked {
                    Image(systemName: "lock.fill")
                        .font(.caption)
                        .foregroundColor(DesignTokens.Colors.textTertiary)
                }
            }

            // Introduction preview
            Text(recipe.introduction)
                .font(.subheadline)
                .foregroundColor(DesignTokens.Colors.textSecondary)
                .lineLimit(2)

            // Metadata row
            HStack(spacing: 6) {
                CookingMethodBadge(method: recipe.cookingMethod)

                DotSeparator()

                Text("\(recipe.totalTime) min")
                    .font(.caption)
                    .roundedFont()
                    .foregroundColor(DesignTokens.Colors.textTertiary)

                DotSeparator()

                Text(recipe.difficulty.rawValue)
                    .font(.caption)
                    .roundedFont()
                    .foregroundColor(DesignTokens.Colors.textTertiary)
            }

            // Heart button
            HStack {
                Spacer()
                Button(action: {
                    favoritesManager.toggle(recipeID: recipe.id)
                }) {
                    Image(systemName: favoritesManager.isFavorite(recipeID: recipe.id) ? "heart.fill" : "heart")
                        .font(.body)
                        .foregroundColor(
                            favoritesManager.isFavorite(recipeID: recipe.id)
                                ? DesignTokens.Colors.ember
                                : DesignTokens.Colors.textTertiary
                        )
                }
                .buttonStyle(SoftPressStyle())
                .accessibilityLabel(favoritesManager.isFavorite(recipeID: recipe.id) ? "Remove from favorites" : "Add to favorites")
                .accessibilityHint("Tap to toggle favorite status for \(recipe.name)")
            }
        }
        .padding(DesignTokens.Spacing.cardPadding)
        .background(DesignTokens.Colors.card)
        .cornerRadius(DesignTokens.Radii.card)
        .shadow(
            color: DesignTokens.Shadows.cardColor,
            radius: DesignTokens.Shadows.cardRadius,
            x: 0,
            y: DesignTokens.Shadows.cardY
        )
        .opacity(isLocked ? 0.75 : 1.0)
    }
}

// MARK: - Cooking Method Badge

struct CookingMethodBadge: View {
    let method: CookingMethod

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: method.icon)
                .font(.caption2)
            Text(method.rawValue)
                .font(.caption)
                .roundedFont()
        }
        .foregroundColor(DesignTokens.Colors.textSecondary)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(DesignTokens.Colors.raisedSurface)
        .cornerRadius(DesignTokens.Radii.chip)
        .overlay(
            RoundedRectangle(cornerRadius: DesignTokens.Radii.chip)
                .stroke(DesignTokens.Colors.hairline, lineWidth: 1)
        )
    }
}

// MARK: - Dot Separator

struct DotSeparator: View {
    var body: some View {
        Text("\u{00B7}")
            .font(.caption)
            .foregroundColor(DesignTokens.Colors.textTertiary)
    }
}

#Preview {
    ExploreView()
}

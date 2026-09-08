import SwiftUI

// MARK: - Trip List View

struct TripListView: View {
    @StateObject private var premiumManager = PremiumManager.shared
    @StateObject private var tripListManager = TripListManager.shared

    @AppStorage("guestCount") private var guestCount = 4
    @State private var selectedRecipe: Recipe?
    @State private var selectedTab = 0
    @State private var tripSettingsExpanded = false
    @State private var showClearConfirmation = false

    /// Summary text for the collapsed Trip Settings card
    private var tripSettingsSummary: String {
        "\(guestCount) guest\(guestCount == 1 ? "" : "s")"
    }

    /// Trip recipes organized by their data
    private var tripRecipes: [Recipe] {
        tripListManager.tripRecipeIDs.compactMap { id in
            RecipeDatabase.allRecipes.first { $0.id == id }
        }
    }

    /// Group recipes by meal type for organized display
    private var groupedRecipes: [(MealType, [Recipe])] {
        let mealTypeOrder: [MealType] = [.breakfast, .lunch, .dinner, .snack, .dessert, .drink]
        var groups: [(MealType, [Recipe])] = []

        for mealType in mealTypeOrder {
            let recipesForType = tripRecipes.filter { $0.mealType == mealType }
            if !recipesForType.isEmpty {
                groups.append((mealType, recipesForType))
            }
        }

        return groups
    }

    var body: some View {
        NavigationStack {
            Group {
                if !premiumManager.hasPremium {
                    // MARK: - Premium Gate (full paywall inline)
                    PaywallView(embedded: true)
                } else {
                    // MARK: - Premium Content
                    VStack(spacing: 0) {
                        // Segmented Control
                        Picker("View", selection: $selectedTab) {
                            Text("Trip List").tag(0)
                            Text("Shopping List").tag(1)
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
                        .padding(.vertical, 10)

                        if selectedTab == 0 {
                            tripListContent
                        } else {
                            ShoppingListView()
                        }
                    }
                }
            }
            .paperBackground()
            .navigationTitle("My Trip")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                if premiumManager.hasPremium && !tripRecipes.isEmpty && selectedTab == 0 {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { showClearConfirmation = true }) {
                            Text("Clear")
                                .font(.body)
                                .foregroundColor(DesignTokens.Colors.ember)
                        }
                        .accessibilityLabel("Clear trip list")
                        .accessibilityHint("Remove all recipes from the trip list")
                    }
                }
            }
            .navigationDestination(item: $selectedRecipe) { recipe in
                RecipeDetailView(recipe: recipe)
            }
            .confirmationDialog("Clear trip list?", isPresented: $showClearConfirmation) {
                Button("Clear All", role: .destructive) {
                    tripListManager.clear()
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("This will remove all recipes from your trip list.")
            }
        }
    }

    // MARK: - Trip Settings Card

    private var tripSettingsCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Tappable header
            Button(action: {
                withAnimation(.easeInOut(duration: 0.25)) {
                    tripSettingsExpanded.toggle()
                }
            }) {
                HStack(spacing: 10) {
                    Image(systemName: "tent")
                        .font(.body)
                        .foregroundColor(DesignTokens.Colors.ember)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Trip Settings")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .roundedFont()
                            .foregroundColor(DesignTokens.Colors.textPrimary)

                        if !tripSettingsExpanded {
                            Text(tripSettingsSummary)
                                .font(.caption)
                                .roundedFont()
                                .foregroundColor(DesignTokens.Colors.textTertiary)
                                .lineLimit(1)
                        }
                    }

                    Spacer()

                    Image(systemName: tripSettingsExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(DesignTokens.Colors.textTertiary)
                }
                .padding(DesignTokens.Spacing.cardPadding)
                .contentShape(Rectangle())
            }
            .buttonStyle(SoftPressStyle())
            .accessibilityLabel("Trip Settings")
            .accessibilityHint(tripSettingsExpanded ? "Tap to collapse" : "Tap to expand. \(tripSettingsSummary)")

            // Expandable content
            if tripSettingsExpanded {
                VStack(alignment: .leading, spacing: DesignTokens.Spacing.sectionGap) {
                    // Divider
                    Rectangle()
                        .fill(DesignTokens.Colors.hairline)
                        .frame(height: 0.5)
                        .padding(.horizontal, DesignTokens.Spacing.cardPadding)

                    // Guest Count
                    HStack(spacing: 10) {
                        Image(systemName: "person.2")
                            .font(.body)
                            .foregroundColor(DesignTokens.Colors.pine)
                            .frame(width: 24)

                        Stepper(value: $guestCount, in: 1...20) {
                            Text("Guests: \(guestCount)")
                                .font(.body)
                                .roundedFont()
                                .foregroundColor(DesignTokens.Colors.textPrimary)
                        }
                        .accessibilityLabel("Guest count: \(guestCount)")
                        .accessibilityHint("Adjust the number of guests for recipe scaling")
                    }
                    .padding(.horizontal, DesignTokens.Spacing.cardPadding)
                }
                .padding(.bottom, DesignTokens.Spacing.cardPadding)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(DesignTokens.Colors.card)
        .clipShape(RoundedRectangle(cornerRadius: DesignTokens.Radii.card))
        .shadow(
            color: DesignTokens.Shadows.cardColor,
            radius: DesignTokens.Shadows.cardRadius,
            y: DesignTokens.Shadows.cardY
        )
        .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
        .padding(.top, 4)
        .padding(.bottom, 8)
    }

    // MARK: - Trip List Content

    @ViewBuilder
    private var tripListContent: some View {
        if tripRecipes.isEmpty {
            VStack(spacing: 12) {
                tripSettingsCard

                Spacer()

                Image(systemName: "list.clipboard")
                    .font(.system(size: 36))
                    .foregroundColor(DesignTokens.Colors.textTertiary)

                Text("No recipes on the list")
                    .font(.body)
                    .fontWeight(.semibold)
                    .serifFont()
                    .foregroundColor(DesignTokens.Colors.textSecondary)

                Text("Planning a trip? Add recipes from Explore.")
                    .font(.caption)
                    .foregroundColor(DesignTokens.Colors.textTertiary)

                Spacer()
            }
            .frame(maxWidth: .infinity)
        } else {
            List {
                // Trip Settings card as first section
                Section {
                    tripSettingsCard
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }

                ForEach(groupedRecipes, id: \.0) { mealType, recipes in
                    Section {
                        ForEach(recipes) { recipe in
                            Button(action: { selectedRecipe = recipe }) {
                                TripRecipeRow(recipe: recipe)
                            }
                            .buttonStyle(.plain)
                            .listRowBackground(DesignTokens.Colors.card)
                        }
                        .onDelete { indexSet in
                            deleteRecipes(from: recipes, at: indexSet)
                        }
                    } header: {
                        Text(mealType.rawValue)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .roundedFont()
                            .foregroundColor(DesignTokens.Colors.textSecondary)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
        }
    }

    // MARK: - Actions

    private func deleteRecipes(from recipes: [Recipe], at offsets: IndexSet) {
        for index in offsets {
            tripListManager.remove(recipeID: recipes[index].id)
        }
    }
}

// MARK: - Trip Recipe Row

struct TripRecipeRow: View {
    let recipe: Recipe

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(recipe.name)
                .font(.body)
                .fontWeight(.medium)
                .serifFont()
                .foregroundColor(DesignTokens.Colors.textPrimary)

            HStack(spacing: 6) {
                CookingMethodBadge(method: recipe.cookingMethod)

                DotSeparator()

                Text("\(recipe.totalTime) min")
                    .font(.caption)
                    .roundedFont()
                    .foregroundColor(DesignTokens.Colors.textTertiary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    TripListView()
}

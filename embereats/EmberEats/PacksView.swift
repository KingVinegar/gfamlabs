import SwiftUI

// MARK: - Packs View

struct PacksView: View {
    @StateObject private var premiumManager = PremiumManager.shared

    @State private var selectedPack: RecipePack?
    @State private var navigatingPack: RecipePack?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignTokens.Spacing.sectionGap) {
                Text("Expand your camp cookbook with themed recipe packs.")
                    .font(.subheadline)
                    .foregroundColor(DesignTokens.Colors.textSecondary)
                    .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
                    .padding(.top, 8)

                ForEach(RecipePack.allPacks) { pack in
                    PackDetailCard(pack: pack) {
                        if premiumManager.canAccess(pack: pack) {
                            navigatingPack = pack
                        } else {
                            selectedPack = pack
                        }
                    }
                }
            }
            .padding(.bottom, 20)
        }
        .paperBackground()
        .navigationTitle("Recipe Packs")
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(item: $navigatingPack) { pack in
            RecipeListView(
                title: pack.name,
                recipes: RecipeDatabase.recipes(matching: [pack.tag])
            )
        }
        .sheet(item: $selectedPack) { pack in
            PaywallView(pack: pack)
        }
    }
}

// MARK: - Pack Detail Card

struct PackDetailCard: View {
    let pack: RecipePack
    let action: () -> Void
    @StateObject private var premiumManager = PremiumManager.shared

    private var isUnlocked: Bool {
        premiumManager.canAccess(pack: pack)
    }

    /// Recipes that belong to this pack
    private var packRecipes: [Recipe] {
        RecipeDatabase.recipes(matching: [pack.tag])
    }

    /// Up to 3 sample recipe names for social proof
    private var sampleRecipeNames: [String] {
        Array(packRecipes.prefix(3).map(\.name))
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: pack.icon)
                    .font(.title)
                    .foregroundColor(isUnlocked ? DesignTokens.Colors.pine : DesignTokens.Colors.ember)
                    .frame(width: 44)

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(pack.name)
                            .font(.headline)
                            .serifFont()
                            .foregroundColor(DesignTokens.Colors.textPrimary)

                        if isUnlocked {
                            Text("Unlocked")
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .roundedFont()
                                .foregroundColor(DesignTokens.Colors.pine)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(DesignTokens.Colors.pine.opacity(0.1))
                                .cornerRadius(4)
                        }
                    }

                    Text(pack.subtitle)
                        .font(.subheadline)
                        .foregroundColor(DesignTokens.Colors.textSecondary)

                    // Recipe count
                    Text("\(packRecipes.count) recipes")
                        .font(.caption)
                        .fontWeight(.medium)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.textTertiary)

                    // Sample recipe names
                    if !sampleRecipeNames.isEmpty {
                        Text(sampleRecipeNames.joined(separator: ", "))
                            .font(.caption2)
                            .foregroundColor(DesignTokens.Colors.textTertiary)
                            .lineLimit(1)
                    }
                }

                Spacer()

                if isUnlocked {
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(DesignTokens.Colors.textTertiary)
                } else if premiumManager.hasProducts {
                    Text(premiumManager.formattedPrice(for: pack.productID))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.ember)
                } else {
                    ProgressView()
                        .controlSize(.small)
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
        }
        .buttonStyle(SoftPressStyle())
        .accessibilityLabel("\(pack.name) recipe pack, \(packRecipes.count) recipes")
        .padding(.horizontal, DesignTokens.Spacing.screenHorizontal)
    }
}

#Preview {
    NavigationStack {
        PacksView()
    }
}

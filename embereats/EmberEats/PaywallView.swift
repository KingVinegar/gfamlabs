import SwiftUI

// MARK: - Paywall View

struct PaywallView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var premiumManager = PremiumManager.shared

    /// Optional recipe to show as teaser when triggered from a locked recipe
    var teaserRecipe: Recipe?
    /// Optional pack to show when triggered from a pack card
    var pack: RecipePack?
    /// When true, omits NavigationStack wrapper (for inline embedding)
    var embedded: Bool = false

    var body: some View {
        if embedded {
            paywallContent
                .preferredColorScheme(.light)
        } else {
            NavigationStack {
                paywallContent
                    .navigationTitle("Premium")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done") { dismiss() }
                                .foregroundColor(DesignTokens.Colors.ember)
                        }
                    }
            }
            .preferredColorScheme(.light)
        }
    }

    private var paywallContent: some View {
        VStack(spacing: 28) {
                Spacer()

                // MARK: - Icon
                if let pack = pack {
                    Image(systemName: pack.icon)
                        .font(.system(size: 44))
                        .foregroundColor(DesignTokens.Colors.ember.opacity(0.7))
                } else {
                    Image(systemName: "flame.fill")
                        .font(.system(size: 44))
                        .foregroundColor(DesignTokens.Colors.ember.opacity(0.7))
                }

                // MARK: - Headline
                if let pack = pack {
                    Text(pack.name)
                        .font(.title2)
                        .fontWeight(.medium)
                        .serifFont()
                        .foregroundColor(DesignTokens.Colors.textPrimary)
                } else {
                    Text("The full camp cookbook")
                        .font(.title2)
                        .fontWeight(.medium)
                        .serifFont()
                        .foregroundColor(DesignTokens.Colors.textPrimary)
                }

                // MARK: - Body / Teaser
                if let recipe = teaserRecipe {
                    VStack(spacing: 6) {
                        Text("Get \(recipe.name) plus:")
                            .font(.headline)
                            .serifFont()
                            .foregroundColor(DesignTokens.Colors.textPrimary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 36)
                    }
                } else if let pack = pack {
                    Text(pack.subtitle)
                        .font(.body)
                        .foregroundColor(DesignTokens.Colors.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 36)
                } else {
                    Text("Plan your whole trip before you leave. Recipes, grocery lists, and scaling — all in one place.")
                        .font(.body)
                        .foregroundColor(DesignTokens.Colors.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 36)
                }

                // MARK: - Feature List (generic paywall only)
                if pack == nil {
                    VStack(alignment: .leading, spacing: 10) {
                        PaywallFeatureRow(icon: "book.closed", text: "150+ recipes across 5 cooking methods")
                        PaywallFeatureRow(icon: "backpack", text: "Trip planner — pick meals before you go")
                        PaywallFeatureRow(icon: "cart", text: "Auto-generated grocery list from your trip")
                        PaywallFeatureRow(icon: "person.2", text: "Scale ingredients for any group size")
                        PaywallFeatureRow(icon: "leaf", text: "Dietary preferences for your crew")
                        PaywallFeatureRow(icon: "square.stack", text: "All 5 recipe packs included")
                        PaywallFeatureRow(icon: "arrow.down.circle", text: "All future recipes and features")
                    }
                    .padding(.horizontal, 36)
                }

                // MARK: - Purchase Actions
                VStack(spacing: 14) {
                    // Always show purchase buttons with prices (fallback prices
                    // display when StoreKit products haven't loaded yet).
                    // Purchase flow will load products on-demand if needed.
                    Button(action: {
                        premiumManager.purchase()
                    }) {
                        HStack(spacing: 8) {
                            if premiumManager.isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: DesignTokens.Colors.card))
                            }
                            Text(premiumManager.isLoading ? "Processing..." : "Unlock Everything for \(premiumManager.formattedPrice)")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .font(.body)
                        .fontWeight(.semibold)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.card)
                        .background(premiumManager.isLoading ? DesignTokens.Colors.ember.opacity(0.6) : DesignTokens.Colors.ember)
                        .cornerRadius(DesignTokens.Radii.button)
                    }
                    .disabled(premiumManager.isLoading)
                    .buttonStyle(SoftPressStyle(isEnabled: !premiumManager.isLoading))
                    .accessibilityLabel("Unlock everything for \(premiumManager.formattedPrice)")
                    .accessibilityHint("One-time purchase to unlock all recipes and trip list planner")

                    // Pack-specific purchase button
                    if let pack = pack {
                        Button(action: {
                            premiumManager.purchase(productID: pack.productID)
                        }) {
                            Text("Just this pack for \(premiumManager.formattedPrice(for: pack.productID))")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .font(.body)
                                .fontWeight(.medium)
                                .roundedFont()
                                .foregroundColor(DesignTokens.Colors.ember)
                                .background(DesignTokens.Colors.ember.opacity(0.1))
                                .cornerRadius(DesignTokens.Radii.button)
                                .overlay(
                                    RoundedRectangle(cornerRadius: DesignTokens.Radii.button)
                                        .stroke(DesignTokens.Colors.ember.opacity(0.3), lineWidth: 1)
                                )
                        }
                        .disabled(premiumManager.isLoading)
                        .buttonStyle(SoftPressStyle(isEnabled: !premiumManager.isLoading))
                        .accessibilityLabel("Just this pack for \(premiumManager.formattedPrice(for: pack.productID))")
                    }

                    Button(action: {
                        premiumManager.restorePurchase()
                    }) {
                        Text("Already unlocked? Restore")
                            .font(.footnote)
                            .foregroundColor(premiumManager.isLoading ? DesignTokens.Colors.disabledText : DesignTokens.Colors.ember)
                    }
                    .disabled(premiumManager.isLoading)
                    .accessibilityLabel("Restore purchase")
                    .accessibilityHint("Restore your premium purchase if you bought it on another device")

                    if let error = premiumManager.errorMessage {
                        Text(error)
                            .font(.footnote)
                            .foregroundColor(DesignTokens.Colors.error)
                            .multilineTextAlignment(.center)
                            .padding(.top, 4)
                    }
                }
                .padding(.horizontal, 36)

                Spacer()
            }
            .paperBackground()
            .task {
                // Auto-retry loading products when paywall appears
                if !premiumManager.hasProducts && !premiumManager.isLoading {
                    premiumManager.retryLoadProducts()
                }
            }
            .onChange(of: premiumManager.isPremium) { _, isPremium in
                if isPremium && !embedded {
                    dismiss()
                }
            }
            .onChange(of: premiumManager.purchasedProductIDs) { oldIDs, newIDs in
                // Dismiss when a pack purchase completes (not just full premium)
                if let pack = pack, newIDs.contains(pack.productID), !oldIDs.contains(pack.productID), !embedded {
                    dismiss()
                }
            }
    }
}

// MARK: - Feature Row

struct PaywallFeatureRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.body)
                .foregroundColor(DesignTokens.Colors.ember)
                .frame(width: 24)

            Text(text)
                .font(.body)
                .foregroundColor(DesignTokens.Colors.textPrimary)
        }
    }
}

#Preview {
    PaywallView()
}

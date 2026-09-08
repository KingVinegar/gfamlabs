import SwiftUI

// MARK: - Settings View

struct SettingsView: View {
    @StateObject private var premiumManager = PremiumManager.shared

    @State private var showingPaywall = false

    var body: some View {
        NavigationStack {
            List {
                // MARK: - Premium Section
                Section {
                    if premiumManager.hasPremium {
                        HStack {
                            Label("Premium", systemImage: "checkmark.seal.fill")
                                .foregroundColor(DesignTokens.Colors.textPrimary)
                            Spacer()
                            Text("Unlocked")
                                .font(.caption)
                                .fontWeight(.medium)
                                .roundedFont()
                                .foregroundColor(DesignTokens.Colors.ember)
                        }
                    } else {
                        Button(action: { showingPaywall = true }) {
                            Label("Unlock Premium", systemImage: "lock.open")
                                .foregroundColor(DesignTokens.Colors.ember)
                        }
                        .accessibilityLabel("Unlock Premium")
                        .accessibilityHint("Opens the premium unlock screen")
                    }

                    Button(action: { premiumManager.restorePurchase() }) {
                        HStack {
                            Label("Restore Purchase", systemImage: "arrow.clockwise")
                                .foregroundColor(premiumManager.isLoading ? DesignTokens.Colors.textTertiary : DesignTokens.Colors.textPrimary)
                            if premiumManager.isLoading {
                                Spacer()
                                ProgressView()
                                    .controlSize(.small)
                            }
                        }
                    }
                    .disabled(premiumManager.isLoading)
                    .accessibilityLabel("Restore Purchase")
                    .accessibilityHint("Restore your premium purchase if you bought it on another device")

                    if let error = premiumManager.errorMessage {
                        Text(error)
                            .font(.footnote)
                            .foregroundColor(DesignTokens.Colors.error)
                    }
                } header: {
                    Text("Premium")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.textSecondary)
                }
                .listRowBackground(DesignTokens.Colors.card)

                // MARK: - About Section
                Section {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("About EmberEats")
                            .font(.body)
                            .foregroundColor(DesignTokens.Colors.textPrimary)
                        Text("Curated camping recipes for every camp kitchen. Find the right recipe fast, even without signal.")
                            .font(.caption)
                            .foregroundColor(DesignTokens.Colors.textTertiary)
                    }
                    .padding(.vertical, 4)

                    Link(destination: URL(string: "https://gfamlabs.com/embereats/privacy")!) {
                        Label("Privacy Policy", systemImage: "hand.raised")
                            .foregroundColor(DesignTokens.Colors.textPrimary)
                    }
                    .accessibilityLabel("Privacy Policy")
                    .accessibilityHint("Opens the privacy policy in your browser")

                    Link(destination: URL(string: "https://gfamlabs.com/embereats/terms")!) {
                        Label("Terms of Use", systemImage: "doc.text")
                            .foregroundColor(DesignTokens.Colors.textPrimary)
                    }
                    .accessibilityLabel("Terms of Use")
                    .accessibilityHint("Opens the terms of use in your browser")

                    Button(action: { ReviewManager.shared.requestReviewFromSettings() }) {
                        Label("Rate EmberEats", systemImage: "star")
                            .foregroundColor(DesignTokens.Colors.textPrimary)
                    }
                    .accessibilityLabel("Rate EmberEats")
                    .accessibilityHint("Opens the App Store rating dialog")

                    HStack {
                        Text("Version")
                            .foregroundColor(DesignTokens.Colors.textPrimary)
                        Spacer()
                        Text(appVersion)
                            .font(.caption)
                            .foregroundColor(DesignTokens.Colors.textTertiary)
                    }
                } header: {
                    Text("About")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.textSecondary)
                }
                .listRowBackground(DesignTokens.Colors.card)
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .paperBackground()
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showingPaywall) {
                PaywallView()
            }
        }
    }

    // MARK: - Helpers

    private var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
        return "\(version) (\(build))"
    }
}

#Preview {
    SettingsView()
}

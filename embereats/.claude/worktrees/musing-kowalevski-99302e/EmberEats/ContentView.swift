import SwiftUI

// MARK: - Tab View Router

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "flame")
                }
                .tag(0)
                .accessibilityLabel("Explore")
                .accessibilityHint("Browse camping recipes")

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
                .tag(1)
                .accessibilityLabel("Favorites")
                .accessibilityHint("View your saved recipes")

            TripListView()
                .tabItem {
                    Label("My Trip", systemImage: "backpack")
                }
                .tag(2)
                .accessibilityLabel("My Trip")
                .accessibilityHint("Plan meals for your trip. Premium feature.")

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag(3)
                .accessibilityLabel("Settings")
                .accessibilityHint("Edit preferences and app settings")
        }
        .tint(DesignTokens.Colors.ember)
    }
}

#Preview {
    ContentView()
}

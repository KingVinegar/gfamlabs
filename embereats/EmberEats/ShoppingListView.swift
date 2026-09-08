import SwiftUI

// MARK: - Shopping List View

struct ShoppingListView: View {
    @StateObject private var shoppingListManager = ShoppingListManager.shared
    @StateObject private var tripListManager = TripListManager.shared

    @AppStorage("guestCount") private var guestCount = 4

    var body: some View {
        Group {
            if shoppingListManager.shoppingItems.isEmpty {
                emptyState
            } else {
                shoppingList
            }
        }
        .onAppear {
            shoppingListManager.generateList(
                from: tripListManager.tripRecipeIDs,
                guestCount: guestCount
            )
        }
        .onChange(of: tripListManager.tripRecipeIDs) { _, _ in
            shoppingListManager.generateList(
                from: tripListManager.tripRecipeIDs,
                guestCount: guestCount
            )
        }
        .onChange(of: guestCount) { _, _ in
            shoppingListManager.generateList(
                from: tripListManager.tripRecipeIDs,
                guestCount: guestCount
            )
        }
    }

    // MARK: - Empty State

    private var emptyState: some View {
        VStack(spacing: 12) {
            Spacer()

            Image(systemName: "cart")
                .font(.system(size: 36))
                .foregroundColor(DesignTokens.Colors.textTertiary)

            Text("No ingredients yet")
                .font(.body)
                .fontWeight(.semibold)
                .serifFont()
                .foregroundColor(DesignTokens.Colors.textSecondary)

            Text("Add recipes to your Trip List first.")
                .font(.caption)
                .foregroundColor(DesignTokens.Colors.textTertiary)

            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Shopping List

    private var shoppingList: some View {
        List {
            ForEach(shoppingListManager.shoppingItems) { category in
                Section {
                    ForEach(category.items) { item in
                        ShoppingItemRow(
                            item: item,
                            isChecked: shoppingListManager.isChecked(item.id),
                            onToggle: { shoppingListManager.toggleCheck(item.id) }
                        )
                        .listRowBackground(DesignTokens.Colors.card)
                    }
                } header: {
                    Text(category.category.rawValue)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .roundedFont()
                        .foregroundColor(DesignTokens.Colors.textSecondary)
                }
            }

            // Share button
            Section {
                ShareLink(item: shoppingListManager.exportAsText()) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Share List")
                    }
                    .font(.body)
                    .fontWeight(.medium)
                    .roundedFont()
                    .foregroundColor(DesignTokens.Colors.ember)
                    .frame(maxWidth: .infinity)
                }
                .accessibilityLabel("Share shopping list")
                .listRowBackground(DesignTokens.Colors.card)
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
    }

}

// MARK: - Shopping Item Row

struct ShoppingItemRow: View {
    let item: ShoppingListManager.ShoppingItem
    let isChecked: Bool
    let onToggle: () -> Void

    var body: some View {
        Button(action: onToggle) {
            HStack(spacing: 12) {
                Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                    .font(.body)
                    .foregroundColor(isChecked ? DesignTokens.Colors.pine : DesignTokens.Colors.textTertiary)

                VStack(alignment: .leading, spacing: 2) {
                    Text(item.name)
                        .font(.body)
                        .foregroundColor(
                            isChecked
                                ? DesignTokens.Colors.textTertiary
                                : DesignTokens.Colors.textPrimary
                        )
                        .strikethrough(isChecked)

                    Text(item.amount)
                        .font(.caption)
                        .foregroundColor(DesignTokens.Colors.textTertiary)
                }

                Spacer()
            }
            .padding(.vertical, 2)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(item.name), \(item.amount)")
        .accessibilityHint(isChecked ? "Checked. Tap to uncheck." : "Tap to check off.")
    }
}

#Preview {
    ShoppingListView()
}

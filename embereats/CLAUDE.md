# EmberEats - Claude Project Instructions

> See `~/.claude/CLAUDE.md` for global preferences (communication style, worktree workflow, commit style, iOS conventions)

## Project Context
- **App Name:** EmberEats (marketed name)
- **Bundle ID:** com.gfamlabs.EmberEats
- **Platform:** iOS 17+ (SwiftUI)
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
- **Status:** V1.0 submitted to App Store (Feb 2026)
- **Build system:** xcodegen (`project.yml` → `.xcodeproj`)
- **Device:** iPhone only (TARGETED_DEVICE_FAMILY: "1")
=======
- **Status:** V1 live on App Store (Feb 21, 2026)
>>>>>>> Stashed changes
=======
- **Status:** V1 live on App Store (Feb 21, 2026)
>>>>>>> Stashed changes
=======
- **Status:** V1 live on App Store (Feb 21, 2026)
>>>>>>> Stashed changes

## Authoritative Documents
- **SPEC.md** - Product specification (screens, features, data model, monetization) — partially outdated, see Current State below
- **DESIGN.md** - Visual design system (colors, typography, spacing, components)
- **CONTENT.md** - Voice, tone, and recipe content guide
- **AppStoreMetadata.md** - App Store Connect copy, keywords, review notes

## Current State (V1.0 as shipped)

### What changed from SPEC.md
- **Onboarding removed** — no onboarding screen. App opens directly to Explore tab.
- **Dietary preferences** moved to Explore page (filter chips below search bar, above Today's Pick)
- **Shopping List** added — auto-generated grocery list from trip recipes, lives as a tab alongside Trip List
- **Recipe Packs** added — 5 non-consumable packs ($0.99 each) in addition to full premium unlock
- **Guest count** scales ingredients dynamically (stepper in Trip Settings card)
- **Grocery list generation** implemented (was listed as non-goal in SPEC.md v1)
- **Group size** simplified to a single integer stepper (1-20), no more enum tiers

### Monetization (actual)
| Product ID | Type | Price |
|---|---|---|
| `com.gfamlabs.EmberEats.premium` | Non-consumable | TBD |
| `com.gfamlabs.EmberEats.pack.ultralight` | Non-consumable | $0.99 |
| `com.gfamlabs.EmberEats.pack.bikepacking` | Non-consumable | $0.99 |
| `com.gfamlabs.EmberEats.pack.family` | Non-consumable | $0.99 |
| `com.gfamlabs.EmberEats.pack.winter` | Non-consumable | $0.99 |
| `com.gfamlabs.EmberEats.pack.quickmeals` | Non-consumable | $0.99 |

### Key architecture decisions
- **Defense-in-depth** for premium content: RecipeDetailView has its own `canAccess(recipe:)` guard with embedded PaywallView fallback, in addition to lock icons in lists
- **PaywallView** supports 3 modes: generic (no params), teaser recipe (`teaserRecipe:`), pack-specific (`pack:`), and embedded (`embedded: true` for inline use)
- **sheet(item:)** pattern used everywhere instead of `sheet(isPresented:)` to avoid state race conditions
- **StoreKitManager.isLoading** initializes to `true` so purchase buttons show "Processing..." until products load (prevents showing fallback dashes)

## Post-Launch Roadmap (V1.1+)

- Filter recipes by difficulty level
- One-tap "Add to Trip" button on recipe cards (matching the existing favorites heart)
- Dark mode ("campfire at night" aesthetic)

## Code Conventions

### SwiftUI Views
- Use `DesignTokens.Colors.*`, `DesignTokens.Radii.*`, `DesignTokens.Spacing.*`
- NEVER hardcode colors, dimensions, or font sizes
- Organize with `// MARK: - Section` comments
- Include `#Preview` at end of file
- Use `.serifFont()` for recipe titles and headlines
- Use `.roundedFont()` for headers, buttons, metadata, chips
- Use `CookbookDivider` between sections in recipe detail views
- Use `SoftPressStyle` for all buttons
- Use `.paperBackground()` for screen backgrounds (adds paper texture overlay)
- Use `.notebookPage()` for recipe detail content framing
- Use `.sectionHeaderStyle()` for section header underlines
- Use `.indexCardBorder(color:)` for grid card left-accent bars

### Services/Managers
- `@MainActor final class` conforming to `ObservableObject`
- `static let shared` singleton pattern
- `private init()` to prevent external instantiation
- `@Published private(set)` for observable state

### State Management
- `@StateObject private var` for singleton services in views
- `@State private var` for view-local state
- `@AppStorage` for persistent preferences (JSON-encoded for complex types)
- `@AppStorage("dietaryPreferencesData")` — JSON-encoded `[String]` array of `DietaryTag.rawValue`
- `@AppStorage("guestCount")` — Int, default 4

### StoreKit
- Product IDs: `com.gfamlabs.EmberEats.*` (see monetization table above)
- Non-consumable (one-time purchases)
- Configuration file: `Configuration.storekit` (for Xcode testing only, not bundled in archive)
- StoreKit 2 (`Product`, `Transaction`, `VerificationResult`)

### Design Philosophy
- "Grandad's camp cookbook" aesthetic
- Warm parchment palette, serif recipe titles, decorative dividers
- Every recipe MUST have a proTip (camping wisdom or camp craft)
- Light mode only
- Offline-first (all data bundled, no network required)

<<<<<<< Updated upstream
=======
### StoreKit
- Product ID: `com.emberEats.premium`
- Non-consumable (one-time purchase)
- Configuration file: `Configuration.storekit`

## App Store Optimization (ASO)

### Metadata (for App Store Connect)

**App Name:** EmberEats
**Subtitle (30 chars):** Campfire Recipes & Trip Planner
**Category:** Food & Drink (primary), Lifestyle (secondary)

**Keywords (100 chars):**
```
camping,recipes,campfire,cooking,outdoor,dutch oven,foil packet,camp stove,meal planner,backpacking
```

**Description:**
```
What should we cook at camp tonight?

EmberEats is a curated collection of 150+ camping recipes, organized by how you're cooking. Campfire, camp stove, Dutch oven, foil packets, or no-cook. Every recipe was written for the campsite, not adapted from a food blog.

FIND THE RIGHT RECIPE FAST
- Browse by cooking method or meal type
- Filter for dietary needs (vegetarian, vegan, gluten-free, dairy-free, nut-free)
- Search when you know what you want

BUILT FOR CAMP
- Works completely offline. No signal required.
- Practical, campfire-tested pro tips with every recipe
- Scale ingredients for your group size

PLAN YOUR TRIP
- Add recipes to your Trip List before you head out
- Organized by meal type so every meal is covered
- One less thing to figure out at the campsite

FREE TO START
- 40+ free recipes across all cooking methods
- Unlock the full library with a one-time purchase
- No subscriptions, no accounts, no ads

EmberEats feels like borrowing Grandad's camp cookbook, the one he kept in the glovebox and filled with decades of campfire wisdom.
```

**Promotional Text (170 chars, changeable anytime):**
```
New recipes added regularly. Plan your next camping trip with 150+ campfire-tested recipes organized by your gear.
```

### Preview Screenshots

Generator at `marketing/generate_previews.py`. Uses Pillow + Caveat fonts.

Workflow:
1. Run app in iPhone 15 Pro Max simulator
2. Take 5 screenshots, save to `marketing/screenshots/` (explore, recipe, methods, trip, favorites)
3. Run `python marketing/generate_previews.py`
4. Upload from `marketing/output/` to App Store Connect, 6.7-inch Display slot

### Low-Cost Marketing Channels
- Reddit: r/camping, r/CampfireCooking, r/campinggear, r/CampingandHiking (be genuine, not spammy)
- Product Hunt: free listing
- Camping forums and Facebook groups (seasonal push before summer)
- App Store: promotional text field is editable anytime without a new build

<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
## Custom Skills Available

### Auto-Triggering Skills
- **swiftui-view-scaffold** - Use when creating new screens or views
- **singleton-service** - Use when adding managers or services
- **design-tokens-audit** - Use when reviewing code quality

## Session Log

### Feb 21, 2026
- App is live on the App Store
- Created `marketing/generate_previews.py` — Pillow-based App Store preview screenshot generator using Caveat fonts + EmberEats parchment palette
- Created `marketing/screenshots/` (for raw simulator screenshots) and `marketing/output/` (for composited frames)
- Added ASO metadata: optimized subtitle, keywords, description, promotional text

# EmberEats - Product Specification v1.0

## Overview

**EmberEats** is a curated camping recipe app for iOS. It delivers recipes organized by cooking method so campers can find exactly what to make with the gear they have. The app is offline-first, beautifully designed, and laser-focused on one thing: helping you cook great food at camp.

**One-line pitch:** "What should we cook at camp tonight?"

## Target Audience

**Primary:** Car campers and families (weekend campground trips, coolers, fire pits, camp stoves)
**Secondary (premium packs):** Backpackers, RV/van life, Dutch oven enthusiasts

## Core Philosophy

- Find the right recipe fast, even without signal
- Organized by how you're cooking, not just what you're eating
- Curated quality over database quantity
- No accounts, no tracking, no complexity

## Screens

### 1. Onboarding (Single Screen)

Collects minimal preferences to personalize the experience:

- **Cooking equipment** (multi-select): Campfire, Camp Stove, Dutch Oven, Foil Packets, No-Cook
- **Dietary preferences** (multi-select, optional): Vegetarian, Vegan, Gluten-Free, Dairy-Free, Nut-Free
- **Group size default** (picker): Solo (1-2), Small Group (3-4), Family/Large (5+)
- **Disclaimer**: "Recipes are for reference. Always practice fire safety and check for food allergies."

All preferences editable later in Settings.

### 2. Explore (Home Tab)

The primary screen. Browse recipes with two filter dimensions:

**By Cooking Method (horizontal scroll chips):**
- All | Campfire | Camp Stove | Dutch Oven | Foil Packets | No-Cook

**By Meal Type (horizontal scroll chips):**
- All | Breakfast | Lunch | Dinner | Snacks | Desserts | Drinks

Recipes display as a vertical list of cards showing:
- Recipe name (serif, prominent)
- Cooking method icon + label
- Prep time + Cook time
- Difficulty indicator (Easy / Medium / Advanced)
- Heart icon for favoriting

Free tier: ~40 recipes visible and accessible
Premium: Full library (150+ recipes)

Locked recipes show a subtle lock indicator, tapping shows soft paywall.

### 3. Recipe Detail (Push from Explore)

Full recipe card with locked section order:

1. **Recipe name** - Large, serif
2. **Metadata row** - Cooking method | Prep time | Cook time | Serves | Difficulty
3. **Introduction** - 1-2 sentences. Why this recipe works at camp.
4. **Ingredients** - Bulleted list, scalable by group size
5. **Equipment needed** - What gear you need (e.g., "camp stove, large pot, spatula")
6. **Steps** - Numbered, concise instructions
7. **Pro tip** - One practical camping-specific tip (REQUIRED). Either a cooking trick for this recipe or adjacent camp craft wisdom. This is a key differentiator. See CONTENT.md for examples.
8. **Safety note** - Fire safety, food safety, or allergy note (when applicable, styled with left accent bar)

**Actions:** Heart (favorite), Share (iOS share sheet)

### 4. Favorites (Tab)

Grid or list of saved recipes. Available to all users (free and premium).

- Heart toggle to remove
- Empty state: "Save recipes you love. Tap the heart on any recipe."

### 5. Trip List (Tab, Premium)

Plan meals for an upcoming trip. Users add recipes from Explore or Favorites.

- Organized by meal type (Breakfast, Lunch, Dinner, Snacks)
- Drag to reorder
- Swipe to remove
- "Clear Trip" button
- Empty state: "Planning a trip? Add recipes here to have them ready at camp."

This is the key premium differentiator beyond recipe volume.

### 6. Settings (Tab)

- **Cooking Equipment** - Edit selections
- **Dietary Preferences** - Edit selections
- **Group Size** - Edit default
- **Premium Status** - Show current state, link to paywall
- **Restore Purchase**
- **About EmberEats** - Brief app description, version
- **Privacy Policy** / **Terms of Use** (links)

### 7. Paywall (Sheet)

Presented as a sheet when:
- User taps a locked recipe
- User taps Trip List tab without premium
- User taps "Unlock All" in Settings

Content:
- App icon or campfire illustration
- "Unlock the Full Campsite Kitchen"
- Feature list: 150+ recipes, Trip List planner, all cooking methods, all future recipes
- Price button: "Unlock for [price]"
- Restore link
- Dismiss button

Soft sell. Never blocking the free experience.

## Monetization

**Model:** Freemium with one-time unlock + future expansion packs

| Tier | Price | Includes |
|------|-------|----------|
| Free | $0 | ~40 curated recipes across all methods, Favorites |
| Premium Unlock | $4.99 | Full library (150+ recipes), Trip List, all future recipe additions |
| Expansion Packs (future) | $1.99-$2.99 each | Niche recipe collections: Backpacking/Ultralight, Dutch Oven Mastery, RV Kitchen, Tailgating, etc. |

**Product IDs:**
- `com.emberEats.premium` - Full unlock
- `com.emberEats.pack.backpacking` - Future pack example

## Data Model

```swift
struct Recipe: Identifiable, Codable {
    let id: String
    let name: String
    let cookingMethod: CookingMethod
    let mealType: MealType
    let prepTime: Int          // minutes
    let cookTime: Int          // minutes
    let servings: Int          // base serving count
    let difficulty: Difficulty
    let introduction: String   // 1-2 sentences
    let ingredients: [Ingredient]
    let equipment: [String]
    let steps: [String]
    let proTip: String          // REQUIRED - camping wisdom, see CONTENT.md
    let safetyNote: String?    // optional
    let dietaryTags: Set<DietaryTag>
    let isPremium: Bool
}

enum CookingMethod: String, CaseIterable, Codable {
    case campfire = "Campfire"
    case campStove = "Camp Stove"
    case dutchOven = "Dutch Oven"
    case foilPacket = "Foil Packets"
    case noCook = "No-Cook"
}

enum MealType: String, CaseIterable, Codable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snack = "Snacks"
    case dessert = "Desserts"
    case drink = "Drinks"
}

enum Difficulty: String, Codable {
    case easy = "Easy"
    case medium = "Medium"
    case advanced = "Advanced"
}

enum DietaryTag: String, CaseIterable, Codable {
    case vegetarian = "Vegetarian"
    case vegan = "Vegan"
    case glutenFree = "Gluten-Free"
    case dairyFree = "Dairy-Free"
    case nutFree = "Nut-Free"
}

struct Ingredient: Codable {
    let name: String
    let amount: String     // "2 cups", "1 lb", etc.
    let scalable: Bool     // whether to scale with group size
}
```

## Tabs

| Tab | Icon | Label | Access |
|-----|------|-------|--------|
| Explore | `flame` | Explore | All |
| Favorites | `heart` | Favorites | All |
| Trip List | `list.clipboard` | Trip List | Premium |
| Settings | `gearshape` | Settings | All |

## Post-Launch Roadmap (V1.1+)

- Filter recipes by difficulty level (data model already has `difficulty` on every recipe)
- One-tap "Add to Trip" button on recipe cards (matching the existing favorites heart)
- Dark mode ("campfire at night" aesthetic)

## V1.0 Changes from Original Spec

- **Onboarding removed** — app opens directly to Explore tab
- **Dietary preferences** moved to Explore page filter chips (below search bar)
- **Shopping List** added — auto-generated grocery list from trip recipes
- **Recipe Packs** added — 5 non-consumable packs in addition to full premium
- **Guest count** simplified to integer stepper (1-20), no enum tiers
- **Grocery list generation** implemented (was originally a non-goal)
- **Bundle ID** changed to `com.gfamlabs.EmberEats`

## Absolute Non-Goals (DO NOT IMPLEMENT)

- User accounts / sign-in
- Cloud sync
- Social features / sharing recipes between users
- Nutritional information / calorie counts
- Photo uploads
- User-submitted recipes
- AI features
- Push notifications
- Meal planning calendar
- Timer functionality

## Technical Requirements

- **Platform:** iOS 17+
- **Framework:** SwiftUI
- **Offline-first:** All recipes bundled in the app. No network required for core experience.
- **Persistence:** @AppStorage for preferences, UserDefaults for favorites and trip list (Codable arrays)
- **Monetization:** StoreKit 2
- **Color scheme:** Light mode only
- **Accessibility:** VoiceOver labels on all interactive elements

## Recipe Distribution (Target)

| Cooking Method | Free | Premium | Total |
|---------------|------|---------|-------|
| Campfire | 8 | 22 | 30 |
| Camp Stove | 10 | 25 | 35 |
| Dutch Oven | 6 | 19 | 25 |
| Foil Packets | 8 | 22 | 30 |
| No-Cook | 8 | 22 | 30 |
| **Total** | **40** | **110** | **150** |

Distribution across meal types should favor dinner (35%), breakfast (25%), lunch (15%), snacks (10%), desserts (10%), drinks (5%).

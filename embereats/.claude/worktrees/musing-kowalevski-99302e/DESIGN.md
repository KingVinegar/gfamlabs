# EmberEats - Visual Design System v1.0

## Emotional Design

### Core Emotional Goal
> "This feels like Grandad's camp cookbook that he kept in the glovebox."

The app should feel like: A well-loved, dog-eared recipe notebook that someone who really knows camping has been filling in for years. Warm, worn, trustworthy. Pencil on yellowed paper. Coffee ring optional.

Must feel like: Beloved family cookbook, handwritten recipe cards, campfire-side wisdom passed down
Must NOT feel like: Food blog, modern recipe app, survival manual, outdoor gear catalog, clinical database

### Emotional Benchmarks
- **Opening the app:** Like cracking open a familiar notebook. Warm, unhurried, lived-in.
- **Browsing recipes:** Flipping through pages. Each recipe feels hand-placed, not database-generated.
- **Reading a recipe:** Written by someone who's made this a hundred times. Confident, conversational.
- **At the campsite:** Practical and readable. Works in bright sun, works by headlamp.

### The "Cookbook" Feel Without Photos

Since v1 ships without recipe photography, the entire design must strongly convey "cookbook" through:
- **Typography that feels written, not typed** -- serif titles that evoke handwritten recipe headings
- **Card surfaces that feel like paper, not UI panels** -- warm cream, subtle texture in color, soft shadows
- **Decorative section dividers** -- thin, hand-drawn-style lines between sections (using lightweight SwiftUI shapes)
- **Generous whitespace** -- pages in a cookbook breathe. No cramped layouts.
- **Metadata that feels like penciled notes** -- prep times, difficulty, and tips styled lighter, like margin annotations

## Color Palette

Palette: Yellowed paper, campfire warmth, pencil marks, faded ink. A cookbook left on the picnic table all summer.

### Surfaces

| Token | Hex | Description |
|-------|-----|-------------|
| `background` | `#F2EBD9` | Aged parchment. Yellowed, warm, like old paper left in the sun. |
| `card` | `#FBF7EE` | Cream notebook page. The paper you'd write recipes on. |
| `raisedSurface` | `#EAE4D5` | Worn kraft paper. Tabs, chips, secondary surfaces. |

### Text

| Token | Hex | Description |
|-------|-----|-------------|
| `textPrimary` | `#33302A` | Dark brown ink. Not black. The color of a good fountain pen. |
| `textSecondary` | `#6B6355` | Faded ink. Section headers, metadata. |
| `textTertiary` | `#9A9184` | Pencil marks. Hints, footnotes, annotations. |

### Accents

| Token | Hex | Description |
|-------|-----|-------------|
| `ember` | `#C47A3F` | Warm copper-amber. The campfire glow. Primary actions only. |
| `pine` | `#5E7A56` | Faded forest green. Sparingly. Cooking method chips, secondary accents. |

### Lines & States

| Token | Hex | Description |
|-------|-----|-------------|
| `hairline` | `#DDD6C5` | Like a pencil line on old paper. |
| `disabledFill` | `#E8E2D4` | Faded paper. |
| `disabledText` | `#B5AFA2` | Nearly erased pencil. |

### Constraints

- No pure white (#FFFFFF) or pure black (#000000)
- No cool grays (anything blue-tinted or steel)
- No saturated colors. Everything should feel faded, sun-bleached, lived-in.
- No gradients
- Ember accent for primary actions only. Never large fills.
- Overall palette should feel like it's been sitting in a glovebox for 20 years.

## Typography

System fonts only. No custom font bundles. But we lean heavily on font design variants to evoke the handwritten cookbook feel.

| Element | Style | Design | Evokes |
|---------|-------|--------|--------|
| Recipe names | Title + semibold | `.serif` | Handwritten recipe heading in ink |
| Section headers (Ingredients, Steps) | Subheadline + semibold | `.rounded` | Penciled-in labels |
| Body / instructions | Body + regular | Default | Neatly written recipe steps |
| Metadata (times, servings) | Caption + regular | `.rounded` | Margin notes in pencil |
| Pro tips | Callout + regular, italic | Default | Scribbled afterthought |
| Buttons | Body + semibold | `.rounded` | Friendly, clear |

Font extensions:
- `.serifFont()` for recipe titles, the app name, and any "headline" text
- `.roundedFont()` for labels, buttons, chips, metadata

### Typography Feel

Recipe titles should feel like they were written at the top of a recipe card with a good pen. Body text should feel like careful handwriting that's easy to read. Metadata should feel like someone penciled in notes in the margin later.

## Geometry & Spacing

| Element | Value | Purpose |
|---------|-------|---------|
| Card corner radius | 16pt | Slightly less rounded than BabyFood. Recipe cards, not bubble UI. |
| Chip corner radius | 12pt | Filter chips, method tags |
| Button corner radius | 18pt | Action buttons |
| Input corner radius | 10pt | Form elements |
| Screen horizontal padding | 24pt | Breathing room |
| Card internal padding | 22pt | Inner space |
| Section gap | 20pt | Between content sections in detail view |
| Header to body gap | 6pt | Tight label-to-content |
| Recipe list card gap | 14pt | Space between recipe cards in list |

### Why Less Rounded

BabyFood uses 28pt card radius (soft, nursery-like). EmberEats uses 16pt -- slightly more angular, like the corners of an actual recipe card or notebook page. Still soft, but more "paper" and less "bubble."

## Shadows

Subtle. These cards should feel like they're resting on a table, not floating. Think: a recipe card sitting on the picnic table with a slight curl at the edges.

| Property | Value |
|----------|-------|
| Color | Black at 3% opacity |
| Radius | 12pt |
| Y offset | 3pt |

Even softer than BabyFood. The "worn paper" feel is achieved through color contrast more than shadow depth.

## Decorative Elements

### Section Dividers (Recipe Detail)

Between major sections in the recipe detail view (Introduction / Ingredients / Steps / Pro Tip), use a thin decorative divider:

```swift
// A simple "hand-drawn" style divider
HStack(spacing: 8) {
    Rectangle()
        .fill(DesignTokens.Colors.hairline)
        .frame(height: 1)
    Circle()
        .fill(DesignTokens.Colors.hairline)
        .frame(width: 4, height: 4)
    Rectangle()
        .fill(DesignTokens.Colors.hairline)
        .frame(height: 1)
}
.padding(.vertical, 8)
```

This small ornamental divider (line -- dot -- line) evokes the hand-drawn separators people put between recipes in a notebook.

### Cooking Method Badges

Small, tag-like badges that feel like handwritten labels:

```
[raisedSurface fill, chip radius, hairline border]
  Icon + Text  // caption, rounded, textSecondary
```

The hairline border on method badges (unlike other cards) evokes a stamped or labeled tag.

## Component Patterns

### Recipe Card (List Item)

```
[Card background, 16pt radius, soft shadow]
  VStack(leading, spacing: 10):
    Recipe Name              // title3, serif, semibold, textPrimary
    HStack:
      CookingMethod badge    // icon + label, caption, pine tint
      Dot separator          // textTertiary
      "25 min"               // caption, rounded, textTertiary
      Dot separator
      "Easy"                 // caption, rounded, textTertiary
    HStack:
      Spacer
      Heart icon             // ember when filled, textTertiary when empty
```

- No outer border. Card color against background provides contrast.
- The recipe name is the hero. Everything else is supporting annotation.
- Heart sits at bottom-right, like a penciled star in the margin.

### Filter Chips

```
[raisedSurface fill, chip radius]
  Text: label  // caption, semibold, rounded, textSecondary
```

Selected state:
```
[ember fill at 10% opacity, chip radius, ember hairline border]
  Text: label  // caption, semibold, rounded, ember
```

Horizontal scroll. Feels like tabbed index cards.

### Recipe Detail View

The full recipe page. This is the most important screen -- it must feel like reading a page from a cookbook.

```
ScrollView:
  VStack(leading, spacing: 0):

    Recipe Name              // title, serif, semibold, textPrimary
    HStack: metadata row     // method badge, time, servings, difficulty

    --- decorative divider ---

    Introduction             // body, textPrimary, lineSpacing 5

    --- decorative divider ---

    "Ingredients"            // subheadline, semibold, rounded, textSecondary
    ForEach ingredients:
      "- 2 cups rice"        // body, textPrimary

    --- decorative divider ---

    "What You'll Need"       // subheadline, semibold, rounded, textSecondary
    equipment list           // body, textSecondary

    --- decorative divider ---

    "Steps"                  // subheadline, semibold, rounded, textSecondary
    ForEach steps (numbered):
      "1. Bring water to..."  // body, textPrimary, lineSpacing 5

    --- decorative divider --- (only if pro tip or safety note exists)

    Pro Tip (optional):
      italic, textSecondary, with ember "lightbulb.fill" icon

    Safety Note (optional):
      left accent bar (ember at 25%), body, textPrimary
```

The decorative dividers between sections are critical to the cookbook feel. They replace the "section gap" that a modern UI app would use with something that feels handcrafted.

### Buttons

**Primary (CTA):**
```
[ember fill, 18pt radius]
  Text: label  // body, semibold, rounded, card color
```

**Secondary:**
```
[raisedSurface fill, 18pt radius, hairline border]
  Text: label  // body, semibold, rounded, textSecondary
```

Press feedback: `SoftPressStyle` -- opacity 0.7 only.

### Cooking Method Icons (SF Symbols)

| Method | Symbol | Rationale |
|--------|--------|-----------|
| Campfire | `flame` | Universal fire symbol |
| Camp Stove | `flame.circle` | Contained flame |
| Dutch Oven | `oven` | Direct match (iOS 17+) |
| Foil Packets | `rectangle.compress.vertical` | Folded/wrapped shape |
| No-Cook | `leaf` | Fresh, uncooked |

Icons use `pine` color when displayed in badges, `ember` when active/selected.

### Empty States

Warm, encouraging, in the cookbook voice:

```
VStack(center, spacing: 12):
  SF Symbol              // 36pt, textTertiary
  Title                  // body, serif, semibold, textSecondary
  Subtitle               // caption, textTertiary
```

Examples:
- Favorites empty: "Nothing saved yet. Heart any recipe to keep it here."
- Trip List empty: "Planning a trip? Add recipes to pack your menu."

### SoftPressStyle

```swift
struct SoftPressStyle: ButtonStyle {
    let isEnabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed && isEnabled ? 0.7 : 1.0)
    }
}
```

## Layout Rhythm

- Single column layout. One recipe card or one recipe page at a time.
- Generous whitespace -- this is a cookbook, not a feed. Let it breathe.
- Recipe cards in list: 14pt gap between cards.
- Recipe detail: sections separated by decorative dividers, not whitespace alone.
- Screen padding: 24pt horizontal on all screens.

## Light Mode Only

`preferredColorScheme(.light)` on all screens.

The warm parchment palette is designed for light mode. Dark mode would require a completely different aesthetic (campfire at night?) and is deferred to v2.

## Accessibility

- All interactive elements have `.accessibilityLabel` and `.accessibilityHint`
- Cooking method icons always paired with text labels
- Minimum tap target 44x44pt
- Dynamic Type support
- Heart button states announced ("Added to favorites" / "Removed from favorites")
- Recipe steps numbered for screen reader navigation
- Decorative dividers marked as `.accessibilityHidden(true)`

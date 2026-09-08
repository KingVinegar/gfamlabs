import SwiftUI

// MARK: - Design Tokens (DESIGN.md v1)

struct DesignTokens {
    // MARK: - Colors
    // Palette: Yellowed paper, campfire warmth, pencil marks, faded ink.

    struct Colors {
        // Surfaces - warm weathered paper
        static let background = Color(hex: "F7F3EB")      // Light weathered paper
        static let card = Color(hex: "FFFFFF")             // Clean white card
        static let raisedSurface = Color(hex: "EEEAE2")   // Worn kraft paper

        // Text - warm browns, never pure black
        static let textPrimary = Color(hex: "33302A")      // Dark brown ink
        static let textSecondary = Color(hex: "6B6355")    // Faded ink
        static let textTertiary = Color(hex: "9A9184")     // Pencil marks

        // Accents
        static let ember = Color(hex: "C47A3F")            // Warm copper-amber
        static let pine = Color(hex: "5E7A56")             // Faded forest green

        // Lines
        static let hairline = Color(hex: "E2DDD2")         // Pencil line on paper

        // States
        static let disabledFill = Color(hex: "ECE8E0")    // Faded paper
        static let disabledText = Color(hex: "B5AFA2")    // Nearly erased pencil
        static let error = Color(hex: "C44A3F")           // Warm red for errors
    }

    // MARK: - Geometry

    struct Radii {
        static let card: CGFloat = 16           // Recipe card corners
        static let chip: CGFloat = 12           // Filter chips, method tags
        static let button: CGFloat = 18         // Action buttons
        static let input: CGFloat = 10          // Form elements
    }

    // MARK: - Shadows
    // Subtle, paper-like. Cards resting on a table.

    struct Shadows {
        static let cardColor = Color.black.opacity(0.03)
        static let cardRadius: CGFloat = 12
        static let cardY: CGFloat = 3
    }

    // MARK: - Spacing
    // Generous breathing room, like a cookbook page.

    struct Spacing {
        static let screenHorizontal: CGFloat = 24
        static let cardPadding: CGFloat = 22
        static let sectionGap: CGFloat = 20
        static let headerToBody: CGFloat = 6
        static let recipeListCardGap: CGFloat = 14
    }
}

// MARK: - Color Extension

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 6:
            (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        self.init(
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255
        )
    }
}

// MARK: - Caveat Font (Handwritten)

extension Font {
    /// Handwritten font for recipe titles, section headers, personality spots.
    /// Sizes are tuned ~15% larger than system equivalents to match visual weight.
    static func caveat(_ size: CGFloat, weight: CaveatWeight = .regular, relativeTo style: TextStyle = .body) -> Font {
        .custom(weight.fontName, size: size, relativeTo: style)
    }

    enum CaveatWeight: Sendable {
        case regular, medium, semiBold, bold

        var fontName: String {
            switch self {
            case .regular:  return "Caveat-Regular"
            case .medium:   return "Caveat-Medium"
            case .semiBold: return "Caveat-SemiBold"
            case .bold:     return "Caveat-Bold"
            }
        }
    }
}

// MARK: - Font Extensions

extension View {
    /// Serif font — falls back to system serif when Caveat isn't appropriate
    func serifFont() -> some View {
        self.fontDesign(.serif)
    }

    /// Rounded font for labels, buttons, chips, metadata
    func roundedFont() -> some View {
        self.fontDesign(.rounded)
    }
}

// MARK: - Paper Texture Overlay

struct PaperTextureOverlay: View {
    var body: some View {
        Canvas { context, size in
            var rng = SeededRandomNumberGenerator(seed: 42)
            for _ in 0..<800 {
                let x = CGFloat.random(in: 0...size.width, using: &rng)
                let y = CGFloat.random(in: 0...size.height, using: &rng)
                let opacity = Double.random(in: 0.02...0.06, using: &rng)
                let dotSize = CGFloat.random(in: 0.5...1.5, using: &rng)
                context.fill(
                    Path(ellipseIn: CGRect(x: x, y: y, width: dotSize, height: dotSize)),
                    with: .color(Color.brown.opacity(opacity))
                )
            }
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

/// Simple seeded RNG for deterministic texture rendering
struct SeededRandomNumberGenerator: RandomNumberGenerator {
    private var state: UInt64

    init(seed: UInt64) {
        state = seed
    }

    mutating func next() -> UInt64 {
        state &+= 0x9e3779b97f4a7c15
        var z = state
        z = (z ^ (z >> 30)) &* 0xbf58476d1ce4e5b9
        z = (z ^ (z >> 27)) &* 0x94d049bb133111eb
        return z ^ (z >> 31)
    }
}

// MARK: - View Modifiers

extension View {
    func paperBackground() -> some View {
        self.background(
            ZStack {
                DesignTokens.Colors.background
                PaperTextureOverlay()
            }
            .ignoresSafeArea()
        )
    }

    func notebookPage() -> some View {
        self
            .padding(DesignTokens.Spacing.cardPadding)
            .background(
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: DesignTokens.Radii.card)
                        .fill(DesignTokens.Colors.card)
                    // Left margin line
                    RoundedRectangle(cornerRadius: 0.5)
                        .fill(DesignTokens.Colors.ember.opacity(0.12))
                        .frame(width: 1)
                        .padding(.leading, 16)
                        .padding(.vertical, 12)
                }
            )
            .shadow(
                color: DesignTokens.Shadows.cardColor,
                radius: DesignTokens.Shadows.cardRadius,
                x: 0, y: DesignTokens.Shadows.cardY
            )
    }

    func indexCardBorder(color: Color = DesignTokens.Colors.pine) -> some View {
        self.overlay(alignment: .leading) {
            UnevenRoundedRectangle(
                topLeadingRadius: DesignTokens.Radii.card,
                bottomLeadingRadius: DesignTokens.Radii.card,
                bottomTrailingRadius: 0,
                topTrailingRadius: 0
            )
            .fill(color)
            .frame(width: 4)
        }
        .clipShape(RoundedRectangle(cornerRadius: DesignTokens.Radii.card))
    }
}

// MARK: - Section Underline

struct SectionUnderline: View {
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(DesignTokens.Colors.ember.opacity(0.3))
                .frame(width: 28, height: 1.5)
            Spacer()
        }
    }
}

extension View {
    func sectionHeaderStyle() -> some View {
        VStack(alignment: .leading, spacing: 3) {
            self
            SectionUnderline()
        }
    }
}

// MARK: - SoftPressStyle

struct SoftPressStyle: ButtonStyle {
    let isEnabled: Bool

    init(isEnabled: Bool = true) {
        self.isEnabled = isEnabled
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed && isEnabled ? 0.7 : 1.0)
    }
}

// MARK: - CookbookDivider

/// Simple pencil-stroke divider between recipe sections
struct CookbookDivider: View {
    var body: some View {
        Rectangle()
            .fill(DesignTokens.Colors.hairline)
            .frame(height: 0.5)
            .padding(.vertical, 10)
            .accessibilityHidden(true)
    }
}

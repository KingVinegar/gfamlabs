#!/usr/bin/env python3
"""Generate App Store preview screenshots for EmberEats.

Takes raw simulator screenshots, composites them into marketing frames
with headlines, subtitles, and the EmberEats visual language.

Outputs frames for all App Store Connect iPhone display sizes:
  - 6.7-inch (1290x2796) — iPhone 14/15 Pro Max, 15/16 Plus
  - 6.5-inch (1284x2778) — iPhone 12/13 Pro Max
  - 6.1-inch (1179x2556) — iPhone 14, 14 Pro, 15, 15 Pro

Usage:
    1. Run the app in iPhone 15 Pro Max simulator
    2. Take 5 screenshots and save to marketing/screenshots/
    3. Run:  python marketing/generate_previews.py
    4. Upload PNGs from marketing/output/<size>/ to App Store Connect

Requires: pip install Pillow
"""

import sys
from pathlib import Path

try:
    from PIL import Image, ImageDraw, ImageFont, ImageFilter
except ImportError:
    print("Pillow required: pip install Pillow")
    sys.exit(1)

# === Paths ===
BASE = Path(__file__).parent
SCREENSHOT_DIR = BASE / "screenshots"
OUTPUT_DIR = BASE / "output"
FONT_DIR = BASE.parent / "EmberEats" / "Fonts"

# === Master canvas (iPhone 15 Pro Max, 6.7-inch) ===
W, H = 1290, 2796

# === Target sizes for App Store Connect ===
SIZES = {
    "6.7": (1290, 2796),
    "6.5": (1284, 2778),
    "6.1": (1179, 2556),
}

# === Colors (EmberEats design tokens) ===
BG_TOP = (244, 239, 228)       # Warm parchment
BG_BOT = (236, 229, 214)       # Slightly deeper
INK = (51, 48, 42)             # textPrimary
FADED = (107, 99, 85)          # textSecondary
EMBER = (196, 122, 63)         # Accent
HAIRLINE = (221, 214, 197)     # Divider color
PENCIL = (154, 145, 132)       # textTertiary

# === Layout ===
MARGIN_X = 80
SCREENSHOT_Y = 620
SCREENSHOT_END = H - 60
CORNER_R = 44

# === Frame definitions ===
FRAMES = [
    {
        "src": "explore.png",
        "headline": "What Should We\nCook Tonight?",
        "subtitle": "150+ campfire-tested recipes",
        "out": "01_explore.png",
    },
    {
        "src": "recipe.png",
        "headline": "Recipes That\nWork at Camp",
        "subtitle": "Step-by-step with real camper pro tips",
        "out": "02_recipe.png",
    },
    {
        "src": "methods.png",
        "headline": "Find Recipes\nby Your Gear",
        "subtitle": "Campfire \u00b7 Stove \u00b7 Dutch Oven \u00b7 Foil \u00b7 No-Cook",
        "out": "03_methods.png",
    },
    {
        "src": "trip.png",
        "headline": "One Trip to\nthe Store",
        "subtitle": "Auto-generated shopping list from your camp menu",
        "out": "04_trip.png",
    },
    {
        "src": "favorites.png",
        "headline": "No Signal?\nNo Problem.",
        "subtitle": "Everything works offline",
        "out": "05_offline.png",
    },
]


def gradient_bg():
    """Vertical gradient from warm parchment top to slightly deeper bottom."""
    strip = Image.new("RGB", (1, H))
    for y in range(H):
        t = y / H
        r = int(BG_TOP[0] + (BG_BOT[0] - BG_TOP[0]) * t)
        g = int(BG_TOP[1] + (BG_BOT[1] - BG_TOP[1]) * t)
        b = int(BG_TOP[2] + (BG_BOT[2] - BG_TOP[2]) * t)
        strip.putpixel((0, y), (r, g, b))
    return strip.resize((W, H), Image.NEAREST)


def rounded_mask(size, radius):
    """Create an alpha mask with rounded corners."""
    mask = Image.new("L", size, 0)
    ImageDraw.Draw(mask).rounded_rectangle([(0, 0), size], radius=radius, fill=255)
    return mask


def draw_divider(draw, y):
    """Draw the cookbook-style divider: line - dot - line."""
    cx = W // 2
    draw.line([(cx - 140, y), (cx - 14, y)], fill=HAIRLINE, width=2)
    draw.ellipse([(cx - 5, y - 5), (cx + 5, y + 5)], fill=EMBER)
    draw.line([(cx + 14, y), (cx + 140, y)], fill=HAIRLINE, width=2)


def build_frame(frame, h_font, s_font):
    """Generate a single marketing preview frame at master size. Returns the image."""
    canvas = gradient_bg().convert("RGBA")
    draw = ImageDraw.Draw(canvas)

    # --- Headline ---
    headline = frame["headline"]
    bbox = draw.multiline_textbbox((0, 0), headline, font=h_font, align="center")
    h_height = bbox[3] - bbox[1]
    headline_top = 160
    draw.multiline_text(
        (W // 2, headline_top), headline,
        font=h_font, fill=INK, anchor="ma", align="center",
    )

    # --- Divider ---
    div_y = headline_top + h_height + 30
    draw_divider(draw, div_y)

    # --- Subtitle ---
    draw.text(
        (W // 2, div_y + 36), frame["subtitle"],
        font=s_font, fill=FADED, anchor="ma",
    )

    # --- Screenshot or placeholder ---
    sc_path = SCREENSHOT_DIR / frame["src"]
    if sc_path.exists():
        sc = Image.open(sc_path).convert("RGBA")

        # Scale to fit the available area
        avail_w = W - 2 * MARGIN_X
        avail_h = SCREENSHOT_END - SCREENSHOT_Y
        scale = min(avail_w / sc.width, avail_h / sc.height)
        nw, nh = int(sc.width * scale), int(sc.height * scale)
        sc = sc.resize((nw, nh), Image.LANCZOS)

        # Round corners
        mask = rounded_mask((nw, nh), CORNER_R)
        sc.putalpha(mask)

        # Position (centered horizontally, pinned to SCREENSHOT_Y)
        sx = (W - nw) // 2
        sy = SCREENSHOT_Y

        # Drop shadow
        shadow_img = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
        sd = ImageDraw.Draw(shadow_img)
        sd.rounded_rectangle(
            [(sx + 4, sy + 16), (sx + nw - 4, sy + nh + 16)],
            radius=CORNER_R,
            fill=(30, 28, 24, 45),
        )
        shadow_img = shadow_img.filter(ImageFilter.GaussianBlur(24))
        canvas = Image.alpha_composite(canvas, shadow_img)

        # Paste screenshot
        canvas.paste(sc, (sx, sy), sc)
        has_screenshot = True
    else:
        # Placeholder
        draw.rounded_rectangle(
            [(MARGIN_X, SCREENSHOT_Y), (W - MARGIN_X, SCREENSHOT_END)],
            radius=CORNER_R, fill=(228, 223, 213), outline=HAIRLINE, width=2,
        )
        draw.text(
            (W // 2, (SCREENSHOT_Y + SCREENSHOT_END) // 2),
            f"screenshots/{frame['src']}",
            font=s_font, fill=PENCIL, anchor="mm",
        )
        has_screenshot = False

    return canvas, has_screenshot


def main():
    SCREENSHOT_DIR.mkdir(parents=True, exist_ok=True)

    # Create output subdirectories for each size
    for label in SIZES:
        (OUTPUT_DIR / label).mkdir(parents=True, exist_ok=True)

    # Load Caveat fonts
    caveat_bold = FONT_DIR / "Caveat-Bold.ttf"
    caveat_semi = FONT_DIR / "Caveat-SemiBold.ttf"

    if caveat_bold.exists():
        h_font = ImageFont.truetype(str(caveat_bold), 128)
        s_font = ImageFont.truetype(str(caveat_semi), 52)
    else:
        print(f"Warning: Caveat fonts not found at {FONT_DIR}")
        print("Using system defaults (output won't match app branding)")
        h_font = ImageFont.load_default()
        s_font = ImageFont.load_default()

    print("EmberEats App Store Preview Generator")
    print(f"  Screenshots: {SCREENSHOT_DIR}/")
    print(f"  Output:      {OUTPUT_DIR}/")
    print(f"  Sizes:       {', '.join(f'{l}\" ({w}x{h})' for l, (w, h) in SIZES.items())}")
    print()

    found = 0
    for frame in FRAMES:
        canvas, has_screenshot = build_frame(frame, h_font, s_font)

        # Save at each target size
        for label, (tw, th) in SIZES.items():
            if tw == W and th == H:
                # Master size — save directly
                out = canvas.convert("RGB")
            else:
                # Resize from master
                out = canvas.convert("RGB").resize((tw, th), Image.LANCZOS)
            out.save(OUTPUT_DIR / label / frame["out"], "PNG")

        status = "OK" if has_screenshot else "placeholder"
        print(f"  [{status:>11}]  {frame['out']}  ({len(SIZES)} sizes)")
        if has_screenshot:
            found += 1

    total = found * len(SIZES)
    print(f"\n  {found}/{len(FRAMES)} screenshots x {len(SIZES)} sizes = {total} files generated.")

    if found < len(FRAMES):
        print("\n  Missing screenshots — take these in iPhone 15 Pro Max simulator:")
        for frame in FRAMES:
            if not (SCREENSHOT_DIR / frame["src"]).exists():
                print(f"    - {frame['src']}")
        print(f"\n  Save to: {SCREENSHOT_DIR}/")
        print("  Then re-run this script.")
    else:
        print(f"\n  All done! Upload to App Store Connect:")
        for label, (w, h) in SIZES.items():
            print(f"    {label}-inch Display ({w}x{h}):  {OUTPUT_DIR / label}/")


if __name__ == "__main__":
    main()

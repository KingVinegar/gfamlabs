#!/usr/bin/env python3
"""Generate mockup screenshots that replicate the EmberEats app UI.
No Xcode or simulator needed — draws screens directly with Pillow.

Usage:  python marketing/generate_mockups.py
Output: marketing/screenshots/ (then auto-runs generate_previews.py)
"""

import sys
import subprocess
from pathlib import Path

try:
    from PIL import Image, ImageDraw, ImageFont
except ImportError:
    print("pip install Pillow")
    sys.exit(1)

BASE = Path(__file__).parent
OUT = BASE / "screenshots"
FONT_DIR = BASE.parent / "EmberEats" / "Fonts"

# === Dimensions (iPhone 15 Pro Max @ 3x) ===
W, H = 1290, 2796
S = 3  # scale factor

# === Colors (from Theme.swift) ===
BG     = (247, 243, 235)    # background
CARD   = (255, 255, 255)    # card
RAISED = (238, 234, 226)    # raisedSurface
INK    = (51, 48, 42)       # textPrimary
FADED  = (107, 99, 85)      # textSecondary
PENCIL = (154, 145, 132)    # textTertiary
EMBER  = (196, 122, 63)     # ember accent
PINE   = (94, 122, 86)      # pine accent
HAIR   = (226, 221, 210)    # hairline

# === Layout (pixels at 3x) ===
PAD    = 72                  # screen horizontal padding
CPAD   = 66                  # card internal padding
CR     = 48                  # card corner radius
CHIP_R = 36                  # chip corner radius
STATUS = 141                 # status bar height
GAP    = 42                  # list card gap

# === Recipe data (from actual app content) ===
FEATURED = {
    "name": "Foil Packet Fajitas", "method": "Foil Packets",
    "intro": "Everything cooks together in one packet. No pan to scrub, and the chicken stays juicy.",
    "time": 35, "diff": "Easy",
}
QUICK = [
    {"name": "Trail Mix", "method": "No-Cook", "time": 5,
     "intro": "Mix it at home or at camp. Keeps for the whole trip."},
    {"name": "Camp Scrambled Eggs", "method": "Camp Stove", "time": 10,
     "intro": "Simple eggs that work every time."},
    {"name": "Classic S'mores", "method": "Campfire", "time": 5,
     "intro": "There's a right way to toast a marshmallow."},
]
DETAIL = {
    "name": "One-Pot Chili", "method": "Camp Stove",
    "prep": 10, "cook": 30, "servings": 6, "diff": "Easy",
    "intro": "A camp classic that feeds a crowd. Tastes even better the second day.",
    "ingredients": [
        "2 lbs ground beef", "1 large onion, diced",
        "2 cans (15 oz) kidney beans", "1 can (28 oz) diced tomatoes",
        "2 tbsp tomato paste", "3 tbsp chili powder",
        "1 tbsp cumin", "1 tsp salt",
    ],
    "equipment": ["camp stove", "large pot with lid"],
    "steps": [
        "Heat oil in the pot over medium-high heat.",
        "Add ground beef and cook 6-8 minutes, breaking it up, until browned.",
        "Add onion and cook 3 minutes until soft.",
        "Stir in chili powder, cumin, and salt. Cook 1 minute.",
        "Add tomatoes, tomato paste, and beans with their liquid.",
        "Bring to a boil, then reduce heat to low.",
        "Cover and simmer 20 minutes, stirring occasionally.",
    ],
    "tip": "Freeze the ground beef before packing. It doubles as an ice pack and thaws by dinner.",
}
TRIP = [
    ("Breakfast", ["Campfire Scrambled Eggs", "Overnight Oats", "Camp Pancakes"]),
    ("Lunch", ["Turkey & Cheese Wraps"]),
    ("Dinner", ["One-Pot Chili", "Foil Packet Fajitas"]),
    ("Snacks", ["Trail Mix"]),
]
FAVS = [
    {"name": "Foil Packet Fajitas", "method": "Foil Packets", "time": 35,
     "intro": "Everything cooks together in one packet."},
    {"name": "One-Pot Chili", "method": "Camp Stove", "time": 40,
     "intro": "A camp classic that feeds a crowd."},
    {"name": "Classic S'mores", "method": "Campfire", "time": 5,
     "intro": "The right way to toast a marshmallow."},
    {"name": "Overnight Oats", "method": "No-Cook", "time": 5,
     "intro": "Prep before bed, breakfast is ready."},
]
METHODS = ["Campfire", "Camp Stove", "Dutch Oven", "Foil Packets", "No-Cook"]
MEALS = [("Breakfast", 32), ("Lunch", 18), ("Dinner", 45),
         ("Snacks", 22), ("Desserts", 15), ("Drinks", 8)]


# === Font loading ===

def load_fonts():
    """Load Caveat + system sans-serif fonts."""
    fonts = {}
    cb = str(FONT_DIR / "Caveat-Bold.ttf")
    cs = str(FONT_DIR / "Caveat-SemiBold.ttf")

    fonts["hero"]    = ImageFont.truetype(cb, 108)   # recipe name (detail)
    fonts["title"]   = ImageFont.truetype(cb, 72)    # featured recipe name
    fonts["card"]    = ImageFont.truetype(cs, 57)    # list card name
    fonts["hcard"]   = ImageFont.truetype(cs, 48)    # horizontal card name

    # System sans-serif for UI text
    def sys(size, bold=False):
        candidates = [
            "/System/Library/Fonts/SFNSText-Bold.otf" if bold else "/System/Library/Fonts/SFNSText.otf",
            "/System/Library/Fonts/Helvetica.ttc",
            "/Library/Fonts/Arial.ttf",
        ]
        for p in candidates:
            try:
                return ImageFont.truetype(p, size)
            except (OSError, IOError):
                continue
        return ImageFont.truetype(cb if bold else cs, size)

    fonts["nav"]       = sys(102, True)    # large nav title
    fonts["head"]      = sys(48, True)     # section headers
    fonts["body"]      = sys(42)           # body text
    fonts["sub"]       = sys(39)           # subheadline
    fonts["cap"]       = sys(33)           # caption
    fonts["capb"]      = sys(33, True)     # caption bold
    fonts["cap2"]      = sys(30)           # tiny
    fonts["status"]    = sys(36, True)     # status bar
    fonts["tab"]       = sys(27)           # tab labels
    return fonts


# === Drawing helpers ===

def wrap(draw, text, font, max_w):
    """Word-wrap text to fit max_w pixels."""
    words = text.split()
    lines, cur = [], ""
    for w in words:
        test = f"{cur} {w}".strip()
        if draw.textlength(test, font=font) <= max_w:
            cur = test
        else:
            if cur:
                lines.append(cur)
            cur = w
    if cur:
        lines.append(cur)
    return "\n".join(lines)


def text_h(draw, text, font, spacing=0):
    """Height of multiline text."""
    bb = draw.multiline_textbbox((0, 0), text, font=font, spacing=spacing)
    return bb[3] - bb[1]


def rrect(draw, xy, r, fill=None, outline=None, width=1):
    draw.rounded_rectangle(xy, radius=r, fill=fill, outline=outline, width=width)


def status_bar(draw, F):
    y = 48
    draw.text((PAD + 6, y), "9:41", font=F["status"], fill=INK)
    bx = W - PAD - 78
    rrect(draw, [(bx, y + 6), (bx + 66, y + 30)], 6, outline=INK, width=2)
    rrect(draw, [(bx + 3, y + 9), (bx + 54, y + 27)], 3, fill=INK)
    rrect(draw, [(bx + 66, y + 12), (bx + 72, y + 24)], 2, fill=INK)


def nav_large(draw, title, F, y=STATUS):
    draw.text((PAD, y + 24), title, font=F["nav"], fill=INK)
    return y + 162


def search_bar(draw, F, y):
    rrect(draw, [(PAD, y), (W - PAD, y + 102)], 30, fill=RAISED)
    cx = PAD + 42
    cy = y + 51
    draw.ellipse([(cx - 12, cy - 12), (cx + 12, cy + 12)], outline=PENCIL, width=3)
    draw.line([(cx + 9, cy + 9), (cx + 18, cy + 18)], fill=PENCIL, width=3)
    draw.text((PAD + 72, y + 30), "What are we making?", font=F["cap"], fill=PENCIL)
    return y + 114


def tab_bar(draw, F, active=0):
    ty = H - 246
    draw.rectangle([(0, ty), (W, H)], fill=BG)
    draw.line([(0, ty), (W, ty)], fill=HAIR, width=1)
    labels = ["Explore", "Favorites", "Trip List", "Settings"]
    tw = W // 4
    for i, label in enumerate(labels):
        cx = tw * i + tw // 2
        color = EMBER if i == active else PENCIL
        iy = ty + 36
        # Simple icon representations
        if i == 0:    # flame
            draw.polygon([(cx, iy - 15), (cx + 12, iy + 6), (cx, iy + 15), (cx - 12, iy + 6)], fill=color)
        elif i == 1:  # heart
            draw.text((cx - 15, iy - 15), "\u2665", font=F["capb"], fill=color)
        elif i == 2:  # list
            for j in range(3):
                draw.line([(cx - 12, iy - 6 + j * 10), (cx + 12, iy - 6 + j * 10)], fill=color, width=3)
        elif i == 3:  # gear
            draw.ellipse([(cx - 10, iy - 10), (cx + 10, iy + 10)], outline=color, width=3)
        bb = draw.textbbox((0, 0), label, font=F["tab"])
        lw = bb[2] - bb[0]
        draw.text((cx - lw // 2, iy + 24), label, font=F["tab"], fill=color)


def divider(draw, y):
    draw.line([(PAD, y), (W - PAD, y)], fill=HAIR, width=2)
    return y + 30


def badge(draw, x, y, text, F):
    """Draw a cooking method badge. Returns width."""
    tw = draw.textlength(text, font=F["cap2"])
    bw = int(tw) + 48
    rrect(draw, [(x, y), (x + bw, y + 42)], CHIP_R, fill=RAISED, outline=HAIR, width=1)
    draw.text((x + 24, y + 6), text, font=F["cap2"], fill=FADED)
    return bw


def recipe_card(draw, x, y, w, r, F, heart=False):
    """Draw a recipe list card. Returns bottom y."""
    max_tw = w - 2 * CPAD
    name = wrap(draw, r["name"], F["card"], max_tw)
    nh = text_h(draw, name, F["card"])
    intro = wrap(draw, r.get("intro", ""), F["sub"], max_tw)
    ih = text_h(draw, intro, F["sub"]) if intro else 0
    ch = CPAD + nh + 18 + ih + 18 + 42 + 18 + (36 if heart else 0) + CPAD

    rrect(draw, [(x, y), (x + w, y + ch)], CR, fill=CARD)

    cy = y + CPAD
    draw.multiline_text((x + CPAD, cy), name, font=F["card"], fill=INK)
    cy += nh + 18
    if intro:
        draw.multiline_text((x + CPAD, cy), intro, font=F["sub"], fill=FADED)
        cy += ih + 18
    bw = badge(draw, x + CPAD, cy, r.get("method", ""), F)
    meta = f"\u00b7  {r.get('time', 0)} min  \u00b7  {r.get('diff', 'Easy')}"
    draw.text((x + CPAD + bw + 18, cy + 6), meta, font=F["cap"], fill=PENCIL)
    cy += 42 + 18
    if heart:
        draw.text((x + w - CPAD - 36, cy - 12), "\u2665", font=F["capb"], fill=EMBER)
    return y + ch


# === Screen builders ===

def screen_explore(F):
    img = Image.new("RGB", (W, H), BG)
    d = ImageDraw.Draw(img)
    status_bar(d, F)
    y = nav_large(d, "Explore", F)
    y = search_bar(d, F, y)
    y += 24

    # Today's Pick
    d.text((PAD, y), "TODAY\u2019S PICK", font=F["capb"], fill=EMBER)
    y += 48

    r = FEATURED
    cw = W - 2 * PAD
    name = wrap(d, r["name"], F["title"], cw - 2 * CPAD)
    nh = text_h(d, name, F["title"])
    intro = wrap(d, r["intro"], F["sub"], cw - 2 * CPAD)
    ih = text_h(d, intro, F["sub"])
    fh = CPAD + nh + 18 + ih + 24 + 42 + CPAD

    rrect(d, [(PAD, y), (W - PAD, y + fh)], CR, fill=CARD)
    cy = y + CPAD
    d.multiline_text((PAD + CPAD, cy), name, font=F["title"], fill=INK)
    cy += nh + 18
    d.multiline_text((PAD + CPAD, cy), intro, font=F["sub"], fill=FADED)
    cy += ih + 24
    bw = badge(d, PAD + CPAD, cy, r["method"], F)
    d.text((PAD + CPAD + bw + 18, cy + 6),
           f"\u00b7  {r['time']} min  \u00b7  {r['diff']}", font=F["cap"], fill=PENCIL)
    y += fh + GAP + 18

    # Quick & Easy
    d.text((PAD, y), "Quick & Easy", font=F["head"], fill=INK)
    sa = "See All"
    d.text((W - PAD - d.textlength(sa, font=F["capb"]), y + 12), sa, font=F["capb"], fill=EMBER)
    y += 72

    hx = PAD
    for qr in QUICK:
        hw, hh = 540, 330
        rrect(d, [(hx, y), (hx + hw, y + hh)], CR, fill=CARD)
        qn = wrap(d, qr["name"], F["hcard"], hw - 84)
        d.multiline_text((hx + 42, y + 30), qn, font=F["hcard"], fill=INK)
        qi = wrap(d, qr["intro"], F["cap"], hw - 84)
        d.multiline_text((hx + 42, y + 120), qi, font=F["cap"], fill=FADED)
        badge(d, hx + 42, y + hh - 72, qr["method"], F)
        hx += hw + 36
    y += 330 + GAP + 24

    # By Method
    d.text((PAD, y), "By Method", font=F["head"], fill=INK)
    y += 72
    col_w = (W - 2 * PAD - 30) // 2
    for i, method in enumerate(METHODS):
        col, row = i % 2, i // 2
        mx = PAD + col * (col_w + 30)
        my = y + row * 156
        rrect(d, [(mx, my), (mx + col_w, my + 126)], CR, fill=CARD)
        rrect(d, [(mx, my), (mx + 12, my + 126)], 6, fill=PINE)
        d.text((mx + 48, my + 42), method, font=F["sub"], fill=INK)

    tab_bar(d, F, active=0)
    return img


def screen_recipe(F):
    img = Image.new("RGB", (W, H), BG)
    d = ImageDraw.Draw(img)
    status_bar(d, F)

    y = STATUS
    d.text((PAD, y + 36), "\u2039  Back", font=F["capb"], fill=EMBER)
    d.text((W - PAD - 84, y + 36), "\u2665", font=F["capb"], fill=EMBER)
    y += 132

    r = DETAIL
    name = wrap(d, r["name"], F["hero"], W - 2 * PAD)
    d.multiline_text((PAD, y), name, font=F["hero"], fill=INK)
    y += text_h(d, name, F["hero"]) + 30

    bw = badge(d, PAD, y, r["method"], F)
    meta = [f"Prep {r['prep']}m", f"Cook {r['cook']}m", f"Serves {r['servings']}", r["diff"]]
    mx = PAD + bw + 18
    for m in meta:
        d.text((mx, y + 6), m, font=F["cap"], fill=PENCIL)
        mx += int(d.textlength(m, font=F["cap"])) + 24
    y += 48
    y = divider(d, y)

    intro = wrap(d, r["intro"], F["body"], W - 2 * PAD)
    d.multiline_text((PAD, y), intro, font=F["body"], fill=INK, spacing=15)
    y += text_h(d, intro, F["body"], 15) + 18
    y = divider(d, y)

    d.text((PAD, y), "Ingredients", font=F["capb"], fill=FADED)
    y += 54
    for ing in r["ingredients"]:
        d.text((PAD, y), f"\u2022  {ing}", font=F["body"], fill=INK)
        y += 54
    y += 6
    y = divider(d, y)

    d.text((PAD, y), "What You\u2019ll Need", font=F["capb"], fill=FADED)
    y += 54
    for eq in r["equipment"]:
        d.text((PAD, y), f"\u2022  {eq}", font=F["body"], fill=INK)
        y += 54
    y += 6
    y = divider(d, y)

    d.text((PAD, y), "Steps", font=F["capb"], fill=FADED)
    y += 54
    for i, step in enumerate(r["steps"][:5]):
        st = wrap(d, step, F["body"], W - 2 * PAD - 72)
        d.text((PAD, y), f"{i + 1}.", font=F["body"], fill=FADED)
        d.multiline_text((PAD + 72, y), st, font=F["body"], fill=INK, spacing=15)
        y += max(text_h(d, st, F["body"], 15), 42) + 24
    y = divider(d, y)

    # Camper's Tip
    tip = wrap(d, r["tip"], F["body"], W - 2 * PAD - 72)
    th = text_h(d, tip, F["body"], 12)
    rrect(d, [(PAD, y), (W - PAD, y + 54 + th + 42)], 24, fill=(253, 247, 241))
    d.text((PAD + 36, y + 18), "Camper\u2019s Tip", font=F["capb"], fill=EMBER)
    d.multiline_text((PAD + 36, y + 60), tip, font=F["body"], fill=FADED, spacing=12)

    return img


def screen_methods(F):
    img = Image.new("RGB", (W, H), BG)
    d = ImageDraw.Draw(img)
    status_bar(d, F)
    y = nav_large(d, "Explore", F) + 12

    d.text((PAD, y), "By Method", font=F["head"], fill=INK)
    y += 72
    col_w = (W - 2 * PAD - 30) // 2
    rh = 126
    for i, method in enumerate(METHODS):
        col, row = i % 2, i // 2
        mx = PAD + col * (col_w + 30)
        my = y + row * (rh + 30)
        rrect(d, [(mx, my), (mx + col_w, my + rh)], CR, fill=CARD)
        rrect(d, [(mx, my), (mx + 12, my + rh)], 6, fill=PINE)
        d.text((mx + 48, my + (rh - 42) // 2), method, font=F["sub"], fill=INK)
    y += 3 * (rh + 30) + 24

    d.text((PAD, y), "All Recipes", font=F["head"], fill=INK)
    y += 72
    for i, (meal, count) in enumerate(MEALS):
        col, row = i % 2, i // 2
        mx = PAD + col * (col_w + 30)
        my = y + row * (rh + 30)
        rrect(d, [(mx, my), (mx + col_w, my + rh)], CR, fill=CARD)
        rrect(d, [(mx, my), (mx + 12, my + rh)], 6, fill=EMBER)
        d.text((mx + 48, my + 24), meal, font=F["sub"], fill=INK)
        d.text((mx + 48, my + 72), f"{count} recipes", font=F["cap2"], fill=PENCIL)
        d.text((mx + col_w - 48, my + (rh - 30) // 2), "\u203a", font=F["cap"], fill=PENCIL)

    tab_bar(d, F, active=0)
    return img


def screen_trip(F):
    img = Image.new("RGB", (W, H), BG)
    d = ImageDraw.Draw(img)
    status_bar(d, F)
    y = nav_large(d, "Trip List", F) + 12

    for meal, recipes in TRIP:
        d.text((PAD, y), meal.upper(), font=F["capb"], fill=FADED)
        y += 54
        for name in recipes:
            rrect(d, [(PAD, y), (W - PAD, y + 120)], CR, fill=CARD)
            d.text((PAD + CPAD, y + 30), name, font=F["hcard"], fill=INK)
            # Grip dots
            for j in range(3):
                gx, gy = W - PAD - 48, y + 42 + j * 12
                d.line([(gx, gy), (gx + 18, gy)], fill=HAIR, width=2)
            y += 138
        y += 30

    tab_bar(d, F, active=2)
    return img


def screen_favorites(F):
    img = Image.new("RGB", (W, H), BG)
    d = ImageDraw.Draw(img)
    status_bar(d, F)
    y = nav_large(d, "Favorites", F) + 12

    cw = W - 2 * PAD
    for r in FAVS:
        y = recipe_card(d, PAD, y, cw, r, F, heart=True)
        y += GAP

    tab_bar(d, F, active=1)
    return img


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    print("Loading fonts...")
    F = load_fonts()

    screens = [
        ("explore.png",   "Explore tab",   screen_explore),
        ("recipe.png",    "Recipe detail",  screen_recipe),
        ("methods.png",   "By Method grid", screen_methods),
        ("trip.png",      "Trip List",      screen_trip),
        ("favorites.png", "Favorites",      screen_favorites),
    ]

    print(f"Generating {len(screens)} mockup screenshots...\n")
    for fn, label, builder in screens:
        img = builder(F)
        img.save(OUT / fn, "PNG")
        print(f"  {fn:20s} {label}")

    print(f"\nSaved to {OUT}/")

    # Auto-run preview generator
    gen = BASE / "generate_previews.py"
    if gen.exists():
        print("\nCompositing marketing frames...\n")
        subprocess.run([sys.executable, str(gen)])


if __name__ == "__main__":
    main()

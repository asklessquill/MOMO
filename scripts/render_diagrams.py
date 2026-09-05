"""Render public-safe diagrams to PNG for GitHub README."""

from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[1]
ASSETS = ROOT / "assets"
PAPER = (255, 248, 241)
INK = (44, 33, 28)
MUTED = (122, 97, 86)
PEACH = (244, 199, 176)
PEACH_INK = (106, 64, 48)
SAND = (239, 224, 200)
LEAF = (232, 240, 228)
LEAF_INK = (77, 95, 69)
TAN = (243, 230, 210)
TAN_INK = (106, 77, 50)
SKY = (231, 238, 244)
SKY_INK = (61, 83, 102)
LINE = (201, 164, 140)
SOFT = (230, 211, 194)


def font(size: int, serif: bool = True) -> ImageFont.FreeTypeFont | ImageFont.ImageFont:
    names = (
        ["georgia.ttf", "Georgia.ttf"]
        if serif
        else ["segoeui.ttf", "SegoeUI.ttf", "arial.ttf"]
    )
    for name in names:
        try:
            return ImageFont.truetype(name, size)
        except OSError:
            continue
    return ImageFont.load_default()


def rounded(draw: ImageDraw.ImageDraw, box, radius: int, fill) -> None:
    draw.rounded_rectangle(box, radius=radius, fill=fill)


def center_text(draw, xy, text, fnt, fill) -> None:
    x, y = xy
    draw.text((x, y), text, font=fnt, fill=fill, anchor="mm")


def system_map() -> None:
    img = Image.new("RGB", (960, 1080), PAPER)
    d = ImageDraw.Draw(img)
    serif, sans = font(28), font(20, False)
    small = font(18, False)
    title = font(36)

    center_text(d, (480, 48), "Human is outside the system", sans, MUTED)
    rounded(d, (300, 78, 660, 162), 36, INK)
    center_text(d, (480, 120), "Human", title, PAPER)
    d.line((480, 162, 480, 204), fill=LINE, width=3)
    d.text((498, 178), "intent", font=small, fill=MUTED)

    rounded(d, (264, 204, 696, 312), 28, PEACH)
    center_text(d, (480, 246), "MOMO", font(40), INK)
    center_text(d, (480, 286), "sees the whole · does not control it", sans, PEACH_INK)
    d.line((480, 312, 480, 354), fill=LINE, width=3)

    rounded(d, (282, 354, 678, 444), 24, SAND)
    center_text(d, (480, 388), "KIBI", title, INK)
    center_text(d, (480, 422), "connects · does not supervise", small, PEACH_INK)
    d.line((480, 444, 480, 486), fill=LINE, width=3)
    d.line((180, 528, 780, 528), fill=SOFT, width=3)
    d.line((180, 486, 180, 528), fill=LINE, width=3)
    d.line((480, 486, 480, 528), fill=LINE, width=3)
    d.line((780, 486, 780, 528), fill=LINE, width=3)

    for x, name, role, fill, ink in (
        (180, "KIJI", "sees the world", LEAF, LEAF_INK),
        (480, "INNU", "builds", TAN, TAN_INK),
        (780, "SARU", "acts in the world", SKY, SKY_INK),
    ):
        rounded(d, (x - 126, 528, x + 126, 660), 22, fill)
        center_text(d, (x, 572), name, title, INK)
        center_text(d, (x, 616), role, sans, ink)

    d.line((180, 660, 180, 714), fill=LINE, width=3)
    d.line((780, 660, 780, 714), fill=LINE, width=3)
    d.line((180, 714, 780, 714), fill=LINE, width=3)
    d.line((480, 714, 480, 750), fill=LINE, width=3)
    rounded(d, (252, 750, 708, 846), 26, INK)
    center_text(d, (480, 798), "Human society", title, PAPER)

    center_text(d, (480, 912), "Companions stay themselves.", serif, INK)
    center_text(d, (480, 956), "This is a picture of roles, not a fixed pipeline.", sans, MUTED)
    center_text(d, (480, 1000), "Formal KIBI split is not finished. This is the intended direction.", small, MUTED)
    img.save(ASSETS / "system-map.png", "PNG")


def observe() -> None:
    img = Image.new("RGB", (1080, 420), PAPER)
    d = ImageDraw.Draw(img)
    title, sans = font(34), font(22, False)
    rounded(d, (36, 42, 522, 378), 32, PEACH)
    center_text(d, (279, 96), "MOMO does", font(26), INK)
    center_text(d, (279, 168), "see the whole", title, INK)
    center_text(d, (279, 230), "keep Human purpose visible", sans, PEACH_INK)
    center_text(d, (279, 274), "compress complexity into meaning", sans, PEACH_INK)
    center_text(d, (279, 318), "surface decisions only Human can make", sans, PEACH_INK)

    rounded(d, (558, 42, 1044, 378), 32, (239, 230, 220))
    center_text(d, (801, 96), "MOMO does not", font(26), MUTED)
    center_text(d, (801, 168), "control applications", title, INK)
    center_text(d, (801, 230), "run tasks", sans, MUTED)
    center_text(d, (801, 274), "own execution", sans, MUTED)
    center_text(d, (801, 318), "become a supervisor", sans, MUTED)
    img.save(ASSETS / "observe-not-control.png", "PNG")


def meaning() -> None:
    img = Image.new("RGB", (1080, 390), PAPER)
    d = ImageDraw.Draw(img)
    title, name, sans = font(42), font(28), font(20, False)
    for x, verb, who, role, fill, ink in (
        (180, "See", "KIJI", "the world", LEAF, LEAF_INK),
        (540, "Build", "INNU", "what is needed", TAN, TAN_INK),
        (900, "Act", "SARU", "on people and the world", SKY, SKY_INK),
    ):
        rounded(d, (x - 156, 42, x + 156, 252), 26, fill)
        center_text(d, (x, 108), verb, title, INK)
        center_text(d, (x, 166), who, name, ink)
        center_text(d, (x, 208), role, sans, ink)
    center_text(d, (540, 304), "Different strengths. One purpose.", font(24), INK)
    center_text(d, (540, 344), "Not a factory line. Companions who can join, leave, and remain themselves.", font(18, False), MUTED)
    img.save(ASSETS / "meaning-flow.png", "PNG")


def principle() -> None:
    img = Image.new("RGB", (1080, 630), PAPER)
    d = ImageDraw.Draw(img)
    serif, sans = font(24), font(18, False)
    center_text(d, (540, 48), "Do not copy a screen. Recompose the meaning.", font(26), INK)

    rounded(d, (48, 90, 348, 195), 22, SAND)
    center_text(d, (198, 132), "Human UI", serif, INK)
    center_text(d, (198, 166), "screens · clicks · steps", sans, MUTED)
    d.line((348, 142, 396, 142), fill=LINE, width=3)

    rounded(d, (396, 90, 756, 195), 22, LEAF)
    center_text(d, (576, 132), "Meaning for AI", serif, INK)
    center_text(d, (576, 166), "state · relation · delta", sans, LEAF_INK)
    d.line((756, 142, 804, 142), fill=LINE, width=3)
    d.text((816, 132), "AI reads", font=sans, fill=MUTED)

    rounded(d, (315, 240, 765, 348), 28, PEACH)
    center_text(d, (540, 282), "MOMO", font(36), INK)
    center_text(d, (540, 322), "recomposition in both directions", sans, PEACH_INK)

    d.text((48, 430), "Human sees", font=sans, fill=MUTED)
    d.line((168, 438, 216, 438), fill=LINE, width=3)
    rounded(d, (216, 390, 516, 495), 22, SKY)
    center_text(d, (366, 432), "Human-native view", serif, INK)
    center_text(d, (366, 466), "story · diagram · decision", sans, SKY_INK)
    d.line((516, 442, 564, 442), fill=LINE, width=3)
    rounded(d, (564, 390, 1032, 495), 22, (239, 230, 220))
    center_text(d, (798, 432), "AI complexity", serif, INK)
    center_text(d, (798, 466), "not returned as-is", sans, MUTED)

    center_text(d, (540, 560), "Structure for AI. Meaning for Human.", font(24), INK)
    img.save(ASSETS / "principle-9.png", "PNG")


def evolution() -> None:
    img = Image.new("RGB", (1080, 330), PAPER)
    d = ImageDraw.Draw(img)
    serif, sans = font(20), font(16, False)
    d.line((72, 165, 1008, 165), fill=SOFT, width=4)
    points = [
        (108, "Genesis", "a vessel"),
        (324, "Identity", "MOMO is not Human"),
        (540, "Monitoring", "a boundary for seeing"),
        (756, "Two views", "Human Project / AI repo"),
        (972, "This page", "GitHub as the medium"),
    ]
    for i, (x, top, bottom) in enumerate(points):
        fill = INK if i == len(points) - 1 else PEACH
        d.ellipse((x - 12, 153, x + 12, 177), fill=fill)
        center_text(d, (x, 78), top, serif, INK)
        center_text(d, (x, 228), bottom, sans, MUTED)
    img.save(ASSETS / "evolution.png", "PNG")


if __name__ == "__main__":
    ASSETS.mkdir(exist_ok=True)
    system_map()
    observe()
    meaning()
    principle()
    evolution()
    print("wrote PNG diagrams")

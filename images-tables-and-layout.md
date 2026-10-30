# Images, Tables and Layout

**Outcome: pictures placed and captioned, tables whose columns size and align themselves, and page furniture — breaks, spacing, columns — under your control rather than the compiler's defaults.**

## Images

`image("chart.svg")` places a picture. Typst reads SVG, PNG, JPEG and GIF; the lab's chart is an SVG, which suits line art — it scales to any size with no fuzz, and because an SVG is text, a script can generate it (the lab's `make-chart.py` does exactly that, from five numbers). Size is a parameter, absolute or relative:

```typst
#image("chart.svg", width: 82%)
```

A bare image is decoration; a **figure** is evidence. Wrap the image in `figure` with a caption and the compiler numbers it, lists it, and lets the text refer to it (chapter 5). The rule of thumb: if the text mentions the picture, it wants to be a figure.

## Tables

A table is a function call whose arguments are the cells, in reading order:

```typst
#table(
  columns: (1fr, auto, auto),
  align: (left, right, right),
  [*Plot size*], [*Plots*], [*Rent per year*],
  [Full plot], [26], [£48],
  [Half plot], [15], [£27],
)
```

Three ideas do the work. **Columns** are sized by the `columns` list: `auto` means *as wide as the contents need*, `1fr` means *a share of what's left* — fractions share the remaining space between them, so `(1fr, 2fr)` makes the second column twice the first. **Alignment** is per column, and numbers want `right`, so their digits line up. And **cells are content**, so emphasis, line breaks and even small tables can live inside them.

Two habits keep tables honest. Header cells are just the first row styled bold — Typst will repeat a declared header row across page breaks (`table.header`), which matters the first time a long table splits. And a table built from data, as in chapter 8, should have its totals computed *in the same call*, not typed beneath it.

## Layout

The page-level tools are few and predictable:

- `#pagebreak()` ends the page. The report in chapter 5 uses one before its fourth section, and the contents list proves it worked — that section's page number is 3, not 2.
- `#v(12pt)` and `#h(1em)` insert vertical and horizontal space. Prefer them to blank lines, whose size depends on context.
- `#columns(2)[ ... ]` flows a block into two columns — newsletter-shaped text is the natural use, and a recipe in chapter 12 does it.
- `#align(center)[ ... ]` aligns a block; chapter 5's title uses it.
- `set page` carries the furniture: `numbering` for page numbers, `header` and `footer` for repeating matter, `margin` — either one value or named sides.

A caution the lab's chart teaches: layout is where *silent* differences live. A missing image is an error — the compiler stops. A too-wide image is not: it simply overflows or shrinks, and only looking at the page (or measuring it) tells. That is the deeper reason this guide exports pages as pictures so often — the PNG of a page is a thing you can diff, crop and count, long after the compile's silence has told you nothing.

## The check

Add a sixth row to the rents table with a long plot name, and recompile. Watch the first column widen or the text wrap — fractions and `auto` renegotiate without your help. Then delete the figure's caption and recompile: the cross-reference in the text now fails loudly at compile time (an unresolved reference is an error), which is the compiler protecting the document from citing evidence that is not there.

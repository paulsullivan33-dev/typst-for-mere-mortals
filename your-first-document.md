# Your First Document

**Outcome: a three-page report — title, contents list, numbered headings, a chart with a caption the text refers to, a table, and numbered pages — compiled from one source file and examined with tools that did not make it.**

This chapter builds the lab's centrepiece, `report.typ` (in `typst-lab/`, with its run in transcript t03): the autumn report of the Bramble Lane Allotment Society, an entirely fictional organisation whose forty-one plots exist only here. Small pieces, assembled in the open — every feature in it gets its own explanation in later chapters; the point now is the whole shape.

## The source, in four layers

**The setup.** Three lines at the top govern the whole document:

```typst
#set page(paper: "a4", margin: 2.2cm, numbering: "1 of 1", number-align: center)
#set text(size: 11pt)
#set heading(numbering: "1.")
```

`set` rules say *from here on, things are like this*: A4 paper with page numbers written as "1 of 3" at the bottom centre, an 11-point body font, and headings numbered 1, 2, 3. Chapter 6 is devoted to these rules; for now note only that they are written once and apply everywhere — there is no heading in the document whose number was typed by hand.

**The title and contents.**

```typst
#align(center)[
  #text(size: 20pt, weight: "bold")[Bramble Lane Allotment Society]
  #linebreak()
  #text(size: 14pt)[Autumn Report 2026]
]

#outline(title: "Contents", depth: 2)
```

The `outline` is the contents list. It is generated from the headings when the document compiles, with page numbers — the lab's PDF shows all five sections listed with dotted leaders and their pages (transcript t03). Add a section and the contents update themselves on the next compile. A contents list that can never be stale is the first taste of what compiling buys over typing.

**The writing.** Headings with `=`, emphasis with `*stars*`, lists with `-` and `+`:

```typst
= The season in short

The society's forty-one plots stayed *fully let* all year, and the
waiting list grew to nineteen names.

- 41 plots, all let, 19 people waiting
- 635 seedlings raised in the communal greenhouse
```

**The figure and the table.** The report shows a bar chart — an SVG picture drawn by a small Python script (`make-chart.py` in the lab, listing 635 seedlings across five months) — inside a `figure` with a caption, and the text refers to it by a label:

```typst
Monthly totals are shown in @fig-seedlings.

#figure(
  image("chart.svg", width: 82%),
  caption: [Seedlings raised per month, spring and summer 2026.],
) <fig-seedlings>
```

In the PDF, the reference prints as "Figure 1" and the caption reads "Figure 1: Seedlings raised per month..." — the numbering is the compiler's, so inserting another figure earlier renumbers everything correctly on the next compile. The rents table is a `table` call with three columns and alignment chosen per column; chapter 9 takes tables apart properly.

## Compiling and examining

```bash
typst compile report.typ
```

Silence, and a `report.pdf` appears. Now examine it like a sceptic:

```bash
pdfinfo report.pdf
pdftotext report.pdf - | head -60
```

The lab's results (transcript t03): **3 pages**, A4, produced by "Typst 0.15.1", 40,646 bytes. The extracted text shows the title, the contents with correct page numbers (sections 1–3 on page 1, sections 4–5 on page 3 — a `#pagebreak()` before section 4 is in the source), the chart's figures, the caption with its number, and the table's values (£48, £27, £6) in order. One line in the transcript deserves a note: `pdfinfo` prints a warning, *"Syntax Error: Suspects object is wrong type (boolean)"*. That is the *reader* grumbling about a detail of the PDF's metadata, not the compiler failing — the same tool then reports the pages correctly. The troubleshooting chapter keeps it as a reminder to read which program is complaining.

## What to try

Change the society's name in the title block and recompile: it changes on the page and nowhere else needs editing. Then change one chart value in `make-chart.py`, rerun the script, recompile, and watch the figure change while the text around it stands still — and notice the sentence claiming 635 seedlings is now wrong, because that number was typed into the prose by hand. Chapter 8 fixes exactly that class of mistake, by making the prose read the same data as the picture.

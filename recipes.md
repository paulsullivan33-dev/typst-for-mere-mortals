# Recipes

**Outcome: five small documents you are likely to actually make, each built from pieces this guide has already proved.**

Every recipe below was compiled by the lab (transcripts t03, t04 and t09) or is assembled from parts that were. Where a recipe's full source lives in `typst-lab/`, the recipe says so.

## A letter on a letterhead

The letterhead is a *page header*, so it repeats if the letter ever spills to two pages. From `letter.typ`, verified in transcript t09 — the header prints above the date, which the extracted text confirms:

```typst
#set page(
  paper: "a4",
  margin: (top: 3.4cm, bottom: 2.2cm, x: 2.2cm),
  header: [
    #set text(size: 9pt, fill: rgb("#555555"))
    Bramble Lane Allotment Society · 14 Bramble Lane
    #line(length: 100%)
  ],
  numbering: "1",
  number-align: center,
)
```

The larger top margin makes room for the header so it never crowds the text. The letter itself is plain writing after that: a right-aligned date, the body, and a signature block spaced with `#v(18pt)`. One letterhead file, `#include`d by every letter, is the society-secretary version of a house style.

## A two-column newsletter with a spanning title

Set `columns: 2` on the page, and put the masthead in a placed block that floats across both. The lab's first attempt failed with a message worth remembering — *vertical floating placement must be auto, top, or bottom* — because the position argument carries the float's placement:

```typst
#set page(paper: "a4", margin: 2cm, columns: 2)

#place(top, scope: "parent", float: true)[
  #align(center)[
    #text(size: 18pt, weight: "bold")[The Bramble Lane Gazette]
  ]
]
```

`scope: "parent"` is what lets the block escape its column and span the page. The result is one page, title across the top, articles flowing down and up the columns (transcript t09).

## An invoice or stock report from data

Chapter 8's stock report *is* this recipe; the general shape bears repeating because it is the most valuable one in the book:

1. Keep the facts in a CSV or JSON file.
2. Load, compute the totals, build the table from the same computation.
3. Format money and counts with a function (chapter 7), so presentation has one home.
4. Verify the printed total with an independent tool before the document goes anywhere.

Swap the shed's inventory for hours worked or parts used and the same file is an invoice generator: one compile per customer, each correct by construction.

## The same document, three outfits

Compile chapter 5's report with three different style blocks and nothing else changed — a formal one (Libertinus Serif throughout, numbered headings), a friendly one (Lato headings in colour, chapter 6's rules), a compact one (10pt, narrow margins). Because style is a block at the top, "the same report for the committee and for the notice board" is a two-line difference, and chapter 6 showed how to *prove* an outfit reached the page: export, then count the colour.

## A document that reports on itself

Combine chapter 10's query with a build script: after compiling, extract the contents list and the labelled totals into a text summary that travels with the PDF. The lab's one-liner for the total generalises:

```bash
typst eval 'query(<shed-total>).map(it => it.value)' --in stock-report.typ
```

Any labelled value — a total, a date, a document's own version — can ride in a `#metadata(...)` element and be lifted out the same way. Generated documents stop being opaque the moment they can answer questions.

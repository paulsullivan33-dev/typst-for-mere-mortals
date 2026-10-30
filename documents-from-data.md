# Documents from Data

**Outcome: a stock report whose table, totals and restock list are all read from data files at compile time — and whose headline total is verified by two other programs, independently, to the digit.**

This is the chapter the guide exists for. Everything before it was preparation; this is the trick that makes a compiler better than a typewriter: the document and the data are separate files, and the document is rebuilt from the data whenever the data changes.

## The setup

Beside `stock-report.typ` in the lab sit two files. `inventory.csv` is a parts inventory — ten items of shed stock with category, unit price and quantity:

```csv
item,category,unit_price,quantity
Watering can 10L,Watering,8.50,6
Garden fork,Hand tools,24.99,4
...
```

`inventory.json` carries the facts that frame the report: the society's name, the season, the year's budget (£750), and a restock list. Neither file mentions the other. The document joins them.

## Reading data

Typst's data functions are plain:

```typst
#let rows = csv("inventory.csv")
#let meta = json("inventory.json")
```

`csv` returns an array of rows, each row an array of strings — the first row is the header. `json` returns the file's structure as values: `meta.budget_gbp` is the number 750, `meta.restock` is an array of strings. Two working rules follow from the CSV side. Everything in a CSV is text, so arithmetic needs conversion — `int(r.at(3))` for the quantity, `float(r.at(2))` for the price. And the header row is data like any other until you separate it: the report does `rows.first()` for the header and `rows.slice(1)` for the items.

## Computing over the rows

With the rows as an array, the totals are one line each:

```typst
#let total-items = items.map(r => int(r.at(3))).sum()
#let total-value = items.map(r => float(r.at(2)) * int(r.at(3))).sum()
```

`.map` applies a small function to every row; `.sum()` adds the results. The table itself is built by the same method — each row becomes five cells, with the line value computed by the `money` function from chapter 7 — so the table cannot disagree with the totals: both are the same computation.

## The verification

The compiled report (transcript t04) states: **165 items, replacement value £695.51, against a budget of £750**, with every line value shown to two decimal places. The lab then recomputed both figures without Typst:

```bash
awk -F, 'NR>1 {q+=$4; v+=$3*$4} END {printf "items=%d value=%.2f\n", q, v}' inventory.csv
```

```text
items=165 value=695.51
```

...and again in Python, which printed the identical pair. Three programs, one CSV, one answer. That is the standard to hold any generated document to: the generator computes, but the *check* comes from somewhere else. A total that only the program which printed it has ever seen is a claim, not a fact.

## Asking the document what it computed

The report also embeds its total in a form other tools can retrieve. `#metadata(str(total-value)) <shed-total>` attaches an invisible labelled value to the document, and afterwards:

```bash
typst eval 'query(<shed-total>).map(it => it.value)' --in stock-report.typ
```

prints `["695.51"]` — the number pulled back out of the document by name (transcript t04). Chapter 10 develops this; the point here is that a generated document can be *interrogated*, so a script can verify the total inside the PDF pipeline without scraping text. (Version 0.15.1 also accepts the older `typst query` command for the same job and calls it deprecated — the warning is in the transcript, and chapter 11 treats it as a lesson in reading what the compiler tells you.)

## The standing habit

Data in a file, document generated, totals cross-checked by a second tool. Update the CSV — a delivery arrives, a price changes — recompile, and the report is correct again everywhere, including the sentence in the middle that quotes the total. The one failure mode left is a human editing the *prose* to mention a number the data does not support; chapter 5's closing exercise showed that trap, and the defence is the same: if a number matters, compute it in the document, never type it.

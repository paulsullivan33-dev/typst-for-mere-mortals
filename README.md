# Typst for Mere Mortals

A report, a letter, a price list, an invoice: documents like these are usually made in a word processor, by hand, one at a time. **Typst** makes them a different way. You write a plain text file — part writing, part small program — and a program called the **Typst compiler** turns it into a finished **PDF**, the same way every time you run it. Change a number in a data file, run the compiler again, and the whole document rebuilds itself around the new number, totals included.

This guide explains what Typst is, how a document is put together, and how to write one of your own. Then it does the thing this series always does: it **proves** the results. The lab that wrote this guide compiled a three-page society report and checked the PDF's page count and text with independent tools. It built a stock report entirely from a CSV file and a JSON file, and checked the totals Typst computed against two other programs, to the digit. It changed a document's styling and counted the changed colour in the output, pixel by pixel. And it broke documents on purpose, because Typst's error messages — which point at the exact character and often guess what you meant — are half the reason to use it.

The lab ran the real thing: **Typst 0.15.1**, the official release binary for Linux, downloaded from the project's own releases page with its checksum recorded. Against it the lab compiled reports, tables and charts, styled and restyled a heading, loaded data files, exported pages as pictures, asked the compiler questions about a finished document, and fetched an add-on package — which failed the first way and worked the second, both shown honestly.

What the lab could not do, it did not fake. It has no printer and no eyes, so it never claims a document *looks* good — it claims the document contains what the source says it should, measured from the outside. Judging beauty stays where it belongs: with you, looking at the page.

## The chapters

- [**What Typst is**](what-typst-is.md) — the idea, the moving parts of a document, and where Typst sits among the tools you already know
- [**The moving parts**](the-moving-parts.md) — markup mode and code mode, the compiler, fonts, and the project folder
- [**Installing Typst**](installing-typst.md) — the official binary, verified by checksum, and the other ways in
- [**First checks**](first-checks.md) — the version, the command list, and the fonts your machine actually has
- [**Your first document**](your-first-document.md) — a three-page report compiled to PDF and examined from the outside
- [**Styling with set and show**](styling-with-set-and-show.md) — styles set once and applied everywhere, with the change measured
- [**Functions and reusable pieces**](functions-and-reusable-pieces.md) — naming a computation once and using it ten times
- [**Documents from data**](documents-from-data.md) — a stock report built from CSV and JSON, its totals cross-checked to the digit
- [**Images, tables and layout**](images-tables-and-layout.md) — figures with captions, tables that align themselves, and pages that behave
- [**Longer documents**](longer-documents.md) — contents lists, numbering, cross-references, and asking the document questions
- [**Errors, and how Typst talks to you**](errors-and-how-typst-talks.md) — the diagnostics, read slowly: carets, hints, and cascades
- [**Recipes**](recipes.md) — a letterhead, a two-column newsletter, an invoice from data, and more
- [**The neighbours**](the-neighbours.md) — LaTeX, Markdown and Pandoc, Word and LibreOffice, and the hosted editor
- [**Limits**](limits.md) — what Typst cannot do, stated plainly
- [**Troubleshooting**](troubleshooting.md) — the failures the lab actually met, and what fixed them
- [**Glossary**](glossary.md) — the terms, collected in one place

## What it doesn't cover

Looking at pages. This guide's checks are measurements — page counts, extracted text, pixel counts, totals recomputed by other tools — because those are the checks that catch real breakage. Whether the result is beautiful is a judgement the guide deliberately leaves to the reader with the rendered page in front of them.

It also doesn't cover the hosted web editor at typst.app beyond describing it honestly in the neighbours chapter. Everything here is the local compiler, on your own machine, with no account.

## How to use this guide

Read chapter 1 for the model and chapter 2 before installing anything — most confusion later is one of the two modes being mistaken for the other. Chapters 3 and 4 get you a compiler and prove it works. Chapter 5 makes a real document in the same sitting. Chapter 8 is the one to read slowly if documents-from-data is why you came: its cross-checking habit — never trust a total the same program computed and printed — is worth stealing for any tool. The lab's transcripts and sources live in `typst-lab/`.

---

## Part of the series

This guide is one of the [For Mere Mortals](https://paulsullivan33-dev.github.io/mere-mortals/) guides: plain-language guides to the tools programmers and makers use.

Related guides:

- [Markdown for Mere Mortals](https://paulsullivan33-dev.github.io/markdown-for-mere-mortals/)
- [Pandoc for Mere Mortals](https://paulsullivan33-dev.github.io/pandoc-for-mere-mortals/)
- [MkDocs for Mere Mortals](https://paulsullivan33-dev.github.io/mkdocs-for-mere-mortals/)
- [LibreOffice for Mere Mortals](https://paulsullivan33-dev.github.io/libreoffice-for-mere-mortals/)

## License

The writing in this guide is licensed under [CC BY 4.0](https://github.com/paulsullivan33-dev/typst-for-mere-mortals/blob/main/LICENSE). Code examples and lab scripts are licensed under the [MIT License](https://github.com/paulsullivan33-dev/typst-for-mere-mortals/blob/main/LICENSE-CODE).

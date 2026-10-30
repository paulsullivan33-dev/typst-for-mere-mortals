# First Checks

**Outcome: three commands run and understood — the full command list, the fonts your machine offers, and one tiny compile — so that nothing in the next chapter is taken on faith.**

Do these before your first real document. Each takes seconds, and each answers a question that otherwise turns into a mystery later.

## The command list

```bash
typst --help
```

The lab's output is transcript t01. Read it once, slowly. You are checking two things: that the program answers at all, and the shape of its world — `compile`, `watch`, `init`, `eval`, `fonts`, `update`. The bottom of the help text points at the official tutorial and reference, which are genuinely good and which this guide complements rather than replaces.

## The fonts you actually have

```bash
typst fonts
```

This prints every font family the compiler can find: the two it embeds (Libertinus Serif, New Computer Modern) plus your system's collection. The lab machine listed **262 families** (transcript t02), among them DejaVu Sans and Serif, Liberation Sans and Serif, Lato, URW Bookman, and a very large Noto family covering many scripts.

Why check now: a document can only use fonts from this list. If a style file asks for a font you do not have, Typst does not stop — it quietly substitutes, and the page comes out in a typeface nobody chose. Knowing your list turns that silent surprise into a decision. The list also settles what the styling chapter can honestly use: this guide's styled example uses Lato for headings because the lab verified Lato is present.

A short list is not a broken install. A minimal machine may offer only the embedded pair plus a handful of system fonts. That is a fact about the machine, and chapter 14 counts it among the limits. On your own machine you fix it by installing fonts the ordinary way for your system; the compiler finds them on the next run, no configuration needed.

## One tiny compile

Make a file called `hello.typ`:

```typst
= Hello

My first page, made by a program from a text file.
```

Compile it and look at the result with an independent tool:

```bash
typst compile hello.typ
pdfinfo hello.pdf | grep Pages
```

You should see `Pages: 1`. Two habits start here. First, the compiler says nothing when it succeeds — silence means success, and the file beside the source is the evidence. Second, when you want to know something about the output, ask a tool that did not make it. `pdfinfo` (from the poppler utilities, present on most Linux systems) reads the PDF fresh and reports what it finds. This guide uses that habit throughout: Typst computes, someone else checks.

## The check

You are ready for chapter 5 when `typst --version`, `typst fonts` and the one-page compile all behave as described, and you can name at least one body font and one heading font from your own machine's list. If any of the three failed, the troubleshooting chapter is ordered by exactly these symptoms.

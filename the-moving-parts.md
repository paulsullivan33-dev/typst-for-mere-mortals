# The Moving Parts

**Outcome: you can name the parts of a Typst setup — the source file, the two modes, the compiler and its subcommands, fonts, and the project folder — and predict which part is responsible when something surprises you.**

Almost every confusion in Typst is one of these parts behaving exactly as designed while you expected another part's behaviour. This chapter names them.

## The source file

A Typst document is a plain text file whose name ends in `.typ`. It is the only thing you write. Everything else — the PDF, the pictures — is generated from it and can be generated again, so the source file is the one to keep, back up and put in version control.

## The two modes

Inside the file, you are always in one of two modes:

- **Markup mode** is the default. You are writing: headings, paragraphs, emphasis, lists. Most of the file is this.
- **Code mode** is for computing: variables, functions, arithmetic, reading files. You enter it with `#`, as in `#let x = 3`. Code mode ends on its own — after the expression, you are writing again. A code block in braces, `{ ... }`, stays in code until the closing brace.

The errors chapter (chapter 11) shows what happens when the two are confused: a `#` typed where you were already in code produces Typst's polite hint, *"you are already in code mode — try removing the `#`."* Learn to hear that hint and half of all beginner errors explain themselves.

Inside markup, `[ ... ]` makes a **content block** — a chunk of writing passed to a function as an argument. You will meet it in styling rules and figures:

```typst
#figure(
  image("chart.svg"),
  caption: [Seedlings raised per month.],
)
```

The caption is a content block. Content is a real value in the language, which is why functions can accept whole paragraphs as arguments.

## The compiler

The `typst` program reads the source and emits the document. Its subcommands (the lab lists them in transcript t01) are few:

- `compile` — the one you will use daily. `typst compile report.typ` writes `report.pdf` beside the source.
- `watch` — the same, but it recompiles every time you save. For writing sessions.
- `fonts` — lists every font family the compiler can find on your machine (chapter 4).
- `eval` — runs a scrap of Typst code, optionally inside a document, and prints the result. Chapter 10 uses it to interrogate a finished document.
- `init` — starts a project from a template (templates come from the package registry, so this one needs the network).
- `update` — upgrades the compiler itself.

Output format follows the output filename: `.pdf` for PDF, `.png` for a picture of each page, `.svg` for a vector picture of each page. Pictures of multi-page documents need a page-number pattern in the name — `{p}` — and chapter 10 shows the error you get without it.

## Fonts

Typst does not bring a library of fonts beyond two it embeds: **Libertinus Serif** (the default body font) and **New Computer Modern** (for mathematics). Everything else comes from your system. `typst fonts` prints what it found; on the lab machine that was 262 families, including DejaVu, Liberation, Lato and a large Noto collection (transcript t02).

Two rules follow. A document that names a font your machine does not have falls back silently to something else — the compile succeeds and the page just looks different. And the same source compiled on two machines with different font collections can produce visibly different documents. Chapter 4 shows how to check what you have; chapter 14 lists this under limits, where it belongs.

## The project folder

Files a document uses — images, data files, included chapters — are named relative to the document's own folder, which Typst calls its **root**. A document cannot reach outside its root: `image("../secret.png")` is refused. This is a safety property as much as an organisation one, because it means a `.typ` file someone sends you cannot read your disk while compiling. It can still read *data files inside its own folder* — chapter 8's stock report reads a CSV and a JSON file that sit beside it.

## Packages

Reusable add-ons live in **Typst Universe**, a public registry. A document imports one like this:

```typst
#import "@preview/numbly:0.1.0": numbly
```

The first compile downloads the package into a cache folder on your machine; later compiles use the cache. Chapter 10's lab tried this and the download failed through the lab's network — the identical package file, fetched another way and placed in the cache by hand, then worked. Both halves of that story are in transcript t08, and the troubleshooting chapter tells it properly.

## The check

Name the part responsible in each case: the heading prints in the wrong typeface; a total in the text is wrong; the compiler says a file cannot be found outside the root; a `#` appears in an error message's hint. Fonts; the code that computed the total (or the data it read); the project root rule; and a mode mix-up. If those came easily, the rest of the guide is detail.

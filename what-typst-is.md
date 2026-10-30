# What Typst Is

**Outcome: you can say what Typst is, what goes in, what comes out, and why someone would choose it over the word processor they already have.**

## The one idea

Typst is a **typesetting system**: a program that takes a text file you wrote and sets it into a finished document — pages, headings, page numbers, tables, the lot — as a PDF. The file you write is not the document. It is a *description* of the document, in a language that is half writing and half programming.

That split is the whole idea, and it buys three things:

- **Repeatability.** The same input file always produces the same document. Compile it today, compile it next year, the pages match.
- **Separation.** The words live in one place, the styling in another. Change the style rules at the top and every heading in forty pages changes at once.
- **Computation.** Because the language is a real programming language, a document can *work things out*: read a data file, add up a column, and print the total — computed at compile time, never typed by hand and never stale.

If you have ever written Markdown and wished it could do page numbers, or written HTML and wished it cared about pages at all, or fought a word processor over a heading style that would not stay changed, Typst is aimed at you.

## A taste

Here is a complete Typst document:

```typst
= Meeting notes

The committee met on *Tuesday*. Three things were agreed:

- Order the cold frame
- Fix the main path
- Book the hall for the AGM
```

One `=` makes a heading. Asterisks make text bold. Lines starting with `-` make a list. Nothing else is needed: the compiler supplies a sensible page, margins, font, and spacing of its own. Chapter 5 builds a full report from pieces no more complicated than these.

And here is the same language with its other hat on:

```typst
#let total = (3 + 5 + 8)
The shed holds #total padlocks.
```

The `#` switches from writing to code. `total` is computed, and the sentence prints "The shed holds 16 padlocks." Chapter 2 explains the two modes properly; nearly everything else in the guide is a consequence of them.

## What it is not

- **Not a word processor.** There is no window where you drag text around with a mouse — the official editor exists (chapter 13), but the language and the compiler are the product. If your document is a one-off letter and you think in pages, a word processor is genuinely the better tool, and chapter 14 says so.
- **Not a Markdown converter.** Typst's markup looks a little like Markdown's, deliberately, but it is its own language with its own rules; Pandoc (a neighbour, chapter 13) is the tool that converts between formats.
- **Not finished.** Typst is young software, still adding features between releases — HTML output, for instance, is officially experimental. The version matters, which is why this guide names its own (0.15.1) everywhere.

## Where it came from

Typst is an open-source project, started by two graduates in Berlin who wanted a typesetting system with LaTeX's power and a modern tool's manners. The compiler is a single program written in Rust, free to download, and runs on Linux, macOS and Windows. The same company offers a hosted editor and collaboration service at typst.app, which funds the work; the compiler itself needs no account and no network connection, and everything in this guide is done with the local program.

## The check

You have the model if you can answer these three questions without looking back:

1. What are the input and the output of the Typst compiler?
2. What does the `#` character do?
3. Name one thing a Typst document can do that a typed page in a word processor cannot.

The answers are in this chapter: a `.typ` text file in, a finished PDF (or picture) out; `#` switches from writing into code; and a document can compute — totals, tables and text built from data at compile time.

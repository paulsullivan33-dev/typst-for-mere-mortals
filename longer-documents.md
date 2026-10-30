# Longer Documents

**Outcome: the machinery that keeps a long document consistent — generated contents, numbering that follows a scheme, cross-references that cannot rot, and a way to ask the finished document questions.**

Nothing in this chapter is needed at three pages. All of it is needed at thirty, and the pleasant fact is that you switch it on by setting rules, not by reworking the text.

## Contents, generated

`#outline()` prints the contents list from the headings, with page numbers, at the point where it appears. Its parameters tune it: `title` names it, `depth` limits how many heading levels appear, `indent` controls the nesting look. The lab's report (chapter 5) shows the result: five sections, dotted leaders, correct pages — and, because it is regenerated at every compile, it is incapable of the classic word-processor lie, a contents page describing a document that has since moved.

Figures and tables get their own lists the same way: `#outline(title: [List of Figures], target: figure.where(kind: image))`. A thesis-shaped document wants both; a report wants neither. The mechanism is identical.

## Numbering schemes

Heading numbering is a *pattern*, not a fixed style. `"1."` gives 1, 2, 3. `"1.1"` gives section-and-subsection numbers. `"A."`, `"I."` and others are built in — and the pattern language has limits, which is precisely what the lab's package experiment ran into and solved: letters for level one *combined with* bracketed numbers for level two is beyond a single pattern string.

Figure numbering follows the same idea and resets per chapter with a pattern like `"1.1"` when headings are numbered — the kind of consistency a human editor maintains with a checklist and Typst maintains by construction.

## Cross-references that cannot rot

A label — `<fig-seedlings>` — names a thing. `@fig-seedlings` in the text refers to it, printing "Figure 1" (or the supplement you set). The contract is enforced both ways: a reference to a label that does not exist is a compile error, and chapter 9's closing check removes a caption to watch the protection fire. Compare the word-processor way — "see Figure 3" typed by hand, wrong since March — and the value of the enforcement is plain. Page references work too: `@fig-seedlings` can be asked for its page with a `ref` supplement form, and the answer is always the page the figure actually landed on.

## Counters and state

Page numbers are a **counter** the compiler maintains; headings and figures have their own. You can define counters too — the report's `"1 of 1"` page numbering is a counter displayed alongside its total. The honest warning: counters are the first place where Typst's "the document is a program" nature bites, because their values depend on *where in the document* they are read. The compiler handles the convergence — it lays the document out repeatedly until numbers settle — but a counter read in the wrong place can still surprise. Use the built-ins freely; define your own only when a built-in is genuinely missing.

## Asking the document questions

Compiling is not the only conversation. `typst eval` evaluates code *in a document's context*, and the `query` function inside it finds elements by selector — every heading, every figure, every labelled thing. Chapter 8 used it to extract the stock report's computed total by label:

```text
["695.51"]
```

The general shape is `query(selector)` returning an array, with `.map(it => ...)` to shape the answer. Scripts use this to audit documents: list all figures lacking captions, extract every level-one heading as a checklist, pull metadata values into a build report. One wrinkle the lab met and chapter 11 reads closely: the older standalone `typst query` command still works in 0.15.1 but prints a deprecation warning pointing at `eval` — the tool telling you, in its own output, that the ground is moving.

## Splitting a long document

Past a certain size, one file stops being a kindness. `#include "chapter3.typ"` splices another file's content at that point, sharing the document's rules and counters. The usual shape is a thin `main.typ` that sets the style and includes a file per chapter. Everything in this chapter — contents, numbering, references — works across the split unchanged, because as far as the compiler is concerned there is still one document.

# Styling with Set and Show

**Outcome: headings restyled — different font, larger, coloured, underlined — by four lines at the top of the file and no changes to the text; and the change proved by measuring the output, not by admiring it.**

A word processor styles by selecting: you highlight each heading and apply the look, eighteen times for eighteen headings. Typst styles by *rule*: you state what headings are like, once, and every heading obeys. Two rule kinds cover most of styling.

## Set rules: setting the defaults

A `set` rule changes the parameters of something from that point on:

```typst
#set text(size: 11pt)
#set page(paper: "a4", margin: 2.2cm, numbering: "1 of 1")
#set heading(numbering: "1.")
```

You met these in chapter 5. Parameters are named, so the rules read as sentences about the document. A `set` rule can also be scoped: written inside a block or a function, it applies only there.

## Show rules: replacing the thing itself

A `show` rule goes further — it takes each occurrence of something and *rebuilds* it. The form to learn first picks out one kind of element and restyles it:

```typst
#show heading: set text(font: "Lato", size: 20pt, fill: rgb("#1a5c2e"))
```

Read it as: *whenever a heading appears, set its text like this* — Lato (verified present in chapter 4), 20 points, a dark green whose colour code is `1a5c2e`. The fuller form hands the element to a function, so you can wrap it:

```typst
#show heading: it => block(below: 14pt)[#underline(it)]
```

`it` is the heading itself, caught and put back — underlined, with space beneath. Rules compose: a document can carry both, and both apply.

## The lab's measurement

The lab compiled the same one-page document twice (transcript t05): once plain (`style-demo.typ`) and once with the two rules above added (`style-demo-styled.typ`). Same words, same page size. Then it measured, twice, two independent ways:

- **In the SVG output** — the vector version of the page is text under the hood, so the colour can be counted: the string `1a5c2e` appears **0 times** in the plain page and **17 times** in the styled one.
- **In the PNG output** — the page rendered as a picture at 100 pixels per inch, 827 × 1169 pixels. Counting pixels of exactly the heading green (26, 92, 46): **0** in the plain render, **655** in the styled one.

Zero and not-zero, by two unrelated methods. That is what "the styling took effect" means when you cannot simply look — and the same habit works when you *can* look but want to be sure a change reached every heading, not just the one on screen: restyle, recompile, and let a count argue with you.

## Where rules live

Because rules are just statements in the file, a set of them can be kept together at the top — the document's *style block* — or moved into a separate file and pulled in with `#include "style.typ"`, so five documents share one look. House styles in this series' other guides are files; here the style is part of the program, and the include mechanism is the sharing mechanism. Chapter 7 picks this up.

## The check

Take any document from chapter 5 and add `#show heading: set text(fill: rgb("#8b0000"))`. Recompile, export page 1 as SVG, and grep it for `8b0000`. If the count is above zero and was zero before, you hold the whole idea: rules describe, the compiler applies, and the output can be made to confess.

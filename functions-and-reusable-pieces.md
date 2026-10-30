# Functions and Reusable Pieces

**Outcome: a computation defined once and used in several places — including one honest wart the lab met (numbers that print as £107.5 instead of £107.50) and the small function that fixes it everywhere at a stroke.**

## let: naming a value

`#let` binds a name to a value:

```typst
#let plots = 41
#let rent = 48
The year's rent roll is £#(plots * rent).
```

Names can hold numbers, text, arrays `(1, 2, 3)`, dictionaries, content, and — the step that matters — *functions*.

## Functions: naming a computation

A function is a value that does work when called:

```typst
#let line-value(price, qty) = price * qty
```

Arguments can have defaults, and the body can be a block of several statements in braces. The stock report in the next chapter leans on one function worth studying, because it was written to fix a real blemish the lab measured.

## The wart, and the fix

Typst prints numbers the short way: ask it for a rounded product and `107.50` comes out as `107.5`, `51.00` as `51`. In a table of money that looks like carelessness — the lab's first stock report showed £51, £107.5, £58.5 in its value column (the first version of transcript t04's document, before the fix). The numbers were right; the *presentation* was wrong.

The fix is a function that formats money properly — pounds, a point, and always two pence digits:

```typst
#let money(v) = {
  let r = calc.round(v, digits: 2)
  let pounds = calc.floor(r)
  let pence = calc.round((r - pounds) * 100)
  "£" + str(pounds) + "." + if pence < 10 { "0" } + str(pence)
}
```

Call `money(107.5)` anywhere — a table cell, a sentence — and £107.50 comes out. One definition, and every figure in the document is formatted by the same rule: change your mind about the format and you change it in one place. The rerun in transcript t04 shows the column after the fix: £51.00, £99.96, £107.50, all the way down. Notice the shape of the lesson: the bug was not in the arithmetic, so it was not fixed in the arithmetic. It was fixed at the boundary where numbers become text.

## Reuse across documents

Two mechanisms carry pieces between files:

- **`#include "file.typ"`** pastes another file's content — and its definitions — into this one. A shared style block or a society's standard letterhead travels this way.
- **`#import "file.typ": name1, name2`** takes only the named definitions, leaving the other file's document body out. This is how packages (chapter 2) are consumed, and the tidier habit for a personal library of functions.

A word on scope: definitions made inside braces or inside a content block stay inside it. That is a feature — a recipe can set up its own helpers without leaking names into the rest of the document — and the cause of the classic beginner error whose message chapter 11 reads in full: *unknown variable*, when the name was defined somewhere the compiler can no longer see.

## Built-in functions you will actually use

The standard library is large; these earn their keep early: `str` and `int` and `float` (conversions), `calc.round`, `calc.floor`, `calc.sum`, array methods like `.map`, `.filter`, `.sum()`, `.at()` for picking elements, and string methods like `.split` and `.replace`. Chapter 8's data work is mostly these, arranged in a row.

## The check

In the stock report, change the `money` function to put the £ sign *after* the amount is impossible-looking — or better, make it round to whole pounds by changing one line — recompile, and confirm every figure in the PDF obeys your new rule while the totals still match the cross-check. One edit, document-wide effect, arithmetic untouched: that is the chapter in one exercise.

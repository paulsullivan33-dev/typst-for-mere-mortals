# Errors, and How Typst Talks to You

**Outcome: you can read a Typst error the way it was written — location, excerpt, caret, hint — and you have met the three shapes errors take: the single helpful one, the cascade, and the warning that is not an error at all.**

Typst's diagnostics are its best feature after the language itself. They are also a skill: the lab broke two documents on purpose (transcript t06) and a command besides, and this chapter reads all three slowly.

## The anatomy of an error

The unknown-variable error, in full:

```text
error: unknown variable: total-value
  ┌─ err-var.typ:3:16
  │
3 │ The shed holds #total-value items in all.
  │                 ^^^^^^^^^^^
  │
  = hint: if you meant to use subtraction, try adding spaces around the minus sign: `total - value`
```

Every part earns its place. **The headline** names the problem precisely — not "syntax error" but *unknown variable*, with the name. **The location** gives file, line and column. **The excerpt** shows your own line with carets under the exact characters at fault: eleven carets, the length of `total-value`, starting right after the `#`. **The hint** guesses at the likeliest human intention — a hyphen in code can be a minus sign, so Typst wonders if you meant subtraction and tells you how that would look.

And the exit code is 1, with no PDF produced. Silence means success; an error means noise *and* no document. Programs driving Typst in a pipeline should check the exit code, because the compiler will never hand you a half-right PDF and call it done.

## The cascade

The second broken file left a parenthesis open:

```typst
#let items = (3, 5, 8
The total is #items.sum().
```

The compiler reported **six** errors: *unclosed delimiter* at the exact column of the `(`, then *expected comma* three times, then *the character `#` is not valid in code* — with the hint *"you are already in code mode; try removing the `#`"* — then *expected identifier* at the end of the line. Read cascades from the top. The first error is the injury; the rest are the compiler, still inside the unclosed parenthesis, interpreting your next sentence as code and finding it wanting. Fix the first, recompile, and cascades usually collapse to nothing. Fixing them bottom-up is chasing smoke.

The mode hint deserves its fame. The compiler understood something subtle — that `#items` in the second line was *meant* as markup-mode code entry, but the unclosed delimiter had kept it in code mode all along — and said so in plain words. When a hint names the mode confusion, believe it: half of all Typst errors are the two modes being mistaken for each other (chapter 2).

## The warning that is not an error

From transcript t04, a successful compile with extra output:

```text
warning: the `typst query` subcommand is deprecated
 = hint: use `typst eval 'query(<shed-total>).map(it => it.value)' --in stock-report.typ` instead
```

The document compiled; the command worked; the warning is a *forward-looking* message — this spelling will stop working in a future version, here is its replacement, spelled out in full. Treat warnings as the project's changelog arriving early. A build that prints warnings is a build asking to be tidied while tidying is cheap.

## The fourth shape: the honest refusal

The exports run (transcript t07) met a fourth kind of message, when a three-page document was asked for one SVG file:

```text
error: cannot export multiple images without a page number template ({p}, {0p}) in the output path
```

Not a mistake in the document at all — a request that cannot mean what it says (three pages, one filename), refused with the remedy inside the message. Much of Typst's talking is like this: the boundary between "your document is wrong" and "your request is ambiguous" is kept clear, and both are answered with what to type instead.

## The working habit

Read the first error fully — headline, excerpt, hint — before touching anything. Say, in words, what the compiler believes is wrong and where. If the belief is right, fix exactly that. If there are many errors, expect a cascade and find its head. And when there are no errors, remember the asymmetry this guide keeps repeating: a clean compile proves the document is *well-formed*, not that it is *right* — the totals still need their cross-check (chapter 8), the styles their measurement (chapter 6).

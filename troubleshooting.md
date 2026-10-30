# Troubleshooting

**Outcome: the failures the lab actually met, in the order you are likely to meet them — each with the message as printed, what it means, and the fix that worked.**

## "command not found" after installing

The shell cannot find `typst`, which means the program is not in a folder on your `PATH`, or the shell has not noticed it yet. Run it once by its full path — `~/typst-x86_64-unknown-linux-musl/typst --version` — to separate *the program is broken* (it almost never is) from *the shell cannot see it*. Then copy the program into a folder that is on the path (`~/.local/bin` is the usual one) or add its folder to the `PATH` in your shell's startup file. Chapter 3, step 4.

## The heading prints in the wrong font — or the font silently changes

Your style names a font the machine does not have. Typst does not stop for this; it substitutes and says nothing. Run `typst fonts` and check the exact family name — names must match as printed there ("Lato", not "lato"). Chapter 4 exists to catch this before it mystifies you.

## "unknown variable" for a name you defined

Two causes, both common. The name was defined inside braces or a block, where it stays (chapter 7's scope rule) — move the `#let` to the top level of the file. Or the name has a hyphen and the compiler wondered if you meant subtraction: its hint says so outright, and it is right often enough to check first. Chapter 11 reads this error in full.

## A screenful of errors from one small mistake

A cascade, almost always headed by *unclosed delimiter*. An open bracket, parenthesis or quote makes the compiler read the rest of the file in the wrong mode, and every later line errors in sympathy. Fix the **first** error only, recompile, and count again. Chapter 11 walks a six-error cascade whose single cause was one missing `)`.

## "cannot export multiple images without a page number template"

You asked for several pages in one picture filename. Give the output name a page pattern: `typst compile report.typ "report-{p}.png"`. The same applies to SVG. The error is the compiler refusing to guess, and it names its own remedy — transcript t07.

## "failed to download package ... Connection Failed"

The first compile that uses a package downloads it, and that download can fail on restricted or proxied networks — the lab's did, with a TLS error through its proxy (transcript t08). Three honest options, in order: retry on a network without the restriction; fetch the package file yourself from `https://packages.typst.org/preview/<name>-<version>.tar.gz` (check its checksum if one is published), unpack it into the package cache at `~/.local/share/typst/packages/preview/<name>/<version>/`, and compile again — the compiler uses the cache without asking the network; or do without the package, since many are conveniences rather than necessities.

## pdfinfo grumbles about the PDF Typst made

The lab saw *"Syntax Error: Suspects object is wrong type (boolean)"* from `pdfinfo` on a perfectly good three-page PDF. That message is the *reader's* complaint about a metadata detail, and the same tool reported the pages correctly immediately after. Read which program is speaking before treating a warning as a failure — and confirm with a second reader (`pdftotext` extracted the text cleanly) when it matters.

## The contents list or page numbers look stale

They cannot be — the outline is generated at compile time. What you are seeing is an old PDF: a compile that failed (so no new file was written) or a viewer showing the previous version. Check the compile's exit and the file's timestamp before doubting the outline.

## Numbers print as 107.5 where money is meant

Presentation, not arithmetic. Typst prints numbers in their shortest form. Format at the boundary with a small function — chapter 7's `money` is the pattern — rather than rounding harder, which changes values instead of their clothes.

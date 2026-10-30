# Limits

**Outcome: the honest edges — what Typst cannot do, what it does not promise, and where this guide's own evidence runs out.**

## What the tool cannot do, or does not promise

- **It cannot make a bad document good.** Typst guarantees consistency, not quality. A muddled report compiles into a beautifully consistent muddled report; the measurements in this guide prove presence and arithmetic, never judgement.
- **HTML export is experimental.** In version 0.15.1 the project itself labels the HTML output experimental. This guide did not build on it and neither should a document you depend on — yet.
- **Fonts are the machine's, not the document's.** Beyond the two embedded families, a document renders in whatever fonts the compiling machine offers, and falls back silently when a named font is missing. The same source on two machines can produce visibly different pages. Nothing in the file travels with the fonts.
- **Some territory still belongs to LaTeX.** Decades of publisher classes, journal templates and specialist packages have no Typst counterpart today. Where an institution's template is the requirement, the requirement wins.
- **Precise manual control has a learning curve.** The layout engine is excellent at flowing documents and can be argued with — floats, placement and page breaks interacting — but the arguing uses concepts (placement scopes, clearance, counters that settle over multiple passes) that take longer to learn than the markup did.
- **It is young software.** Commands deprecate between versions — this guide's own lab met one in 0.15.1 (chapter 11). A document archive should record the compiler version it was built with; chapter 3 says how.
- **The compiler is not a sandbox for hostile input.** A `.typ` file is a program: it can read files inside its project root and compute freely. It cannot reach outside the root, which is a real boundary — but do not compile documents from strangers the way you would not run scripts from strangers.

## Where this guide's evidence runs out

- **Nobody looked at the pages.** The lab measured — page counts, extracted text, pixel counts, checksums, totals recomputed by other programs. It never saw a rendered page, and its claims are all of the measurable kind. Whether the society report is *attractive* is asserted nowhere here.
- **One machine, one version.** Everything ran on Typst 0.15.1, one Linux build, in a shared sandbox. Windows and Mac installs, other versions' behaviour, and long-document performance at book scale are described from documentation, not measured.
- **The package registry was reached by a side door.** Typst's own package download failed through the lab's network; the proof in chapter 10 uses the identical package file fetched with curl and placed in the cache by hand. On an ordinary network the one-line import simply works — but this guide's transcript shows the failure and the workaround, not the ordinary path.
- **Print is untested.** PDFs were produced and read back by software. No page in this guide was printed, colour-checked on paper, or sent to a print shop; PDF/X and press workflows are outside its evidence entirely.

# The Neighbours

**Outcome: you can place Typst among the tools around it — what each neighbour does that Typst doesn't, and the honest rule for choosing.**

These are characterised from their own documentation and this series' guides to them, not benchmarked here; where a neighbour has a guide in this series, it is named.

## LaTeX — the ancestor

LaTeX has typeset the world's mathematics and most of its journal articles for forty years. It is more powerful than Typst in the corners — publishers' house styles exist as LaTeX classes, some packages have no Typst equivalent yet, and if a journal says "submit in LaTeX" that settles it. Typst's case against it is the *experience*: errors that name the exact character and guess your intent, compiles that finish instantly, and a language a beginner can read. Many people keep both: LaTeX where the institution demands it, Typst where they choose.

## Markdown and Pandoc — the converter's world

Markdown (this series has a guide) is writing with almost no machinery: superb for notes and web pages, silent on page numbers, running heads and precise layout. Pandoc (also guided) converts between formats — Markdown in, HTML or DOCX or PDF out. Typst is not a converter and does not compete with Pandoc's breadth; it competes with the *last step*, the PDF engine, and with the word processor. It is a fair workflow to draft in Markdown and finish in Typst, pasting the prose into a styled shell.

## Word and LibreOffice — the page in front of you

A word processor shows you the page and lets your hands work on it directly; for a one-off letter written by its recipient's eye, that is the right tool. LibreOffice (guided in this series) also converts documents from the command line, which makes it Typst's neighbour in a pipeline rather than a rival. Typst wins when the document is *repeated* — monthly reports, invoices, letters on a letterhead — or *computed*, or written by someone who thinks in text files and version control. The honest summary: word processors are for documents you make once; Typst is for documents you make again.

## The hosted editor — typst.app

The project's own web application is a real alternative front end: the same language, collaborative editing, a live preview, and template and package browsing, in a browser. It is the friendliest way to *start*. The differences are the usual hosted ones: your documents live on someone else's computer, the compiler version is theirs to choose, and automation — the compile-in-a-pipeline work this guide leans on — belongs to the local program. Nothing stops a document moving between the two; the source is the same file.

## HTML and the web tools

MkDocs and Hugo (both guided in this series) make *websites* from text files; Typst makes *pages*. If the reader will click, choose the web tools; if the reader will print, file or sign, choose Typst. Typst's own HTML export exists but is officially experimental in the version this guide used — chapter 14 files it under limits, and the guide does not build on it.

## The rule for choosing

Ask two questions. *Will this document be made again, or made from data?* If yes, Typst. *Must it satisfy an institution's template or a collaborator who works by eye?* If yes, the neighbour they name. Everything else is taste, and taste is allowed.

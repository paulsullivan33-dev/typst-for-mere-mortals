# Glossary

**Alignment** — Where a block sits on the page (`center`, `right`, and friends), set with `align` or as a `place` position.

**Caption** — The text a `figure` prints beneath (or above) its image or table, together with its generated number: "Figure 1: ...".

**Code mode** — The mode you are in while Typst is computing: variables, functions, arithmetic. Entered with `#` from markup mode, or inside braces.

**Compiler** — The `typst` program, which reads `.typ` source and emits PDF, PNG or SVG.

**Content** — Writing as a value in the language: text, headings, whole blocks in `[ ... ]` can be stored, passed to functions and placed. Markup produces content; code manipulates it.

**Counter** — A number the compiler maintains across the document — page, heading, figure — displayed where asked and settled over repeated layout passes.

**Cross-reference** — `@label` in the text, printing the kind and number of the labelled thing ("Figure 1"). A reference to a missing label is a compile error.

**Data functions** — The built-ins that load files at compile time: `csv`, `json`, and also `xml`, `toml`, `yaml` and raw `read`.

**Figure** — A wrapped image or table with a caption, a number, and optionally a label for references.

**Label** — A name in angle brackets, `<like-this>`, attached to an element so the text can refer to it and tools can query it.

**Markup mode** — The default mode: you are writing prose, headings and lists.

**Metadata** — An invisible value embedded in a document with `#metadata(...)`, retrievable afterwards by `typst eval` and `query`.

**Outline** — The generated contents list (or list of figures), built from the document's headings at compile time.

**Package** — A reusable add-on from the Typst Universe registry, imported as `@preview/name:version` and cached on your machine after first use.

**Project root** — The folder a document lives in; files it reads must be inside it.

**Query** — Asking a compiled document for its elements by kind or label, via `typst eval 'query(...)' --in doc.typ`.

**Set rule** — `#set thing(parameters)`: changes how a kind of element behaves from that point on.

**Show rule** — `#show thing: ...`: replaces how a kind of element is built, either by setting its style or by passing it through a function.

**Supplement** — The word a reference prints before the number — "Figure", "Table", "Section" — settable per kind.

**Typesetting** — Arranging text and figures into finished pages: the whole craft this tool automates.

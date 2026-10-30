#import "@preview/numbly:0.1.0": numbly

#set heading(numbering: numbly("{1:A}.", "{2:1})"))

= First main section

== A subsection under it

= Second main section

The headings above are numbered by the numbly package: letters for
level one, a number in brackets for level two — a format Typst's
built-in numbering strings cannot express on their own.

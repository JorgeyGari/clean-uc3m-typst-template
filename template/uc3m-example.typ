#import "../lib.typ": *
#import "glossary.typ": glossary-entries

#show: clean-dhbw.with(
  title: "Development of a Symbolic Calculator from Scratch",
  authors: (
    (name: "Jorge Lázaro Ruiz"),
  ),
  type-of-thesis: "Bachelor's Thesis",
  at-university: true, // UC3M is university-based
  bibliography: bibliography("sources.bib"),
  date: datetime(year: 2024, month: 6, day: 16),
  date-format: "[month repr:long] [day], [year]", // English format: "June 16, 2024"
  glossary: glossary-entries,
  language: "en", // en, de, es
  supervisor: (university: "Carlos Linares López"), // Using supervisor format instead of tutors for now
  university: "Universidad Carlos III de Madrid",
  university-location: "Leganés",
  university-short: "UC3M",
  // UC3M specific fields
  degree: "Bachelor's Degree in Applied Mathematics and Computing",
  course: "2023-2024",
  tutors: ("Carlos Linares López",),
  location: "Leganés, Madrid, Spain",
)

// Edit this content to your liking

= Introduction

#lorem(100)

#lorem(80)

#lorem(120)

= Background

In this section, some useful elements and functions for creating Typst documents with this template are explained.

== Expressions and Abbreviations

Use the `gls` function to insert expressions from the glossary that are then linked to it. An example of this is:

In this chapter, a #gls("API") is described. We also speak in this context of a software interface. The interface uses technologies such as #gls("HTTP").

The template uses the `glossarium` package for such glossary references. The corresponding #link("https://typst.app/universe/package/glossarium/", "documentation") shows other variants for such cross-references. There is also detailed information on how the glossary can be structured.

== Lists

- First item
- Second item
  - Nested item
  - Another nested item
- Third item

== Code Examples

```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
```

== Math Examples

The quadratic formula is:

$ x = (-b ± sqrt(b^2 - 4 a c)) / (2 a) $

== Figures

#figure(
  rect(width: 5cm, height: 3cm, fill: blue.lighten(80%)),
  caption: "Example figure"
)

= Conclusions

#lorem(150)

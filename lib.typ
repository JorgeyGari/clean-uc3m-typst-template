#import "@preview/codelst:2.0.2": *
#import "@preview/hydra:0.6.1": hydra
#import "@preview/glossarium:0.5.6": make-glossary, register-glossary, print-glossary, gls, glspl
#import "locale.typ": TABLE_OF_CONTENTS, APPENDIX, REFERENCES
#import "titlepage.typ": *
#import "confidentiality-statement.typ": *
#import "declaration-of-authorship.typ": *
#import "check-attributes.typ": *

// Workaround for the lack of an `std` scope.
#let std-bibliography = bibliography

#let clean-uc3m(
  // Core fields (used by both DHBW and UC3M)
  title: none,
  authors: (:),
  language: none,
  type-of-thesis: none,
  date: none,
  date-format: "[day].[month].[year]",
  bibliography: none,
  glossary: none,
  bib-style: "ieee",
  math-numbering: "(1)",
  logo-left: image("uc3m_logo.svg"),
  
  // Content control
  show-table-of-contents: true,
  show-abstract: true,
  abstract: none,
  appendix: none,
  
  // DHBW specific fields (not used in UC3M format)
  at-university: true,                    // DHBW: set to true for UC3M (default: true)
  confidentiality-marker: (display: false), // DHBW: not used in UC3M
  show-confidentiality-statement: true,   // DHBW: not used in UC3M
  show-declaration-of-authorship: true,   // DHBW: optional for UC3M
  confidentiality-statement-content: none, // DHBW: not used in UC3M
  declaration-of-authorship-content: none,
  titlepage-content: none,
  university: none,                       // DHBW: not displayed in UC3M (implied by logo)
  university-location: none,              // DHBW: not displayed in UC3M (use location instead)
  university-short: none,                 // DHBW: not used in UC3M
  city: none,                            // DHBW: not used in UC3M (use location instead)
  supervisor: (:),                       // DHBW: not used in UC3M (use tutors instead)
  logo-right: none,                      // DHBW: not used in UC3M (single logo only)
  ignored-link-label-keys-for-highlighting: (),
  
  // UC3M specific fields (primary for UC3M format)
  degree: none,          // UC3M: Full degree name
  course: none,          // UC3M: Academic year
  tutors: (),           // UC3M: Array of tutor names  
  location: none,       // UC3M: City and location (replaces city/university-location)
  body,
) = {
  // check required attributes
  check-attributes(
    title,
    authors,
    language,
    at-university,
    confidentiality-marker,
    type-of-thesis,
    show-confidentiality-statement,
    show-declaration-of-authorship,
    show-table-of-contents,
    show-abstract,
    abstract,
    appendix,
    university,
    university-location,
    supervisor,
    date,
    city,
    bibliography,
    glossary,
    bib-style,
    logo-left,
    logo-right,
    university-short,
    math-numbering,
    ignored-link-label-keys-for-highlighting,
  )

  // ---------- Fonts & Related Measures ---------------------------------------

  let body-font = "Source Serif 4"
  let body-size = 11pt
  let heading-font = "Source Sans 3"
  let h1-size = 40pt
  let h2-size = 16pt
  let h3-size = 11pt
  let h4-size = 11pt
  let page-grid = 16pt  // vertical spacing on all pages
  
  // UC3M blue color (official UC3M color)
  let azul-uc3m = rgb("#000e78")

  
  // ---------- Basic Document Settings ---------------------------------------

  set document(title: title, author: authors.map(author => author.name))
  let many-authors = authors.len() > 3
  let in-frontmatter = state("in-frontmatter", true)    // to control page number format in frontmatter
  let in-body = state("in-body", true)                  // to control heading formatting in/outside of body

  // customize look of figure
  set figure.caption(separator: [ --- ], position: bottom)

  // math numbering
  set math.equation(numbering: math-numbering)

  // initialize `glossarium`
  // CAVEAT: all `figure` show rules must come before this (see `glossarium` docs)
  show: make-glossary

  // register the glossary passed in `glossary`
  if (glossary != none) {
    register-glossary(glossary)
  }

  // show links in dark blue
  show link: set text(fill: blue.darken(40%))

  // ========== TITLEPAGE ========================================

  if (titlepage-content != none) {
    titlepage-content
  } else {
    titlepage(
      authors,
      date,
      heading-font,
      language,
      logo-left,
      logo-right,
      many-authors,
      supervisor,
      title,
      type-of-thesis,
      university,
      university-location,
      at-university,
      date-format,
      show-confidentiality-statement,
      confidentiality-marker,
      university-short,
      page-grid,
      // UC3M specific parameters
      degree: degree,
      course: course,
      tutors: tutors,
      location: location,
      azul-uc3m: azul-uc3m,
    )
  }
  counter(page).update(1)  

  // ---------- Page Setup ---------------------------------------

  // adapt body text layout to basic measures
  set text(
    font: body-font, 
    lang: language, 
    size: body-size - 0.5pt,      // 0.5pt adjustment because of large x-hight
    top-edge: 0.75 * body-size, 
    bottom-edge: -0.25 * body-size,
  )
  set par(
    spacing: page-grid,
    leading: page-grid - body-size, 
    justify: true,
    first-line-indent: 1.5em,  // First-line indent for paragraphs
  )

  set page(
    margin: (top: 4cm, bottom: 3cm, left: 4cm, right: 3cm),
    header:
      grid(
        columns: (1fr, 1fr),
        align: (left, right),
        row-gutter: 0.5em,
        smallcaps(text(font: heading-font, size: body-size, fill: azul-uc3m,
          context {
            hydra(1, display: (_, it) => it.body, use-last: true, skip-starting: false)
          },
        )),
        text(font: heading-font, size: body-size, fill: azul-uc3m,
          number-type: "lining",
          context {if in-frontmatter.get() {
              counter(page).display("i")      // roman page numbers for the frontmatter
            } else {
              counter(page).display("1")      // arabic page numbers for the rest of the document
            }
          }
        ),
        grid.cell(colspan: 2, line(length: 100%, stroke: (paint: azul-uc3m, thickness: 0.5pt))),
      ),
      header-ascent: page-grid,
  )


  // ========== FRONTMATTER ========================================
  
  // ---------- Heading Format (Part I) ---------------------------------------

  show heading: set text(weight: "bold", fill: azul-uc3m, font: heading-font)
  show heading.where(level: 1): it => {v(2 * page-grid) + text(size: 2 * page-grid, fill: azul-uc3m, weight: "bold", it)}

  // ---------- Abstract ---------------------------------------

  if (show-abstract and abstract != none) {
    heading(level: 1, numbering: none, outlined: false, ABSTRACT.at(language))
    text(abstract)
    pagebreak()
  }

  // ---------- ToC (Outline) ---------------------------------------

  // top-level TOC entries in bold without filling
  show outline.entry.where(level: 1): it => {
    set block(above: page-grid)
    set text(font: heading-font, weight: "semibold", size: body-size, fill: azul-uc3m)
    link(
      it.element.location(),    // make entry linkable
      it.indented(it.prefix(), it.body() + box(width: 1fr,) +  it.page())
    )
  }

  // other TOC entries in regular with adapted filling
  show outline.entry.where(level: 2).or(outline.entry.where(level: 3)): it => {
    set block(above: page-grid - body-size)
    set text(font: heading-font, size: body-size, fill: azul-uc3m)
    link(
      it.element.location(),  // make entry linkable
      it.indented(
          it.prefix(),
          it.body() + "  " +
            box(width: 1fr, repeat([.], gap: 2pt), baseline: 30%) +
            "  " + it.page()
      )
    )
  }

  if (show-table-of-contents) {
    outline(
      title: TABLE_OF_CONTENTS.at(language),
      indent: auto,
      depth: 3,
    )
  }

  in-frontmatter.update(false)  // end of frontmatter
  counter(page).update(0)       // so the first chapter starts at page 1 (now in arabic numbers)

  // ========== DOCUMENT BODY ========================================

  // ---------- Heading Format (Part II: H1-H4) ---------------------------------------

  set heading(numbering: "1.1.1")

  show heading: it => {
    set par(leading: 4pt, justify: false)
    text(it, top-edge: 0.75em, bottom-edge: -0.25em, fill: azul-uc3m)
    v(page-grid, weak: true)
  }

  show heading.where(level: 1): it => {
    set par(leading: 0pt, justify: false)
    pagebreak()
    context{ 
      if in-body.get() {
        v(page-grid * 10)
        place(              // place heading number prominently at the upper right corner
          top + right,
          dx: 9pt,          // slight adjustment for optimal alignment with right margin
          text(counter(heading).display(), 
            top-edge: "bounds",
            size: page-grid * 10, weight: 900, azul-uc3m.lighten(70%), 
          )
        )
        text(               // heading text on separate line
          it.body, size: h1-size,
          fill: azul-uc3m,
          weight: "bold",
          top-edge: 0.75em, 
          bottom-edge: -0.25em,
        )
      } else {
        v(2 * page-grid) 
        text(size: 2 * page-grid, fill: azul-uc3m, weight: "bold", counter(heading).display() + h(0.5em) + it.body)   // appendix
      }
    }
  }

  show heading.where(level: 2): it => {v(16pt) + text(size: h2-size, fill: azul-uc3m, it)}
  show heading.where(level: 3): it => {v(16pt) + text(size: h3-size, fill: azul-uc3m, it)}
  show heading.where(level: 4): it => {v(16pt) + smallcaps(text(size: h4-size, weight: "semibold", fill: azul-uc3m, it.body))}

 // ---------- Body Text ---------------------------------------

  body


  // ========== APPENDIX ========================================

  in-body.update(false)
  set heading(numbering: "A.1")
  counter(heading).update(0)

  // ---------- Bibliography ---------------------------------------

  show std-bibliography: set heading(numbering: "A.1")
  if bibliography != none {
    set std-bibliography(
      title: REFERENCES.at(language),
      style: bib-style,
    )
    bibliography
  }

  // ---------- Glossary  ---------------------------------------

  if (glossary != none) {
    heading(level: 1, GLOSSARY.at(language))
    print-glossary(glossary)
  }

  // ---------- Appendix (other contents) ---------------------------------------

  if (appendix != none) {       // the user has to provide heading(s)
    appendix
  }

  // ========== LEGAL BACKMATTER ========================================

  set heading(numbering: it => h(-18pt) + "", outlined: false)

  // ---------- Confidentiality Statement ---------------------------------------

  if (not at-university and show-confidentiality-statement) {
    confidentiality-statement(
      authors,
      title,
      confidentiality-statement-content,
      university,
      university-location,
      date,
      language,
      many-authors,
      date-format,
    )
  }

  // ---------- Declaration Of Authorship ---------------------------------------

  if (show-declaration-of-authorship) {
    declaration-of-authorship(
      authors,
      title,
      declaration-of-authorship-content,
      date,
      language,
      many-authors,
      at-university,
      city,
      date-format,
    )
  }

}

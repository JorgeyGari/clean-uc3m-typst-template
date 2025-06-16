#import "locale.typ": *

#let titlepage(
  authors,
  date,
  title-font,
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
  // UC3M specific fields
  degree: none,
  course: none,
  tutors: none,
  location: none,
  // UC3M color
  azul-uc3m: rgb("#000e78"),
) = {

  // ---------- Page Setup ---------------------------------------

  set page(     
    // identical to document
    margin: (top: 4cm, bottom: 3cm, left: 4cm, right: 3cm),   
  )
  
  // The whole page in `title-font`, all elements centered
  set text(font: title-font, size: page-grid, fill: azul-uc3m)
  set align(center)

  // ---------- Logo ---------------------------------------
  
  // UC3M logo centered at top (larger and better positioned)
  place(                                
    top + center,
    dy: -2.5 * page-grid,  // Further reduced spacing to save vertical space
    box(logo-left, width: 100%, height: 5.5 * page-grid) // Slightly smaller but still prominent
  )

  // ---------- Content Structure following UC3M format ---------------------------------------

  v(4.8 * page-grid)  // Further reduced spacing to fit everything on one page
  
  // UC3M specific layout - clean and minimal
  
  // Degree
  if degree != none {
    text(size: 1.2 * page-grid, weight: "regular", degree)
    linebreak()
  }
  
  // Course/Academic year
  if course != none {
    text(size: 1.2 * page-grid, weight: "regular", course)
    linebreak()
    v(1.2 * page-grid)  // Further reduced spacing
  }
  
  // Type of thesis
  if type-of-thesis != none {
    text(size: 1.2 * page-grid, style: "italic", type-of-thesis)
    v(0.6 * page-grid)  // Further reduced spacing
  }
  
  // Title with quotes and rule (UC3M style)
  text(size: 2 * page-grid, weight: "bold", "\"" + title + "\"")
  v(0.3 * page-grid)  // Further reduced spacing
  
  // Horizontal rule (UC3M signature element)
  line(length: 70%, stroke: (paint: rgb("#000e78"), thickness: 0.5pt))
  v(0.3 * page-grid)  // Further reduced spacing
  
  // Author label and name
  text(size: 1.2 * page-grid, style: "italic", TITLEPAGE_AUTHOR.at(language))
  linebreak()
  text(size: 1.5 * page-grid, weight: "bold", authors.at(0).name)
  v(0.3 * page-grid)  // Further reduced spacing
  
  // Tutors (UC3M format)
  if tutors != none and tutors.len() > 0 {
    if tutors.len() == 1 {
      text(size: 1.2 * page-grid, style: "italic", TITLEPAGE_TUTOR.at(language))
    } else {
      text(size: 1.2 * page-grid, style: "italic", TITLEPAGE_TUTORS.at(language))
    }
    linebreak()
    for tutor in tutors {
      text(size: 1.2 * page-grid, tutor)
      linebreak()
    }
    v(0.3 * page-grid)  // Reduced spacing between tutors and location/date
  }
  
  // Location (UC3M format)
  if location != none {
    text(size: 1.2 * page-grid, location)
    linebreak()
  }
  
  // Date (UC3M format)
  text(size: 1.2 * page-grid, {
    set text(lang: language) // Set language context for date formatting
    
    // Helper function for Spanish month names
    let get-spanish-month(month-num) = {
      let spanish-months = (
        "enero", "febrero", "marzo", "abril", "mayo", "junio",
        "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"
      )
      spanish-months.at(month-num - 1)
    }
    
    if (type(date) == datetime) {
      if (language == "es" and date-format.contains("[month repr:long]")) {
        // Manual Spanish date formatting
        str(date.day()) + " de " + get-spanish-month(date.month()) + " de " + str(date.year())
      } else {
        date.display(date-format)
      }
    } else {
      date.at(0).display(date-format) + [ -- ] + date.at(1).display(date-format)
    }
  })
  
  // Creative Commons license (bottom left corner, moved further down)
  place(
    bottom + left,
    dy: -0.01 * page-grid,  // Moved much closer to the bottom edge
    {
      set text(fill: black, size: 0.5 * page-grid)  // Slightly smaller text
      set align(left)
      // Constrain the width based on page width
      box(width: 60%, {
        image("creativecommons.png", width: 3.5cm)  // Slightly smaller logo
        v(0.05 * page-grid)  // Reduced spacing between logo and text
        set par(justify: false)
        if (language == "es") {
          text("Esta obra está bajo una Licencia Creative Commons")
          linebreak()
          text("Atribución-NoComercial-SinDerivadas 4.0 Internacional.")
        } else {
          text("This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.")
        }
      })
    }
  )
}
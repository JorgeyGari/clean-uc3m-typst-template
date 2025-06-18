#import "../lib.typ": *

#show: clean-uc3m.with(
  title: "Test Document",
  authors: (
    (
      name: "Test Author",
      location: "Madrid, España",
    ),
  ),
  language: "es",
  date: datetime(year: 2024, month: 6, day: 16),
  date-format: "[day] de [month repr:long] de [year]",
  degree: "Grado en Ingeniería Informática",
  course: "Curso 2023-2024",
  type-of-thesis: "Trabajo de Fin de Grado",
  tutors: ("Dr. Test Tutor",),
  location: "Leganés, Madrid, España",
)

= Test Chapter

This is a test chapter to see if headings are blue.

== Test Section

This is a test section.

=== Test Subsection

This is a test subsection.

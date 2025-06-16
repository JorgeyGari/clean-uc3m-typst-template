#import "../lib.typ": *

// Simple, clean UC3M template - just import and use!

#show: clean-dhbw.with(
  title: "Your Thesis Title Here",
  authors: (
    (name: "Your Name", student-id: "Your ID", course: "Your Course"),
  ),
  type-of-thesis: "Trabajo de Fin de Máster",
  at-university: true, // UC3M format
  bibliography: none, // Add your bibliography here
  date: datetime.today(),
  language: "es", // or "en" for English
  degree: "Máster Universitario en...", // Your degree
  course: "Curso 2024-2025", // Academic year
  tutors: ("Prof. Dr. Tutor Name",), // Your tutors
  location: "Leganés, Madrid, España",
  university: "Universidad Carlos III de Madrid",
  university-location: "Madrid",
  university-short: "UC3M",
)

// Your content starts here
= Introduction

Write your thesis content here...

== Subsection

More content...

= Conclusion

Final thoughts...

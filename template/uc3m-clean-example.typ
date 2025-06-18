#import "../lib.typ": *
#import "glossary.typ": glossary-entries

// UC3M Clean Example - Only essential fields for UC3M format
#show: clean-uc3m.with(
  // === REQUIRED UC3M FIELDS ===
  title: "Development of a Symbolic Calculator from Scratch",
  authors: (
    (name: "Jorge Lázaro Ruiz"),  // UC3M: Only name required
  ),
  language: "en", // "en", "es", or "de"
  date: datetime(year: 2024, month: 6, day: 16),
  date-format: "[month repr:long] [day], [year]", // English format: "June 16, 2024"
  
  // UC3M specific fields
  degree: "Bachelor's Degree in Applied Mathematics and Computing",
  course: "2023-2024", 
  tutors: ("Carlos Linares López",), // Can have multiple tutors
  location: "Leganés, Madrid, Spain",
  
  // === REQUIRED BY TEMPLATE (set for UC3M compatibility) ===
  university: "Universidad Carlos III de Madrid", // Required by validation
  university-location: "Leganés", // Required by validation  
  university-short: "UC3M", // Required by validation
  supervisor: (university: "Carlos Linares López"), // Required by validation
  
  // === OPTIONAL UC3M FIELDS ===
  type-of-thesis: "Bachelor's Thesis", // Optional: thesis type
  bibliography: bibliography("sources.bib"), // Optional: if you have references
  glossary: glossary-entries, // Optional: if you use glossary terms
)

= Introduction

This is a clean UC3M template example that shows only the essential fields needed for Universidad Carlos III de Madrid thesis format.

#lorem(100)

= Background

#lorem(80)

== Code Examples

```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
```

= Methodology

#lorem(120)

= Results

#lorem(100)

= Conclusions

#lorem(80)

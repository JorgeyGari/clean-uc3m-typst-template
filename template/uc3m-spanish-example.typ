#import "../lib.typ": *
#import "glossary.typ": glossary-entries

#show: clean-uc3m.with(
  title: "Desarrollo de una Calculadora Simbólica desde Cero",
  authors: (
    (name: "Jorge Lázaro Ruiz"),
  ),
  type-of-thesis: "Trabajo de Fin de Grado",
  at-university: true, // UC3M is university-based
  bibliography: bibliography("sources.bib"),
  date: datetime(year: 2024, month: 6, day: 16),
  date-format: "[day] de [month repr:long] de [year]", // Spanish format: "16 de junio de 2024"
  glossary: glossary-entries,
  language: "es", // Spanish
  supervisor: (university: "Carlos Linares López"),
  university: "Universidad Carlos III de Madrid",
  university-location: "Leganés",
  university-short: "UC3M",
  // UC3M specific fields
  degree: "Grado en Matemáticas e Informática",
  course: "2023-2024",
  tutors: ("Carlos Linares López",),
  location: "Leganés, Madrid, España",
)

// Edita este contenido según tus necesidades

= Introducción

#lorem(100)

#lorem(80)

#lorem(120)

= Antecedentes

En esta sección se explican algunos elementos y funciones útiles para crear documentos Typst con esta plantilla.

== Expresiones y Abreviaciones

Utiliza la función `gls` para insertar expresiones del glosario que luego se enlazan a él. Un ejemplo de esto es:

En este capítulo se describe una #gls("API"). También hablamos en este contexto de una interfaz de software. La interfaz utiliza tecnologías como #gls("HTTP").

La plantilla utiliza el paquete `glossarium` para tales referencias de glosario. La correspondiente #link("https://typst.app/universe/package/glossarium/", "documentación") muestra otras variantes para tales referencias cruzadas. También hay información detallada sobre cómo se puede estructurar el glosario.

== Listas

- Primer elemento
- Segundo elemento
  - Elemento anidado
  - Otro elemento anidado
- Tercer elemento

== Ejemplos de Código

```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
```

== Ejemplos Matemáticos

La fórmula cuadrática es:

$ x = (-b ± sqrt(b^2 - 4 a c)) / (2 a) $

== Figuras

#figure(
  rect(width: 5cm, height: 3cm, fill: blue.lighten(80%)),
  caption: "Figura de ejemplo"
)

= Conclusiones

#lorem(150)

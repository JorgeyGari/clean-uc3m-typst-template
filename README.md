# Clean DHBW

A (modernized) [Typst](https://typst.app/) template for DHBW documents like Bachelor theses, "Studienarbeiten", project documentation etc. It is the official Typst template for Computer Science at DHBW Karlsruhe.

You can see an example of how the template looks in this [PDF file](https://github.com/roland-KA/clean-dhbw-typst-template/blob/main/template/main.pdf).

## Introduction and Motivation

In my experience as an end-user (i.e. reader) of documents like Bachelor theses and similar works which are currently produced at DHBW, there is room for improvement with respect to their usability.  There exists a recommendation at DHBW on how to structure and design such documents. I have the impression that some of the usability issues I identified are rooted directly within these recommendations, but others stem from the fact that some recommendations are just not thoroughly followed.

In order to give an example on how an improved document structure and layout could look like, I have created the present "*Clean DHBW Typst Template*". In the meantime it is the official Typst template for Computer Science at DHBW Karlsruhe. But of course anyone interested is welcome to use it too.

Of course such a concept is always a bit biased in some way. Therefore I explain the whys and hows below and I'm looking forward to the discussions it will provoke 😃. The name has been chosen in the sense "clean" is used in Software Engineering in terms like *clean architecture* or *clean code*, where it describes concepts and structures which are easy to understand, to use und to maintain. Furthermore they have a clear separation of concerns and responsibilities – for the case at hand that means: the template defines the typography, whereas the author is responsible for the contents.

There exists already a Typst template for these sorts of documents: It's the ["supercharged-dhbw"-template](https://github.com/DannySeidel/typst-dhbw-template) by Danny Seidel. It is a great piece of work with a lot of functionality covering a broad variety of use cases. But with respect to structure and layout, it implements exactly the above criticized state (which is without doubt what many people want or maybe have to use). I discussed with Danny on how to realize further development. We agreed to keep `supercharged-dhbw` more or less as-is in order to reflect current state and needs and in consequence to build this new template as a fork of his work. This gave me also  more freedom to go new ways.

For those interested, further and more detailed explanations about the design of the "*Clean DHBW Typst Template*" can be found here:
- [Assumptions](https://github.com/roland-KA/clean-dhbw-typst-template/blob/main/docs/assumptions.md) made for the development
- [Usability issues](https://github.com/roland-KA/clean-dhbw-typst-template/blob/main/docs/usability-issues.md) mentioned above in detail
- [Explanation of the new document structure and layout](https://github.com/roland-KA/clean-dhbw-typst-template/blob/main/docs/design-explained.md)

## Usage

You can use this template in the Typst web app by clicking "Start from template" on the dashboard and searching for `clean-dhbw`.

Alternatively (if you use Typst on your local computer), you can use the CLI to kick this project off using the command

```shell
typst init @preview/clean-dhbw MyFancyThesis
```

Typst will create a new directory (`MyFancyThesis` in this example) with all the files needed to get you started.

## Support

If you have questions, find bugs or have proposals for new features regarding the template or if you want to contribute, please create an issue in the [GitHub-repo](https://github.com/roland-KA/clean-dhbw-typst-template?tab=readme-ov-file).

For more general questions with respect to Typst, please consult the [Typst documentation](https://typst.app/docs/), the [Typst book](https://sitandr.github.io/typst-examples-book/book/about.html) or use the [Typst forum](https://forum.typst.app/), where you find a helpful and responsive community.

## Fonts

This template uses the following fonts (from Google fonts):

- [Source Serif 4](https://fonts.google.com/specimen/Source+Serif+4)
- [Source Sans 3](https://fonts.google.com/specimen/Source+Sans+3)

If you want to use typst locally, you can download the fonts from the links above and install them on your system (_Hint_: You need the TTF-files located within the `static` subfolders of both font-distributions). Otherwise, when using the web version, add the fonts to your project.

For further information on how to add fonts to your project, please refer to the [Typst documentation](https://typst.app/docs/reference/text/text/#parameters-font).

[**Source Serif 4**](https://fonts.google.com/specimen/Source+Serif+4) (formerly known as *Source Serif Pro*) has been chosen for the **body text** as it is a high-quality font especially made for on-screen use and the reading of larger quantities of text. It was designed in 2014 by [Frank Grießhammer](https://fonts.adobe.com/designers/frank-griesshammer) for Adobe as a companion to *Source Sans Pro*, thus expanding their selection of Open Source fonts. It belongs to the category of transitional style fonts. Its relatively large x-height is typical for on-screen fonts and adds to the legibility even at small sizes. The font ist constantly being further developed. In the meantime there are special variants available e.g. for small print (*Source Serif Caption*, *Source Serif Small Text*) or large titles (*Source Serif Display*) and headings (*Source Serif Headings*). For people with a Computer Science background, the font might be familiar as it is used for the online documentation of the Rust programming language.

For the **headlines** as well as for **other guiding elements** of the document, the font [**Source Sans 3**](https://fonts.google.com/specimen/Source+Sans+3) has been chosen. It comes as a natural choice since *Source Serif 4* has been especially designed for this combination. But it has its virtues of its own, e.g. its reduced run length which permits more characters per line. This helps to avoid line-breaks within headings in our use case. *Source Sans 3* (originally named *Source Sans Pro*) has been designed by [Paul D. Hunt](https://blog.typekit.com/2013/11/20/interview-paul-hunt/) in 2012 as Adobes first Open Source font. It has its roots in the family of Gothic fonts thus belonging to a different category than *Source Serif 4*. But under [Robert Slimbachs](https://de.wikipedia.org/wiki/Robert_Slimbach) supervision, both designers succeeded to create a combination that fits well and at the same time the different rootings make the pairing not too "boring".

## Packages Used

This template uses the following packages:

- [codelst](https://typst.app/universe/package/codelst): To create code snippets
- [hydra](https://github.com/tingerrr/hydra): To display the current heading within the header.
- [glossarium](https://github.com/typst-community/glossarium): For the glossary of the document.


## Configuration

This template exports the `clean-dhbw` function with the following named arguments:

`title (str*)`: Title of the document

`authors (dictionary*)`: List of authors with the following named arguments (max. 6 authors when in the company or 8 authors when at DHBW):

- name (str*): Name of the author
- student-id (str*): Student ID of the author
- course (str*): Course of the author
- course-of-studies (str*): Course of studies of the author
- signature (image): Optional image of the authors signature (used for the declaration of authorship)
- company (dictionary): Company of the author (only needed when `at-university` is `false`) with the following named arguments:
  - name (str*): Name of the company
  - post-code (str): Post code of the company
  - city (str*): City of the company
  - country (str): Country of the company

CAVEAT: The template hasn't been adapted nor tested for more than two authors. 

`abstract (content)`: Content of the abstract, it is recommended that you pass a variable containing the content or a function that returns the content

`appendix (content)`: User-defined content of the appendix. It is recommended that you pass a variable containing the content or a function that returns the content

`at-university (bool*)`: Whether the document is written at university or not, default is `false`

`bibliography (content)`: Path to the bibliography file

`bib-style (str)`: Style of the bibliography, default is `ieee`

`city (str)`: City of the author (only needed when `at-university` is `true`)

`confidentiality-marker: (dictionary)`: Configure the confidentially marker (red or green circle) on the title page (using this option reduces the maximum number of authors by 2 to 4 authors when in the company or 6 authors when at DHBW)

- display (bool*): Whether the confidentiality marker should be shown, default is `false`
- offset-x (length): Horizontal offset of the confidentiality marker, default is `0pt`
- offset-y (length): Vertical offset of the confidentiality marker, default is `0pt`
- size (length): Size of the confidentiality marker, default is `7em`
- title-spacing (length): Adds space below the title to make room for the confidentiality marker, default is `2em`

`confidentiality-statement-content (content)`: Provide a custom confidentiality statement

`date (datetime* | array*)`: Provide a datetime object to display one date (e.g. submission date) or a array containing two datetime objects to display a date range (e.g. start and end date of the project), default is `datetime.today()`

`date-format (str)`: Format of the displayed dates, default is `"[day].[month].[year]"` (for more information on possible formats check the [Typst documentation](https://typst.app/docs/reference/foundations/datetime/#format))

`declaration-of-authorship-content (content)`: Provide a custom declaration of authorship

`glossary (array of arrays)`: Pass an array of arrays (see below or the [glossary docs](https://typst.app/universe/package/glossarium/))

`language (str*)`: Language of the document which is either `en` or `de`, default is `en`

`logo-left (content)`: Path to the logo on the left side of the title page (usage: image("path/to/image.png")), default is the `DHBW logo`. If it is the only logo given, then it will be displayed centered.

`logo-right (content)`: Path to the logo on the right side of the title page (usage: image("path/to/image.png")), default is `no logo`

`math-numbering (str)`: Numbering style of the math equations, set to `none` to turn off equation numbering, default is `"(1)"` (for more information on possible numbering formats check the [Typst documentation](https://typst.app/docs/reference/model/numbering))

`show-abstract (bool)`: Whether the abstract should be shown, default is `true`

`show-confidentiality-statement (bool)`: Whether the confidentiality statement should be shown, default is `true`

`show-declaration-of-authorship (bool)`: Whether the declaration of authorship should be shown, default is `true`

`show-table-of-contents (bool)`: Whether the table of contents should be shown, default is `true`

`supervisor (dictionary*)`: Name of the supervisor at the university and/or company (e.g. supervisor: (company: "John Doe", university: "Jane Doe"))

- company (str): Name of the supervisor at the company (note while the argument is optional at least one of the two arguments must be provided)
- university (str): Name of the supervisor at the university (note while the argument is optional at least one of the two arguments must be provided)

`titlepage-content (content)`: Provide a custom title page

`type-of-thesis (str)`: Type of the thesis, default is `none` (using this option reduces the maximum number of authors by 2 to 4 authors when in the company or 6 authors when at DHBW)

`university (str*)`: Name of the university

`university-location (str*)`: Campus or city of the university

`university-short (str*)`: Short name of the university (e.g. DHBW), displayed for the university supervisor

For each argument the expected type of the value is given in parentheses. All arguments marked with `*` are required.

Have a look at the example file [`main.typ`](https://github.com/roland-KA/clean-dhbw-typst-template/blob/main/template/main.typ) whithin the [`template`](https://github.com/roland-KA/clean-dhbw-typst-template/tree/main/template) directory on how to use the `clean-dhbw`-function with a typical subset of these parameters.

### A typical configuration for a Bachelor Thesis

A typical Bachelor Thesis which has _one author_ and takes place in cooperation between _DHBW_ and the _partner company,_ could have the following parametrization:

```typ
  title: "Exploration of Typst for the Composition of a University Thesis",
  authors: (
    (name: "Max Mustermann", student-id: "7654321", 
     course: "TIS21", course-of-studies: "Informatik", 
     company: ((name: "MouseTec GmbH", post-code: "70435", city: "Karlsruhe"))
    ),
  ),
  at-university: false, 
  type-of-thesis: "Bachelorarbeit",
  show-confidentiality-statement: true, // optional, if company desires so
  show-declaration-of-authorship: true,
  bibliography: bibliography("sources.bib"),
  date: datetime.today(),
  glossary: glossary-entries,          // glossary terms from external file (see below)
  language: "de",                      // en, de
  supervisor: (
    company: "John Appleseed", 
    university: "Prof. Dr. Daniel Düsentrieb"
  ),
  logo-right: image("path/to/company-logo-image.png"),
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Karlsruhe",
  university-short: "DHBW",
```

### A typical configuration for a "Studienarbeit"

A typical Studienarbeit which has _two authors_ and takes place at _DHBW only,_ could have the following parametrization:

```typ
  title: "Exploration of Typst for the Composition of a University Thesis",
  authors: (
    (name: "Max Mustermann", student-id: "7654321", 
     course: "TIS21", course-of-studies: "Informatik", 
    ),
    (name: "Luise Müller", student-id: "7653451", 
     course: "TIS21", course-of-studies: "Informatik", 
    ),
  ),
  city: "Karlsruhe",
  at-university: true, 
  type-of-thesis: "Studienarbeit",
  show-confidentiality-statement: true, // optional, if company desires so
  show-declaration-of-authorship: true,
  bibliography: bibliography("sources.bib"),
  date: datetime.today(),
  glossary: glossary-entries,          // glossary terms from external file (see below)
  language: "de",                      // en, de
  supervisor: (
    university: "Prof. Dr. Daniel Düsentrieb"
  ),
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Karlsruhe",
  university-short: "DHBW",
``` 

## UC3M Template Modifications

This template has been adapted to support Universidad Carlos III de Madrid (UC3M) thesis format alongside the original DHBW format.

### UC3M Specific Features

The template now includes:

- **UC3M Logo**: Automatically uses the UC3M logo (`uc3m_logo.svg`)
- **UC3M Blue Color**: Uses the official UC3M blue color (`#000e78` - matches LaTeX class)
- **Simplified Author Format**: For UC3M, only author name is required (no student-id, course, etc.)
- **Spanish Language Support**: Added `"es"` language option
- **UC3M Title Page Layout**: Matches the UC3M thesis cover page structure
- **Flexible Date Formats**: Support for English, Spanish, and German date formats

### UC3M Cover Page Fields

**Fields displayed on UC3M cover:**
- ✅ UC3M Logo (centered, larger size)
- ✅ Degree name
- ✅ Academic year/course
- ✅ Thesis type (italic)
- ✅ Title (in quotes with horizontal rule)
- ✅ Author name
- ✅ Tutor(s)
- ✅ Location
- ✅ Date
- ✅ Creative Commons license (bottom left, with logo and text)

**DHBW fields NOT displayed in UC3M format:**
- ❌ University name (implied by logo)
- ❌ University location (included in location field)
- ❌ Student ID
- ❌ Course details
- ❌ Company information
- ❌ Confidentiality statements
- ❌ Multiple logos

### UC3M Usage Example

```typst
#import "@preview/clean-dhbw:0.3.1": *

#show: clean-dhbw.with(
  // === ESSENTIAL UC3M FIELDS ===
  title: "Development of a Symbolic Calculator from Scratch",
  authors: ((name: "Jorge Lázaro Ruiz"),),
  language: "en", // or "es" for Spanish
  date: datetime(year: 2024, month: 6, day: 16),
  date-format: "[month repr:long] [day], [year]", // English: "June 16, 2024"
  // date-format: "[day] de [month repr:long] de [year]", // Spanish: "16 de junio de 2024"
  
  // UC3M specific display fields
  degree: "Bachelor's Degree in Applied Mathematics and Computing",
  course: "2023-2024",
  tutors: ("Carlos Linares López",),
  location: "Leganés, Madrid, Spain",
  
  // === TEMPLATE COMPATIBILITY (required but not displayed) ===
  university: "Universidad Carlos III de Madrid",
  university-location: "Leganés",
  university-short: "UC3M", 
  supervisor: (university: "Carlos Linares López"),
  
  // === OPTIONAL ===
  type-of-thesis: "Bachelor's Thesis",
  bibliography: bibliography("sources.bib"),
)
```

### Date Format Options

- **English**: `"[month repr:long] [day], [year]"` → "June 16, 2024"
- **Spanish**: `"[day] de [month repr:long] de [year]"` → "16 de junio de 2024" (automatically uses Spanish month names)
- **German/Default**: `"[day].[month].[year]"` → "16.06.2024"

### UC3M vs DHBW Format Comparison

| Field | UC3M Usage | DHBW Usage | Notes |
|-------|------------|------------|-------|
| `authors` | `(name: "Author")` | `(name: "Author", student-id: "123", course: "ABC", ...)` | UC3M simplified |
| `degree` | ✅ Displayed on cover | ❌ Not used | UC3M specific |
| `course` | ✅ Displayed as academic year | ❌ Not used | UC3M specific |
| `tutors` | ✅ Displayed on cover | ❌ Not used | UC3M specific |
| `location` | ✅ Displayed on cover | ❌ Not used | UC3M specific |
| `university` | ❌ Not displayed (required for validation) | ✅ Displayed | Implied by UC3M logo |
| `supervisor` | ❌ Not displayed (required for validation) | ✅ Displayed | Use `tutors` instead |
| `confidentiality-marker` | ❌ Not used | ✅ Optional | Not relevant for UC3M |
| `company` info | ❌ Not used | ✅ Required for non-university | UC3M is university-only |
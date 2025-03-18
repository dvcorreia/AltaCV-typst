# AltaCV for Typst

<div align="center">Version 0.1.0</div>

A Typst port of [liantze's AltaCV](https://github.com/liantze/AltaCV), a modern and elegant CV template.

>[!WARNING]
> This template is in a state I would **NOT** consider ready for everyone to use and enjoy.
> I don't plan to support this endeavor if no one uses the template, so feel free to open issues and I will try to get to it asap. 
> I would suggest you to try and fix any problems you may encounter and even open PR!.
> Typst is fairly accessible to everyone and this weekend re-write with no prior experience is proof of it.

## Template adaptation checklist

- [ ] Fill out `README.md`
  - Change the `my-package` package name, including code snippets
  - Check section contents and/or delete sections that don't apply
- [x] Check and/or replace `LICENSE` by something that suits your needs
- [x] Fill out `typst.toml`
  - See also the [typst/packages README](https://github.com/typst/packages/?tab=readme-ov-file#package-format)
- [x] Adapt Repository URLs in `CHANGELOG.md`
  - Consider only committing that file with your first release, or removing the "Initial Release" part in the beginning
- [ ] Adapt or deactivate the release workflow in `.github/workflows/release.yml`
  - to deactivate it, delete that file or remove/comment out lines 2-4 (`on:` and following)
  - to use the workflow
    - [ ] check the values under `env:`, particularly `REGISTRY_REPO`
    - [ ] if you don't have one, [create a fine-grained personal access token](https://github.com/settings/tokens?type=beta) with [only Contents permission](https://stackoverflow.com/a/75116350/371191) for the `REGISTRY_REPO`
    - [ ] on this repo, create a secret `REGISTRY_TOKEN` (at `https://github.com/[user]/[repo]/settings/secrets/actions`) that contains the so created token

    if configured correctly, whenever you create a tag `v...`, your package will be pushed onto a branch on the `REGISTRY_REPO`, from which you can then create a pull request against [typst/packages](https://github.com/typst/packages/)
- [ ] remove/replace the example test case
- [ ] (add your actual code, docs and tests)
- [ ] remove this section from the README

## Getting Started

AltaCV for Typst provides a modern sidebar layout for creating professional CVs/resumes. The template gives you a clean, organized structure for showcasing your experience, education, skills, and more.

```typ
#import "@preview/altacv:0.1.0": *

#show: altacv.with(
  name: "Your Name",
  photo: image("profile.jpg"),
  info: (
    email: "your.email@example.com",
    phone: "123-456-7890",
    location: "City, Country",
    homepage: "yourwebsite.com",
    linkedin: "yourprofile",
    github: "yourusername",
  ),
)
```

### Installation

You can use this template in the Typst web app by using the package import:

```typ
#import "@preview/altacv:0.1.0": *
```

For local installation, you can add this package to your project using the Typst package manager:

```
typst packages add @preview/altacv:0.1.0
```

Or manually install it by cloning this repository into your project's packages directory:

```
git clone https://github.com/dvcorreia/AltaCV-typst.git ~/.typst/packages/local/altacv
```

## Usage

### Basic Structure

The template uses a grid layout to create the two-column structure:

```typ
#grid(
  columns: (60%, auto),
  gutter: 20pt,
)[
  // Main content column (experiences, etc.)
][
  // Sidebar column (education, skills, etc.)
]
```

### Experience Entries

```typ
#experience(
  title: "Job Title",
  company: company_name,
  period: (
    start: datetime(day: 1, month: 7, year: 2020),
    end: datetime.today(),
  ),
  location: "City, Country",
)[
  - Accomplishment 1
  - Accomplishment 2
  
  #tag(skill1) #tag(skill2)
]
```

### Education Entries

```typ
#education(
  degree: "Degree Name",
  institution: university_name,
  period: "Start Year - End Year",
)[
  Additional information about your studies
]
```

### Organization Entries

```typ
#organization(
  title: "Role",
  org: organization_name,
  period: (
    start: datetime(day: 1, month: 10, year: 2023)
  )
)[
  Description of your involvement
]
```

### Skills and Tags

```typ
// For skills with level indicators
#skill("Skill Name", 4.5)  // Level from 0 to 5

// For tag-style skills without levels
#tag("skill_name")
#tag[Skill with spaces]
```

### GitHub Projects

```typ
#github_card("username", "repository", desc: "Optional description")
```

### Company/Institution Aliases and Links

You can define company or institution names with hyperlinks in a separate file for cleaner code:

```typ
// In alias.typ
#import "@preview/altacv:0.1.0": https, github_href

#let sub(name, href: "") = {
  if href != "" {
    if href.contains("https://") {
      link(href, name)
    } else {
      link(https(href), name)
    }
  } else {
    name
  }
}

// Companies
#let google = sub("Google", href: "google.com")

// Universities
#let stanford = sub("Stanford University", href: "stanford.edu")

// In your main file
#import "alias.typ": *

#experience(company: google, ...)
#education(institution: stanford, ...)
```

### Horizontal Rule

Use `#hrule` to add a horizontal separator between sections.

## Example

Here's a simple example of how to use the template:

```typ
#import "@preview/altacv:0.1.0": cv, experience, education, tag, skill, hrule, github_card
#import "alias.typ": *

#show: cv.with(
  name: "John Doe",
  photo: image("profile.jpg"),
  info: (
    email: "john.doe@example.com",
    phone: "123-456-7890",
    location: "New York, NY",
    homepage: "johndoe.com",
    linkedin: "johndoe",
    github: "johndoe",
  ),
)

#grid(
  columns: (60%, auto),
  gutter: 20pt,
)[
  == Experience
  
  #experience(
    title: "Senior Developer",
    company: tech_company,
    period: (
      start: datetime(year: 2018, month: 1, day: 1),
      end: datetime.today(),
    ),
    location: "New York, NY",
  )[
    - Led development of key features
    - Mentored junior developers
    
    #tag(python) #tag(javascript) #tag(reactjs)
  ]
][
  == Education
  
  #education(
    degree: "M.S. Computer Science",
    institution: university,
    period: "2015 - 2017",
  )[
    Specialized in machine learning and computer vision
  ]
  
  == Skills
  
  #tag(python)
  #tag(javascript)
  #tag(docker)
  
  #hrule
  
  #skill("English (Native)", 5)
  #skill("Spanish", 3.5)
  
  == Projects
  
  #github_card("johndoe", "awesome-project")
]
```

For complete examples, see both the [template version](./template/main.typ), included in this repository, or [my personal CV version](https://github.com/dvcorreia/cv).

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the LPPL-1.3c License - see the LICENSE file for details.

## Acknowledgments

* Original [AltaCV](https://github.com/liantze/AltaCV) LaTeX template by LianTze Lim
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

// companies
#let yahoo = sub("Yahoo!", href: "yahoo.com")
#let tumblr = sub("Tumblr", href: "tumblr.com")
#let google = sub("Google", href: "google.com")

// universities
#let stanford = sub("Stanford University", href: "stanford.edu")

// products
#let google_maps = sub("Google Maps", href: "google.com/maps")
#let google_earth = sub("Google Earth", href: "earth.google.com")
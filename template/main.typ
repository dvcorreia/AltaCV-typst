#import "@preview/altacv:0.1.0": *
#import "alias.typ": *

#show: altacv.with(
  name: "Marissa Mayer",
  photo: image("mmayer-wikipedia-cc-by-2_0.jpg"),
  info: (
    email: "mmayer@yahoo-inc.com",
    phone: "000-00-0000",
    location: "Sunnyvale, CA",
    homepage: "marissamayr.tumblr.com",
    linkedin: "marissamayer",
    github: "mmayer", // made-up github user 
  ),
)

#grid(
  columns: (60%, auto),
  gutter: 20pt,
)[
  == Experience

  #experience(
    title: "President & CEO",
    company: yahoo,
    period: (
      start: datetime(day: 1, month: 7, year: 2012),
      end: datetime.today(),
    ),
    location: "Sunnyvale, CA",
  )[
    - Led the \$5 billion acquisition of the company with Verizon -- the entity which believed most in the immense value #yahoo has created
    - Acquired tumblr for \$1.1 billion and moved the company's blog there
    - Built #yahoo's mobile, video and social businesses from nothing in 2011 to \$1.6 billion in GAAP revenue in 2015
    - Tripled the company's mobile base to over 600 million monthly active users and generated over \$1 billion of mobile advertising revenue last year
  ]

  #hrule

  #experience(
    title: "Vice President of Location & Services",
    company: google,
    period: (
      start: datetime(day: 1, month: 10, year: 2010),
      end: datetime(day: 1, month: 7, year: 2012),
    ),
    location: "Palo Alto, CA",
  )[
    - Position #google_maps as the world leader in mobile apps and navigation
    - Oversaw 1000+ engineers and product managers working on #google_maps, Google Places and #google_earth
  ]

  #hrule

  #experience(
    title: "Vice President of Search Products & UX",
    company: google,
    period: (
      start: datetime(day: 1, month: 1, year: 2005),
      end: datetime(day: 1, month: 1, year: 2010),
    ),
    location: "Palo Alto, CA",
  )[]

  #hrule

  #experience(
    title: "Product Manager & UI Lead",
    company: google,
    period: (
      start: datetime(day: 1, month: 10, year: 2001),
      end: datetime(day: 1, month: 7, year: 2005),
    ),
    location: "Palo Alto, CA",
  )[
    - Appointed by the founder Larry Page in 2001 to lead the Product Management and User Interaction teams
    - Optimized #google's homepage and A/B tested every minor detail to increase usability (incl.~spacing between words, color
  ]
][
  == Education

  #education(
    degree: [M.S. in Computer Science],
    institution: stanford,
    period: "Sep 1997 - June 1999",
  )[]

  #hrule

  #education(
    degree: [B.S. in Symbolic Systems],
    institution: stanford,
    period: "Sep 1993 - June 1997",
  )[]
  
  == Strengths

  #tag("Hard-working (18/24)")
  #tag("Persuasive")
  #tag("Motivator & Leader")

  #hrule

  #tag("UX")
  #tag("Mobile Devices & Applications")
  #tag("Product Management & Marketing")

  == Languages

  #skill("English", 5)
  #skill("Spanish", 4)
  #skill("German", 3.5)
]
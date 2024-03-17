import nakai/html
import nakai/html/attrs

const header_style = "
 color: #331f26;
 font-family: 'Neuton', serif;
 font-size: 128px;
 font-weight: 400;
"

const description = "A minimal HTMX"

pub fn header(attrs: List(attrs.Attr(a)), text: String) -> html.Node(a) {
  let attrs = [attrs.style(header_style), ..attrs]
  html.h1_text(attrs, text)
}

pub fn page() -> List(html.Node(a)) {
  [
    html.meta([attrs.charset("utf-8")]),
    html.meta([
      attrs.name("viewport"),
      attrs.content("width=device-width, initial-scale=1"),
    ]),
    html.meta([attrs.name("theme-color"), attrs.content("#1C1918")]),
    html.link([attrs.rel("icon"), attrs.href("/assets/images/favicon.png")]),
    // OG tags
    html.meta([attrs.property("og:description"), attrs.content(description)]),
    html.meta([attrs.property("og:image"), attrs.type_("image/x-icon")]),
    html.meta([attrs.property("og:type"), attrs.content("website")]),
    // styles and scripts

    html.title("Gleahtmx"),
  ]
}

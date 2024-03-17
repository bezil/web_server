import nakai
import nakai/html
import nakai/html/attrs

const header_style = "
 color: #331f26;
 font-family: 'Neuton', serif;
 font-size: 128px;
 font-weight: 400;
"

pub fn header(attrs: List(attrs.Attr(a)), text: String) -> html.Node(a) {
  let attrs = [attrs.style(header_style), ..attrs]
  html.h1_text(attrs, text)
}

pub fn page() -> String {
  html.div([], [
    html.Head([html.title("Hello!")]),
    header([], "Hello, from Glen!"),
  ])
  |> nakai.to_string()
}

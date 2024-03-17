import nakai/html
import nakai/html/attrs
import nakai

pub fn page(head: List(html.Node(a))) -> String {
  html.Head(head)
  html.Body([], [
    html.Element(
      "script",
      [
        attrs.src("https://unpkg.com/htmx.org@1.9.11"),
        attrs.integrity(
          "sha384-0gxUXCCR8yv9FM2b+U3FDbsKthCI66oH5IA9fHppQq9DDMHuMauqq1ZHBpJxQ0J0",
        ),
        attrs.Attr("crossorigin", "anonymous"),
      ],
      [],
    ),
    html.button(
      [attrs.Attr("hx-post", "/click"), attrs.Attr("hx-trigger", "click")],
      [html.Text("Click Me!")],
    ),
  ])
  |> nakai.to_string()
}

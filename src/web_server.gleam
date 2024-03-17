import gleam/javascript/promise.{type Promise}
import glen
import glen/status
import pages

pub fn main() {
  glen.serve(8000, handle_req)
}

fn handle_req(_req: glen.Request) -> Promise(glen.Response) {
  pages.home()
  |> glen.html(status.ok)
  |> promise.resolve
}

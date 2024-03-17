import gleam/javascript/promise.{type Promise}
import gleam/javascript.{type Reference}
import glen
import glen/status
import pages
import blocks
import gleam/io

pub fn main() {
  // Create a reference to the counter with an initial value of 0
  let counter_ref = javascript.make_reference(0)

  // Increment the counter by 1
  let _new_counter_value = update_counter(counter_ref, 1)
  glen.serve(8000, handle_req(_, counter_ref))
}

// Function to update the counter value
pub fn update_counter(counter_ref: Reference(Int), increment_by: Int) -> Int {
  // Update the counter reference by applying a function that increments the current value
  javascript.update_reference(counter_ref, fn(counter) -> Int {
    counter + increment_by
  })
}

fn handle_req(
  req: glen.Request,
  counter: Reference(Int),
) -> Promise(glen.Response) {
  // Log all requests and responses
  use <- glen.log(req)
  // Handle potential crashes gracefully
  use <- glen.rescue_crashes

  let new_counter_value = update_counter(counter, 1)

  io.debug(glen.path_segments(req))

  case glen.path_segments(req) {
    ["click"] ->
      blocks.click(new_counter_value)
      |> glen.html(status.ok)
      |> promise.resolve
    [] ->
      pages.index()
      |> pages.home()
      |> glen.html(status.ok)
      |> promise.resolve
    _ ->
      glen.html("<p>Not Found</p>", status.not_found)
      |> promise.resolve
  }
}

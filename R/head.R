# BSD_2_clause

#' Create the <head> for ESC dev index.html
#'
#' Edit this function if new styling components, names, etc. are needed
#'
#' @return An \code{htmltools tags$head} element
#' @seealso \link{make_modals} \link{make_body}
#' @export
#' @examples
#' \dontrun{
#' make_head()
#' }
make_head <- function() {
  head <- tags$head(
    tags$meta(charset = "utf-8"),
    tags$meta(`http-equiv`="X-UA-Compatible", content="IE=edge"),
    tags$meta(name="viewport", content="width=device-width, initial-scale=1"),
    tags$title("Defenders ESC Development Pages")
  )
  return(head)
}

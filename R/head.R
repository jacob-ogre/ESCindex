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
    tags$title("Defenders CCI Development Pages"),
    make_jsonld()
  )
  return(head)
}

make_jsonld <- function() {
  sprintf(
'<script type="application/ld+json">
  {
    "@context": "http://schema.org/",
    "@type": "WebSite",
    "name": "Defenders of Wildlife Center for Conservation Innovation Development Site",
    "dateCreated": "%s",
    "creator": {
      "name": "Defenders of Wildlife Center for Conservation Innovation"
    },
    "about": "Research and development for improving wildlife conservation",
    "url": "https://defend-esc-dev.org"
  }
</script>', Sys.Date())
}

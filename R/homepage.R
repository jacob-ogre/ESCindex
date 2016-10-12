# BSD_2_clause

#' Create the homepage for https://defend-esc-dev.org
#'
#' The homepage for our development site contains many different components that
#' need to be updated frequently. To help manage those updates and keep
#' everything as simple as possible, this function generates the index.html
#' page given the content data in https://goo.gl/696ZA4. Simply update the data
#' there and it will appear in the new HTML file.
#'
#' @export
#' @examples
#' home <- generate_homepage()
generate_homepage <- function() {
  head <- make_head()
  modals <- make_modals()
}

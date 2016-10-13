# BSD_2_clause

add_javascript <- function() {
  tags$div(
    tags$script(src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"),
    tags$script(src="www/bootstrap/js/bootstrap.min.js"),
    tags$link(href="www/bootstrap/css/bootstrap.css",
              rel="stylesheet"),
    tags$script(href="www/bootstrap/js/bootstrap.js")
  )
}

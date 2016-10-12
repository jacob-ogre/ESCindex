# BSD_2_clause

#' Make the title banner (jumbotron) for homepage
#'
#' @importFrom dplyr filter
#' @import htmltools
#' @export
make_jumbotron <- function() {
  jum <- filter(index_data, Type == "jumbotron")
  tags$div(
    class = "well",
    tags$h1(
      jum$Title,
      tags$br(),
      tags$small(
        tags$div(
          style = "padding-top: 10px",
          HTML(jum$Content)
        )
      )
    )
  )
}

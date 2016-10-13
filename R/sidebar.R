# BSD_2_clause

#' Create the sidebox (infobox, left-side)
#'
#' @return what is returned
#' @importFrom dplyr filter
#' @import htmltools
#' @export
make_sidebar <- function() {
  side_dat <- filter(index_data, Type == "info_box")

  tags$div(
    class = "col-md-3",
    tags$div(
      class = "panel panel-default",
      tags$div(
        class = "panel-body",
        tags$h4(
          style = "font-weight:bold",
          side_dat$Title[1]
        ),
        tags$hr(),
        HTML(side_dat$Content[1])
      )
    )
  )
}

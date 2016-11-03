# BSD_2_clause

#' Create section separator boxes by section Name
#'
#' @export
#' @import htmltools
#' @importFrom dplyr filter
make_section_box <- function(sect) {
  subd <- filter(index_data, Name == sect)
  box <- tags$div(
    # class = "panel panel-default",
    id = "plain-panel",
    tags$div(
      class = "panel-body",
      tags$h4(
        style = "font-weight:bold;",
        subd$Title
      ),
      HTML(subd$Content)
    )
  )
  return(box)
}

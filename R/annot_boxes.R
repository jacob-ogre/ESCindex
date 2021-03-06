# BSD_2_clause

#' Create bootstrap boxes for documents for Hypothes.is annotation
#'
#' @import htmltools
#' @importFrom dplyr filter
#' @export
make_annot_boxes <- function() {
  app_dat <- filter(index_data, Type == "poldoc")
  n_apps <- length(app_dat$Type)
  n_rows <- n_apps %/% 3
  n_rows <- ifelse(n_apps %% 3 != 0,
                   n_rows + 1,
                   n_rows)

  res <- list()
  for(row in 1:n_rows) {
    cur_set_apps <- list()
    for(col in 1:3) {
      app <- col + (3 * (row - 1))
      if(app <= n_apps) {
        dat <- app_dat[app, ]
        restrict <- ifelse(grepl(dat$Link, pattern = "shiny/closed", fixed = TRUE),
                           '<span class="label label-danger">Restricted</span>',
                           '')
        cur <- tags$div(
          class = "col-md-4",
          tags$a(
            href = dat$Link,
            target = "_blank",
            tags$div(
              class = "panel panel-info",
              tags$div(
                class = "panel-heading",
                dat$Title
              ),
              tags$div(
                class = "panel-body",
                tags$p(
                  dat$Content
                ),
                HTML(restrict)
              )
            )
          )
        )
        cur_set_apps[[col]] <- cur
      }
    }
    try_res <- try(
      res[[row]] <- tags$div(
        class = "row",
        cur_set_apps
      )
    )
    if(class(try_res) == "try-error") {
      stop("App boxes failed.")
    }
  }
  return(res)
}

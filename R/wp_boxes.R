# BSD_2_clause

#' Create bootstrap boxes for working papers
#'
#' @import htmltools
#' @importFrom dplyr filter
#' @export
make_wp_boxes <- function() {
  app_dat <- filter(index_data, Type == "wp")
  n_apps <- length(app_dat$Type)
  n_rows <- n_apps %/% 3
  n_rows <- ifelse(n_apps %% 3 != 0,
                   n_rows + 1,
                   n_rows)
  # print(n_rows)

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
              class = "panel panel-success",
              tags$div(
                class = "panel-heading",
                dat$Title
              ),
              tags$div(
                class = "panel-body",
                tags$p(
                  style = "color:#43ac6a",
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
    res[[row]] <- tags$div(
      class = "row",
      cur_set_apps
    )
  }
  return(res)
}

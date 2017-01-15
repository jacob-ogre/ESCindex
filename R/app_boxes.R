# BSD_2_clause

#' Create bootstrap boxes for apps
#'
#' @return what is returned
#' @import htmltools
#' @importFrom dplyr filter
#' @export
make_app_boxes <- function() {
  app_dat <- filter(index_data, Type == "app")
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
        restrict <- ifelse(grepl(dat$Link,
                                 pattern = "shiny/closed|esadocs",
                                 fixed = FALSE),
                           '<span class="label label-danger">Restricted</span>',
                           '')
        cur <- tags$div(
          class = "col-md-4",
          tags$a(
            href = dat$Link,
            target = "_blank",
            tags$div(
              class = "panel panel-primary",
              tags$div(
                class = "panel-heading",
                dat$Title
              ),
              tags$div(
                class = "panel-body",
                tags$p(dat$Content),
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

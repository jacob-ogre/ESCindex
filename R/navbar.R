# BSD_2_clause

#' Create the navbar HTML
#'
#' @return HTML for a navbar on the homepage
#' @import htmltools
#' @importFrom dplyr filter
#' @export
make_navbar <- function() {
  nav_dat <- filter(index_data, Type == "nav_element")
  drp_dat <- filter(index_data, Type == "nav_element_drop")

  make_li_tags <- function(dat) {
    res <- list()
    for(i in 1:length(dat$Type)) {
      res[[i]] <- tags$li(
        tags$a(href = dat[i, ]$Link,
               target = "_blank",
               dat[i, ]$Title)
      )
    }
    return(res)
  }

  tags$nav(
    class = "navbar navbar-default navbar-fixed-top",
    tags$div(class = "container-fluid",
      tags$div(class = "navbar-header",
        tags$button(
          type = "button",
          class = "navbar-toggle collapsed",
          `data-toggle` = "collapse",
          `data-target` = "#bs-example-navbar-collapse-2",
          tags$span(
            class = "sr-only",
            "Toggle navigation"
          ),
          tags$span(class = "icon-bar"),
          tags$span(class = "icon-bar"),
          tags$span(class = "icon-bar")
        ),
        tags$a(
          class = "navbar-brand",
          href = "#",
          "ESC Dev"
        )
      ),
      tags$div(
        class = "collapse navbar-collapse",
        id = "bs-example-navbar-collapse-2",
        tags$ul(
          class = "nav navbar-nav",
          make_li_tags(nav_dat),
          tags$li(
            class = "dropdown",
            tags$a(
              href = "#",
              class = "dropdown-toggle",
              `data-toggle` = "dropdown",
              role = "button",
              `aria-haspopup` = "true",
              `aria-expanded` = "false",
              "More",
              tags$span(class = "caret")
            ),
            tags$ul(
              class = "dropdown-menu",
              make_li_tags(drp_dat)
            )
          )
        )
      )
    )
  )
}

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
  navbar <- make_navbar()
  jumbo <- make_jumbotron()
  sidebar <- make_sidebar()
  app_box <- make_section_box("app_box")
  wp_box <- make_section_box("wp_box")
  apps <- make_app_boxes()
  wps <- make_wp_boxes()
  mu_box <- make_section_box("micro_box")
  muapps <- make_muapp_boxes()
  anno_box <- make_section_box("annot_box")
  annots <- make_annot_boxes()

  page <- tags$html(
    head,
    tags$body(
      modals,
      navbar,
      tags$br(),
      tags$br(),
      tags$div(
        style = "width:90%; padding-left:10%",
        tags$div(
          class = "col-md-12",
          br(),
          jumbo
        ),
        sidebar,
        tags$div(
          class = "col-md-9",
          tags$div(
            class = "row",
            tags$div(
              class = "col-md-12",
              app_box
            )
          ),
          apps,
          tags$div(
            class = "row",
            tags$div(
              class = "col-md-12",
              wp_box
            )
          ),
          wps,
          tags$div(
            class = "row",
            tags$div(
              class = "col-md-12",
              mu_box
            )
          ),
          muapps,
          tags$div(
            class = "row",
            tags$div(
              class = "col-md-12",
              anno_box
            )
          ),
          annots
        )
      ),
      add_javascript()
    )
  )
  doRenderTags(page)
}

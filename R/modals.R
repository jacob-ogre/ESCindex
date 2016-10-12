# BSD_2_clause

#' Create modals for index.html
#'
#' @return A \code{htmltools div} with modal elements
#' @import htmltools
#' @importFrom dplyr filter
#' @export
#' @examples
#' mods <- make_modals()
make_modals <- function() {
  base_mod <- function(i, dat) {
    tags$div(
      class = paste("modal fade", dat$Name[i]),
      tabindex="-1",
      role="dialog",
      `aria-labelledby` = "myModalLabel",
      tags$div(class = "modal-dialog modal-sm",
        tags$div(class = "modal-content",
          tags$div(
            class = "modal-header",
            tags$button(
              type = "button",
              class = "close",
              `data-dismiss` = "modal",
              `aria-label` = "Close",
              tags$span(`aria-hidden`="true", HTML("&times;"))
            ),
            tags$h4(
              class="modal-title",
              id="myModalLabel",
              dat$Title[i]
            )
          ),
          tags$div(
            class = "modal-body",
            HTML(dat$Content[i])
          )
        )
      )
    )
  }

  mod_dat <- dplyr::filter(index_data, Type == "modal")
  mods <- lapply(1:length(mod_dat$Type),
                 base_mod,
                 dat = mod_dat)
  modals <- tags$div(mods)
  return(modals)
}

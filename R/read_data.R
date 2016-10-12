# BSD_2_clause

#' Read the Google Sheet with index.html data
#'
#' @return A data_frame of the index.html data
#' @importFrom googlesheets gs_title gs_read
#' @export
get_GSheet <- function() {
  idx_pg <- gs_title("dev_index")
  idx_dat <- gs_read(idx_pg)
  return(idx_dat)
}

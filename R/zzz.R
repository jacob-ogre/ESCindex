# BSD_2_clause

.onAttach <- function(libname, pkgname) {
  cur_time <- Sys.time()
  cur_time <- lubridate::with_tz(cur_time, tzone = "GMT")
  res <- try(idx_pg <- gs_title("dev_index"))
  if(class(res)[1] == "try-error") {
    packageStartupMessage(
      "\nUnable to check for sheet updates; using installed data.\n"
    )
    data("index_data")
  } else {
    upd_time <- idx_pg$updated
    if(as.numeric(cur_time - upd_time) >= 15) {
      packageStartupMessage(
        "\nData hasn't been updated recently; using installed data. If you\n",
        "know there is updated data, use `index_data <- get_GSheet()` to update."
      )
      data("index_data")
    } else {
      packageStartupMessage(
        "\nFetching the Google Sheet that contains the data needed to generate\n",
        "index.html."
      )
      res <- try(idx_dat <- gs_read(idx_pg))
      if(class(res)[1] == "try-error") {
        packageStartupMessage(
          "\nUnable to get new data; using installed data.\n"
        )
        data("index_data")
      } else {
        packageStartupMessage(
          "\nData updated successfully!.\n"
        )
        devtools::use_data(index_data, overwrite = TRUE)
        data("index_data")
      }
    }
  }
}


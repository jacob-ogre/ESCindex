# BSD_2_clause

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "\nFetching the Google Sheet that contains the data needed to generate\n",
    "index.html."
  )
  index_data <- get_GSheet()
  devtools::use_data(index_data, overwrite = TRUE)
  data("index_data")
}


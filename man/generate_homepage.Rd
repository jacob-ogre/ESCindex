% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/homepage.R
\name{generate_homepage}
\alias{generate_homepage}
\title{Create the homepage for https://defend-esc-dev.org}
\usage{
generate_homepage()
}
\description{
The homepage for our development site contains many different components that
need to be updated frequently. To help manage those updates and keep
everything as simple as possible, this function generates the index.html
page given the content data in https://goo.gl/696ZA4. Simply update the data
there and it will appear in the new HTML file.
}
\examples{
home <- generate_homepage()
}


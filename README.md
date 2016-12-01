## ESCindex

An R package to generate the homepage for https://defend-esc-dev.org.

### Usage

To use this package, first install using `devtools`:

    devtools::install_github("jacob-ogre/ESCindex")
    
Now add any new apps, working papers, or documents for annotation in the Google 
Sheet at https://goo.gl/696ZA4. Note that this package works by processing the 
rows of the GSheet in order within `Type`. The easiest thing to do is copy a 
row from the GSheet, paste in the correct place (order-wise) in the sheet, and 
make edits.

Next, load the package and fetch the updated GSheet using:

    library(ESCindex)
    index_data <- get_GSheet()
    
And then generate the homepage file, index.html:

    idx <- generate_homepage()
    writeLines(idx, con = "../index.html")
    
Open the new index.html to check that it worked as intended. If everything is OK,
on the development server, `mv` the current index.html to index.html.bak, then
copy the new index.html to the server at `~/Repos/defend-esc-dev`. Refresh
https://defend-esc-dev.org, verify it worked, and be happy that you didn't have
to edit a big, ugly (in my opinion) HTML file!

### Problems?

Get in touch with [me](mailto:jmalcom@defenders.org).



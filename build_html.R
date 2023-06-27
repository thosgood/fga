#!/usr/bin/env Rscript

# bookdown::render_book("index.Rmd",
#                       "bookdown::gitbook",
#                       config_file = "_bookdown.yml")

bookdown::render_book("index.Rmd",
                      "bookdown:bs4_book",
                      config_file = "_bookdown.yml")

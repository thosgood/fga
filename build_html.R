#!/usr/bin/env Rscript

bookdown::render_book("index.Rmd",
                      "bookdown::gitbook",
                      config_file = "_bookdown.yml")

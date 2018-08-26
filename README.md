# stanchecker

stanchecker is an [RStudio addin](https://rstudio.github.io/rstudioaddins/) for checking the syntactic correctness of the Stan code living in your R Markdown documents. This replicates the `Check` button that RStudio provides for checking `.stan` files but provides the same checks for `.Rmd` files with [embedded Stan chunks](https://bookdown.org/yihui/rmarkdown/language-engines.html#stan).

## Installation

The stackchecker addin can be installed from [GitHub](https://github.com/brooklynbagel/stanchecker) with:

``` r
# install.packages("devtools")
devtools::install_github("brooklynbagel/stanchecker")
```

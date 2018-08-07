check_stan_syntax <- function() {
  ctx <- rstudioapi::getActiveDocumentContext()
  text <- rstudioapi::primary_selection(ctx)$text

  fp <- tempfile()
  writeLines(text, fp)

  tryCatch({
    rstan::stanc(fp)
    message("Selected Stan code is syntactically valid.")
  },
  error = function(e) message("Selected Stan code is not syntactically valid.")
  )

  unlink(fp)
}

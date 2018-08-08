check_stan_syntax <- function() {
  ctx <- rstudioapi::getSourceEditorContext()
  text <- rstudioapi::primary_selection(ctx)$text

  if (identical(text, "")) {
    line_num <- rstudioapi::primary_selection(ctx)$range[[1]][["row"]]

    chunk_begins <- grep("^```\\{stan .*\\}$", ctx$contents)
    chunk_begins <- max(chunk_begins[chunk_begins <= line_num])

    chunk_ends <- grep("^```$", ctx$contents)
    chunk_ends <- min(chunk_ends[chunk_ends >= line_num])

    text <- ctx$contents[(chunk_begins + 1L):(chunk_ends - 1L)]
  }

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

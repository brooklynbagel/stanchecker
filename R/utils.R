detect_code_chunks <- function(x) {
  chunk_begins <- stringr::str_which(x, knitr::all_patterns$md$chunk.begin)
  chunk_ends <- stringr::str_which(x, knitr::all_patterns$md$chunk.end)
  chunks <- lapply(chunk_begins, function(x) {
    list(begin = x, end = chunk_ends[x < chunk_ends][1])
  })
  chunks <- do.call(rbind.data.frame, chunks)
  rownames(chunks) <- NULL
  chunks
}

detect_stan_chunks <- function(x) {
  code_chunks <- detect_code_chunks(x)
  stan_chunks <- stringr::str_which(x[code_chunks$begin], "```\\{stan")
  stan_chunks <- code_chunks[stan_chunks, ]
  rownames(stan_chunks) <- NULL
  stan_chunks
}

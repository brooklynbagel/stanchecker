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

context("test-utils.R")

contents <- readLines("getting_started_ex.Rmd")

test_that("detect_code_chunks returns a data.frame", {
  expect_s3_class(detect_code_chunks(contents), "data.frame")
})

test_that("detect_code_chunks has columns begin and end", {
  expect_named(detect_code_chunks(contents), c("begin", "end"))
})

test_that("detect_code_chunks successfully detects all chunks in example file", {
  expected_chunks <- data.frame(
    begin = c(10, 16, 31, 59, 69, 79, 115),
    end = c(12, 19, 52, 63, 72, 81, 129)
  )
  code_chunks <- detect_code_chunks(contents)
  expect_equal(code_chunks, expected_chunks)
})

test_that("detect_stan_chunks returns a data.frame", {
  expect_s3_class(detect_stan_chunks(contents), "data.frame")
})

test_that("detect_stan_chunks has columns begin and end", {
  expect_named(detect_stan_chunks(contents), c("begin", "end"))
})

test_that("detect_stan_chunks detects all stan chunks in example file", {
  expected_chunks <- data.frame(begin = 31, end = 52)
  stan_chunks <- detect_stan_chunks(contents)
  expect_equal(stan_chunks, expected_chunks)
})

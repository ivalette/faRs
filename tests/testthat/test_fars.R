library(testthat)

context("Test 1: Verifying exceptions for the fars_read() function: ")
test_that("The function does not return expected file names",
{expect_equal(fars_read("test"), throws_error()})


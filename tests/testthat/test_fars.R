library(testthat)

context("Test 2: Verifying the naming convention for integer and lists: ")
test_that("The function does not return expected file names", 
          {expect_equal(make_filename(2013), "accident_2013.csv.bz2")})
                 
test_that("The function does not return expected file names for lists", 
          {expect_equal(make_filename(list(2013)), "accident_2013.csv.bz2")})
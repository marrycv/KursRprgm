
context("messy_swe_pop_handler()")

test_that("messy_swe_pop_handler()", {  
  
  library(dplyr)
  library(tidyr)

  expect_that(exists("messy_swe_pop_handler"), is_true(),
              info = "Fel: messy_swe_pop_handler() is missing")
  expect_that(messy_swe_pop_handler, is_a("function"),
              info = "Fel: apartment is not a function.")
  expect_equal(names(formals(messy_swe_pop_handler)), expected =  c("messy") ,
              info = "Fel: Funktionen ska ha argumenten rooms och m2.")

  
  test1 <- data.frame(region= c("00 Riket", "00 Riket", "00 Riket"),
                     civilstånd = c("ogifta", "ogifta", "ogifta"),
                     ålder = c("0 år", "1 år", "0 år"),
                     kön = c("män", "män", "kvinnor"),
                     `Folkmängd 1968` = c(56777, 62722, 62390),
                     `Folkmängd 1969` = c(55295, 59391, 61812))
  
  
  test2 <- data.frame(region= c("00 Riket", "01 Annat Lan", "01 Annat Lan"),
                     civilstånd = c("ogifta", "ogifta", "ogifta"),
                     ålder = c("0 år", "0 år", "0 år"),
                     kön = c("män", "män", "kvinnor"),
                     `Folkmängd 1968` = c(12992, 62722, 62390),
                     `Folkmängd 1969` = c(55295, 12231, 12312))
  
  expect_silent(messy_swe_pop_handler(test1))
  expect_silent(messy_swe_pop_handler(test2))
  
  res1 <- messy_swe_pop_handler(test1)
  res2 <- messy_swe_pop_handler(test2)

  expect_named(res1, c("region", "year", "age", "population"), ignore.order = TRUE)
  expect_named(res2, c("region", "year", "age", "population"), ignore.order = TRUE)

  expect_s3_class(res1, "tbl_df")
  expect_s3_class(res2, "tbl_df")
  
  expect_equal(res1$population, c(119167, 62722, 117107, 59391))
  expect_equal(res2$population, c(12992, 55295, 125112, 24543))
    
})

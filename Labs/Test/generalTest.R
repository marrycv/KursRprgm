### Assignment : generalTests ###

test_that("Kontroll av inlämningsfil.", {
  cat("File : ")
  expect_that(exists("Namn"), is_true(),
              info = "'Namn' saknas i filen.")
  expect_that(exists("LiuId"), is_true(),
              info = "'LiuId' saknas i filen.")
})

### Assignment structure ###

context("Lab file information:")

test_that("Mandatory objects", {
  expect_true(exists("Namn"))
  expect_true(exists("LiuId"))
  expect_is(Namn, "character")
  expect_is(LiuId, "character")
})


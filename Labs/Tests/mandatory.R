### Assignment structure ###

context("Labbinformation")

test_that("Obligatoriska object", {
  expect_true(exists("Namn"), info = "Variabeln 'Namn' saknas.")
  expect_true(exists("LiuId"), info = "Variabeln 'LiuId' saknas.")
  expect_is(Namn, "character", info = "Variabeln 'Namn' ska vara en textvariabel.")
  expect_true(nchar(Namn) > 0, info = "Ange ditt Namn.")
  expect_is(LiuId, "character", info = "Variabeln 'LiuId' ska vara en textvariabel.")
  expect_true(nchar(LiuId) > 0, info = "Ange ditt LiuId.")
})


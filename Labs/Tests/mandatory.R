### Assignment structure ###

context("Labbinformation")

test_that("Obligatoriska object", {
  expect_true(exists("Namn"), info = "Variabeln 'Namn' saknas.")
  expect_true(exists("LiuId"), info = "Variabeln 'LiuId' saknas.")
  expect_is(Namn, "character", info = "Variabeln 'Namn' ska vara en textvariabel.")
  expect_is(LiuId, "character", info = "Variabeln 'LiuId' ska vara en textvariabel.")
})

library(testthat)
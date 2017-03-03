### Assignment structure ###
 
context("Labbinformation")

test_that("Obligatoriska object", {
  expect_true(exists("Namn"), info = "Variabeln 'Namn' saknas.")
  expect_true(exists("LiuId"), info = "Variabeln 'LiuId' saknas.")
  expect_true(exists("Grupp"), info = "Variabeln 'Grupp' saknas.")
  
  expect_is(Namn, "character", info = "Variabeln 'Namn' ska vara en textvariabel.")
  expect_true(nchar(Namn[1]) > 0, info = "Ange era Namn.")
  
  expect_is(LiuId, "character", info = "Variabeln 'LiuId' ska vara en textvariabel.")
  expect_true(nchar(LiuId[1]) > 0, info = "Ange era LiuId.")
  
  expect_is(Grupp, "character", info = "Variabeln 'Grupp' ska vara en textvariabel.")
  expect_true(nchar(Grupp) > 0, info = "Ange er grupp. Tex grupp01 om ni tillhör grupp 01.")
  
})



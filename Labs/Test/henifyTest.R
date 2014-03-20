### Assignment : henify() ###
# rm(list=ls())
# library(testthat)
# source("/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/Solutions/LabSolutions_7.R",encoding="latin1")
#  
# source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D7/D7_Grupp5.R",encoding="latin1")
# source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D7/lab7_grupp11.R",encoding="latin1")

test_that("Assignment: henify()", {
  
  # ladda in test-data:
  load(file="/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/SolutionData/henifyTestData.Rdata")
  
  # Övergripande om funktionen:
  
  expect_that(henify, is_a("function"),
              info = "Fel: henify är inte en funktion.")
  expect_that(all(names(formals(henify)) %in% c("FileName")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
  expect_that(henify(FileName=henifyOptions1$text), is_a("character"),
              info = "Fel: Funktionen returnerar inte en character-vektor")
 

  # testfall:

  # Testar på en nonsenstext:
  expect_equal(henify(FileName=henifyOptions1$text),henifyResult1,
               info =henifyError1)
  
  
  # Testfall 1 i labben:
  setwd("/home/joswi05/Dropbox/Rkurs/KursRprgm/Labs/DataFiles")
  expect_equal(henify(FileName=henifyOptions2$text),henifyResult2,
               info =henifyError2)

  # Testfall 2 i labben:
  expect_equal(henify(FileName=henifyOptions3$text),henifyResult3,
               info =henifyError3)

  
})

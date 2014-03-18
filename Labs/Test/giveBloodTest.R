### Assignment : giveBlood() ###
# rm(list=ls())
# library(testthat)
# 
# source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D6/lab6_grupp11.R",encoding="latin1")
# source("/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/Solutions/LabSolutions_6.R",encoding="latin1")

test_that("Assignment: giveBlood()", {
  
  # ladda in test-data:
  load(file="/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/SolutionData/testGiveBlood.Rdata")
    
  # övergripande om funktionen:
  expect_that(giveBlood, is_a("function"),
              info = "Fel: giveBlood är inte en funktion.")
  expect_that(all(names(formals(giveBlood)) %in% c("lasttime","holiday","sex","typeOfTravel")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
  expect_that(do.call(what=giveBlood,args=bloodOptions1Female), is_a("character"),
              info = "Fel: Funktionen returnerar inte en text-sträng")
  
  # testfall:
  
  # testfall 1:
  expect_equal(do.call(giveBlood,bloodOptions1Male),resBlood1Male,
               info = errorInfo(parameters=bloodOptions1Male,funcName="giveBlood"))
  expect_equal(do.call(giveBlood,bloodOptions1Female),resBlood1Female,
               info = errorInfo(parameters=bloodOptions1Female,funcName="giveBlood"))
  
  # testfall 2:
  expect_equal(do.call(giveBlood,bloodOptions2Male),resBlood2Male,
               info = errorInfo(parameters=bloodOptions2Male,funcName="giveBlood"))
  expect_equal(do.call(giveBlood,bloodOptions2Female),resBlood2Female,
               info = errorInfo(parameters=bloodOptions2Female,funcName="giveBlood"))
  
  # testfall 4:
  expect_equal(do.call(giveBlood,bloodOptions3Male),resBlood3Male,
               info = errorInfo(parameters=bloodOptions3Male,funcName="giveBlood"))
  expect_equal(do.call(giveBlood,bloodOptions3Female),resBlood3Female,
               info = errorInfo(parameters=bloodOptions3Female,funcName="giveBlood"))
    
})

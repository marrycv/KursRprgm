### Assignment : myGroupedTest() ###
rm(list=ls())
library(testthat)
source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D6/emmajosef6_grupp14.R")

test_that("Assignment: myGroupedTest()", {
  
  # ladda in test-data:
  load(file="/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/SolutionData/groupedKI.Rdata")
  KIoptions1
  
  # övergripande om funktionen:
  expect_that(myGroupedTest, is_a("function"),
              info = "Fel: myStatsFunc är inte en funktion.")
  expect_that(all(names(formals(myGroupedTest)) %in% c("dataVector","myGroups","alpha")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
  expect_that(myGroupedTest(dataVector=KIoptions1$dataVector,myGroups=KIoptions1$myGroups,alpha=KIoptions1$alpha), is_a("matrix"),
              info = "Fel: Funktionen returnerar inte en matris")
  
    
  
  # testa olika värden på argumenten
  
  # Test 1 - ingen resa och ingen malaria
  expect_equal(myStatsFunc(myDataSet=optionsTest1$dataSet,
                           numericFunc=optionsTest1$numericFunc,categoricFunc=optionsTest1$categoricFunc),testOutput1,
               info = errorKI1)
  
  
  # Test 2 -  resa och malaria
  expect_equal(myStatsFunc(myDataSet=optionsTest2$dataSet,
                           numericFunc=optionsTest2$numericFunc,categoricFunc=optionsTest2$categoricFunc),testOutput2,
               info = errorKI2)
  
  
  # 3: Test 2 -  resa och ingen malaria
  expect_equal(myStatsFunc(myDataSet=optionsTest3$dataSet,
                           numericFunc=optionsTest3$numericFunc,categoricFunc=optionsTest3$categoricFunc),testOutput3,
               info = errorKI3)
  
  
  
})


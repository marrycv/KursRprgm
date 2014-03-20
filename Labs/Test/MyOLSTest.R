### Assignment : MyOLS() ###
rm(list=ls())
library(testthat)
source("/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/Solutions/LabSolutions_7.R",encoding="latin1")
source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D7/D7_Grupp5.R",encoding="latin1")
source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D7/lab7_grupp11.R",encoding="latin1")

test_that("Assignment: MyOLS()", {
  
  
  # ladda in test-data:
  load(file="/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/SolutionData/OLStestData.Rdata")
  
  # Övergripande om funktionen:
  expect_that(MyOLS, is_a("function"),
              info = "Fel: MyOLS är inte en funktion.")
  expect_that(all(names(formals(MyOLS)) %in% c("X","y")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
  expect_that(do.call(what=MyOLS,args=OLSoptions1), is_a("list"),
              info = "Fel: Funktionen returnerar inte en lista")
  
  # testfall:
  
  # testfall 1: två x variabler:
  expect_equal(do.call(MyOLS,OLSoptions1),OLSresult1,
               info =OLSerror1)
  
  # testfall 2: google data:
  expect_equal(do.call(MyOLS,OLSoptions2),OLSresult2,
               info =OLSerror2)
  
  # testfall 3: en x variabel:
  expect_equal(do.call(MyOLS,OLSoptions3),OLSresult3,
               info =OLSerror3)
  
  # testfall 4: t(X)X ej inverterbar:
  expect_equal(do.call(MyOLS,OLSoptions4),OLSresult4,
               info =OLSerror4)
  
})

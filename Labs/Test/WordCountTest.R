### Assignment : WordCount() ###
# rm(list=ls())
# library(testthat)
# source("/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/Solutions/LabSolutions_7.R",encoding="latin1")
#  
# source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D7/D7_Grupp5.R",encoding="latin1")
# source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D7/lab7_grupp11.R",encoding="latin1")

test_that("Assignment: WordCount()", {
  
  # ladda in test-data:
  load(file="/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/SolutionData/countTestData.Rdata")
  
  # Övergripande om funktionen:
  
  expect_that(WordCount, is_a("function"),
              info = "Fel: WordCount är inte en funktion.")
  expect_that(all(names(formals(WordCount)) %in% c("text")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
  expect_that(WordCount(text=countOptions1$text), is_a("data.frame"),
              info = "Fel: Funktionen returnerar inte en data.frame")
  
  # testfall:
  
  # Testar på en nonsenstext:
  expect_equal(WordCount(text=countOptions1$text),countResult1,
               info =countError1)
  expect_output(WordCount(text=countOptions1$text),regexp=countResultText1,
                info=countErrorText1)
  
  
  # Testfall 1 i labben:
  expect_equal(WordCount(text=countOptions2$text),countResult2,
               info =countError2)
  expect_output(WordCount(text=countOptions2$text),regexp=countResultText2,
                info=countErrorText2)
  
  # Testfall 2 i labben:
  expect_equal(WordCount(text=countOptions3$text),countResult3,
               info =countError3)
  expect_output(WordCount(text=countOptions3$text),regexp=countResultText3,
                info=countErrorText3)
  
  
})

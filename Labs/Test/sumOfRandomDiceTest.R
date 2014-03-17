### Assignment : sumOfRandomDice() ###
# rm(list=ls())
# library(testthat)
# source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D6/emmajosef6_grupp14.R")
# source("/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/Solutions/LabSolutions_6.R")

test_that("Assignment: sumOfRandomDice()", {
  
  # ladda in test-data:
  load(file="/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/SolutionData/randomDice.Rdata")
  
  # övergripande om funktionen:
  expect_that(sumOfRandomDice, is_a("function"),
              info = "Fel: sumOfRandomDice är inte en funktion.")
  expect_that(all(names(formals(sumOfRandomDice)) %in% c("K","lambda","mySeed")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
  expect_that(sumOfRandomDice(K=diceOptions1$K,lambda=diceOptions1$lambda,mySeed=diceOptions1$mySeed), is_a("matrix"),
              info = "Fel: Funktionen returnerar inte en matris")
  
  
  
#   # testa olika värden på argumenten
#   diceOptions1<-list(K=5,lambda=3,mySeed=123)
#   diceResult1<-sumOfRandomDice(K=diceOptions1$K,lambda=diceOptions1$lambda,mySeed=diceOptions1$mySeed)
#   
#   # testfall 1:
#   diceOptions2<-list(K=5,lambda=8,mySeed=543)
#   diceResult2<-sumOfRandomDice(K=diceOptions2$K,lambda=diceOptions2$lambda,mySeed=diceOptions2$mySeed)
#   
#   # testfall 4:
#   diceOptions4<-list(K=100,lambda=10,mySeed=723)
#   diceResult4<-sumOfRandomDice(K=diceOptions4$K,lambda=diceOptions4$lambda,mySeed=diceOptions4$mySeed)
  
  
  
  # testfall 1:
  expect_equal(sumOfRandomDice(K=diceOptions1$K,lambda=diceOptions1$lambda,mySeed=diceOptions1$mySeed),diceResult1,
               info = errorInfo(parameters=diceOptions1,funcName="sumOfRandomDice"))
  
  
  # testfall 2:
  expect_equal(sumOfRandomDice(K=diceOptions2$K,lambda=diceOptions2$lambda,mySeed=diceOptions2$mySeed),diceResult2,
               info =  errorInfo(parameters=diceOptions2,funcName="sumOfRandomDice"))
  
  
  # testfall 4:
  expect_equal(sumOfRandomDice(K=diceOptions4$K,lambda=diceOptions4$lambda,mySeed=diceOptions4$mySeed),diceResult4,
               info =  errorInfo(parameters=diceOptions4,funcName="sumOfRandomDice"))
  
  
  
})

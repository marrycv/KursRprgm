### Assignment : sumOfRandomDice() ###
rm(list=ls())
library(testthat)
source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D6/emmajosef6_grupp14.R")
source("/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/Solutions/LabSolutions_6.R")

test_that("Assignment: sumOfRandomDice()", {
  
  # ladda in test-data:
  load(file="/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/SolutionData/testGiveBlood.Rdata")
  
  giveBlood(bloodOptions1Female)
  do.call(what=giveBlood,args=bloodOptions1Female)
  
  # övergripande om funktionen:
  expect_that(giveBlood, is_a("function"),
              info = "Fel: giveBlood är inte en funktion.")
  expect_that(all(names(formals(giveBlood)) %in% c("lasttime","holiday","sex","typeOfTravel")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
  expect_that(do.call(what=giveBlood,args=bloodOptions1Female), is_a("character"),
              info = "Fel: Funktionen returnerar inte en text-sträng")
  
  # testfall:
  
  # test 1 male
  day1<-ymd("2014-02-24") 
  bloodOptions1Male<-list(lasttime=day1,holiday="hemma",sex="m",typeOfTravel=NULL)
  bloodOptions1Female<-list(lasttime=day1,holiday="hemma",sex="f",typeOfTravel=NULL)
  
  resBlood1Male<-giveBlood(lasttime=bloodOptions1Male$lasttime,holiday=bloodOptions1Male$holiday,sex=bloodOptions1Male$sex,typeOfTravel=bloodOptions1Male$typeOfTravel)
  resBlood1Female<-giveBlood(lasttime=bloodOptions1Female$lasttime,holiday=bloodOptions1Female$holiday,sex=bloodOptions1Female$sex,typeOfTravel=bloodOptions1Female$typeOfTravel)
  
  
  # test 2 male:
  day2<-ymd("2014-03-23")
  day3<-ymd("2014-04-24")
  holiday1<-new_interval(day2,day3)
  bloodOptions2Male<-list(lasttime=day1,holiday=holiday1,sex="m",typeOfTravel="malaria")
  bloodOptions2Female<-list(lasttime=day1,holiday=holiday1,sex="f",typeOfTravel="malaria")
  
  resBlood2Male<-giveBlood(lasttime=bloodOptions2Male$lasttime,holiday=bloodOptions2Male$holiday,sex=bloodOptions2Male$sex,typeOfTravel=bloodOptions2Male$typeOfTravel)
  resBlood2Female<-giveBlood(lasttime=bloodOptions2Female$lasttime,holiday=bloodOptions2Female$holiday,sex=bloodOptions2Female$sex,typeOfTravel=bloodOptions2Female$typeOfTravel)
  
  
  # test 3 male:
  day4<-ymd("2014-04-13")
  day5<-ymd("2014-05-23")
  holiday2<-new_interval(day4,day5)
  bloodOptions3Male<-list(lasttime=day1,holiday=holiday2,sex="m",typeOfTravel="other")
  bloodOptions3Female<-list(lasttime=day1,holiday=holiday2,sex="f",typeOfTravel="other")
  
  resBlood3Male<-giveBlood(lasttime=bloodOptions3Male$lasttime,holiday=bloodOptions3Male$holiday,sex=bloodOptions3Male$sex,typeOfTravel=bloodOptions3Male$typeOfTravel)
  resBlood3Female<-giveBlood(lasttime=bloodOptions3Female$lasttime,holiday=bloodOptions3Female$holiday,sex=bloodOptions3Female$sex,typeOfTravel=bloodOptions3Female$typeOfTravel)
  
  
  
  
  
  
  
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

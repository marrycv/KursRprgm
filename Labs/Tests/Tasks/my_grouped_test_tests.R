### Assignment : myGroupedTest() ###
# rm(list=ls())
# library(testthat)
# source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D6/emmajosef6_grupp14.R")
# source("/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/Solutions/LabSolutions_6.R")

test_that("Assignment: myGroupedTest()", {
  
  # ladda in test-data:
  load(file="/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/SolutionData/groupedKI.Rdata")
    
  # övergripande om funktionen:
  expect_that(myGroupedTest, is_a("function"),
              info = "Fel: myGroupedTest är inte en funktion.")
  expect_that(all(names(formals(myGroupedTest)) %in% c("dataVector","myGroups","alpha")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
  expect_that(myGroupedTest(dataVector=KIoptions1$dataVector,myGroups=KIoptions1$myGroups,alpha=KIoptions1$alpha), is_a("matrix"),
              info = "Fel: Funktionen returnerar inte en matris")
  
    
  
  # testa olika värden på argumenten
  # testfall 1:
#   KIoptions1<-list(dataVector=InsectSprays$count,myGroups=InsectSprays$spray,alpha=0.10)
#   KIresult1<-myGroupedTest(dataVector=KIoptions1$dataVector,myGroups=KIoptions1$myGroups,alpha=KIoptions1$alpha)
#   
#   # testfall 2:
#   KIoptions2<-list(dataVector=chickwts$weight,myGroups=chickwts$feed,alpha=0.05)
#   KIresult2<-myGroupedTest(dataVector=KIoptions2$dataVector,myGroups=KIoptions2$myGroups,alpha=KIoptions2$alpha)
#   
#   # testfall 3:
#   KIoptions3<-list(dataVector=PlantGrowth$weight,myGroups=PlantGrowth$group,alpha=0.01)
#   KIresult3<-myGroupedTest(dataVector=KIoptions3$dataVector,myGroups=KIoptions3$myGroups,alpha=KIoptions3$alpha)
  
  
  # Test 1 - InsectSprays data
  expect_equal(myGroupedTest(dataVector=KIoptions1$dataVector,myGroups=KIoptions1$myGroups,alpha=KIoptions1$alpha),KIresult1,
               info = errorKI1)
  
  
  # Test 2 -  chickwts data
  expect_equal(myGroupedTest(dataVector=KIoptions2$dataVector,myGroups=KIoptions2$myGroups,alpha=KIoptions2$alpha),KIresult2,
               info = errorKI2)
  
  
  # 3: Test 2 -  PlantGrowth data
  expect_equal(myGroupedTest(dataVector=KIoptions3$dataVector,myGroups=KIoptions3$myGroups,alpha=KIoptions3$alpha),KIresult3,
               info = errorKI3)
  
  
  
})


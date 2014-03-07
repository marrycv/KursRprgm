### Assignment : myStatsFunc() ###
rm(list=ls())
library(testthat)
source("/home/joswi05/Dropbox/Josef/732G33 josef/labbar/från  labbass/test_student.R")

test_that("Assignment: myStatsFunc()", {
  x1<-c(1,3,56,3) 
  x2<-c("a","b","a","c")
  x3<-rep(TRUE,4)
  x4<-2:5
  x5<-rep(FALSE,4)
  x6<-c("a","a","c","b")
  test4<-data.frame(x1,x2,x3,x4,x5,x6) # både numeric och character
  
  # ladda ner fil:
  oldWD<-getwd()
  setwd(tempdir())
  testFile <- tempfile(pattern="TestFile", fileext=".csv")
  download.file(url="https://raw.github.com/MansMeg/KursRprgm/master/Demonstrations/Apple.csv", 
                destfile=testFile, method="curl", quiet=TRUE)
  read.csv2(file="https://raw.github.com/MansMeg/KursRprgm/master/Demonstrations/Apple.csv")
  
  testApple <- tempfile(pattern="TestApple", fileext=".csv")
  download.file(url="https://raw.github.com/MansMeg/KursRprgm/master/Labs/DataFiles/AppleLabb5.csv", 
                destfile=testApple, method="curl", quiet=TRUE)
  
  expect_that(orderMyData, is_a("function"),
              info = "Fel: orderMyData är inte en funktion.")
  expect_that(all(names(formals(orderMyData)) %in% c("myData")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(orderMyData(myData=test4), is_a("list"),
              info = "Fel: Funktionen returnerar inte en lista.")
  
  expect_that(length(orderMyData(myData=test1)), is_equivalent_to(expected=2),
              info = "Listan har inte två element")
  
  # testa innehåll:
  numData<-data.frame(x1,x1,x4,x4)
  expect_equal(orderMyData(myData=test1)[[1]],numData,info = "Kan inte välja ut numeriska variabler")
  
  charData<-data.frame(x2,x6)
  expect_equal(orderMyData(myData=test2)[[2]],charData, info = "Kan inte välja ut character/factor variabler")
  
})





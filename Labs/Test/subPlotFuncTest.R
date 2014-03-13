### Assignment : subPlotFunc() ###
# rm(list=ls())
# library(testthat)
# source("/home/joswi05/Dropbox/Josef/732G33 josef/labbar/från  labbass/test_student.R")

test_that("Assignment: myStatsFunc()", {
  

  
  oldWD<-getwd()
  # workning dic i temp.mappen
  setwd(tempdir())
  
  #testFile <- tempfile(pattern="TestFile", fileext=".csv")
  
  # download.file(url="https://raw.github.com/MansMeg/KursRprgm/master/Demonstrations/Apple.csv", 
  #             destfile=testFile, method="curl", quiet=TRUE)
  
  
  # ladda ner fil:
  testApple <- tempfile(pattern="TestApple", fileext=".csv")
  download.file(url="https://raw.github.com/MansMeg/KursRprgm/master/Labs/DataFiles/AppleLabb5.csv", 
                destfile=testApple, method="curl", quiet=TRUE)
  apple<-read.csv2(file=testApple) # läsa in  
  
  # övergripande om funktionen:
  expect_that(myStatsFunc, is_a("function"),
              info = "Fel: myStatsFunc är inte en funktion.")
  expect_that(all(names(formals(myStatsFunc)) %in% c("myDataSet","numericFunc","categoricFunc")), condition=is_true(),
              info = "Fel: Namn på argumenten i funktionen är fel.")
  expect_that(myStatsFunc(myDataSet=test4,numericFunc=mean,categoricFunc=sort), is_a("list"),
              info = "Fel: Funktionen returnerar inte en lista.")
  
  # testa de 5 fallen:
  # workning dic i temp.mappen
  #   setwd(tempdir())
  #   statFuncData <- tempfile(pattern="statFuncData", fileext=".Rdata")
  #   download.file(url="https://github.com/MansMeg/KursRprgmTeacher/tree/master/Labs/SolutionData/testDataLab5.Rdata", 
  #              destfile=statFuncData, method="curl", quiet=TRUE)
  #   load(file=statFuncData)
  #   readLines(con=statFuncData)
  # Läs in tesdata:
  load(file="/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/SolutionData/testDataLab5.Rdata")   
  
  
  # 1: inga variabler
  expect_equal(myStatsFunc(myDataSet=optionsTest1$dataSet,
                           numericFunc=optionsTest1$numericFunc,categoricFunc=optionsTest1$categoricFunc),testOutput1,
               info = "Klarar inte av fallet med varken numeric eller character variabler.")
  # 2: bara numeriska variabler
  expect_equal(myStatsFunc(myDataSet=optionsTest2$dataSet,
                           numericFunc=optionsTest2$numericFunc,categoricFunc=optionsTest2$categoricFunc),testOutput2,
               info = "Klarar inte av fallet med bara numeriska variabler")
  # 3: bara character variabler
  expect_equal(myStatsFunc(myDataSet=optionsTest3$dataSet,
                           numericFunc=optionsTest3$numericFunc,categoricFunc=optionsTest3$categoricFunc),testOutput3,
               info = "Klarar inte av fallet med bara character/factor variabler")
  # 4: Både numeric och character
  expect_equal(myStatsFunc(myDataSet=optionsTest4$dataSet,
                           numericFunc=optionsTest4$numericFunc,categoricFunc=optionsTest4$categoricFunc),testOutput4,
               info = "Klarar inte av fallet med flera numeric variabler och flera character/factor variabler")
  
  # 5: Bara en numeric och och en character
  expect_equal(myStatsFunc(myDataSet=optionsTest5$dataSet,
                           numericFunc=optionsTest5$numericFunc,categoricFunc=optionsTest5$categoricFunc),testOutput5,
               info = "Klarar inte av fallet med en numeric variabel och en character/factor variabel") 
  setwd(oldWD)
})


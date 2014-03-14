### Assignment : subPlotFunc() ###
# rm(list=ls())
# library(testthat)
# source("/home/joswi05/Dropbox/Josef/732G33 josef/labbar/från  labbass/test_student.R")

test_that("Assignment: subPlotFunc()", {

  expect_that(subPlotFunc, is_a("function"),
              info = "Fel: subPlotFunc är inte en funktion.")
  
  expect_that(all(names(formals(subPlotFunc)) %in% c("myData","rowLength","colLength","myOrder")), condition=is_true(),
              info = "Fel: Namn på argumenten i funktionen är fel.")


  load(file="/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/SolutionData/testDataLab5Plot.Rdata")   
  source("/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/Solutions/testImageAsMatrix.R")
  
#   if(exists(x="sinkToDir",inherits=TRUE)){
#     print("hittar sinkToDir")
#   } else{
#     print("hittar inte sinkToDir")
#   }
  
#   reltativ skillnad i expect_equal()  
#   tolerance = 0.002,
#   scale = expectedValue
  
  # 1:  3 rader och 1 kolumner
  studentPlot1<-createMatrixFromPlot(plotCode=subPlotFunc,myData=plotOptions1$myData,rowLength=plotOptions1$rowLength,
                                   colLength=plotOptions1$colLength,myOrder=plotOptions1$myOrder)
  resTest1<-compareImages(imageOrginal=testPlot1,imageStudent=studentPlot1)
  
  
  textError<-paste("Klarar inte test 1 (se labbinstruktionen). Bilden är ",(round(resTest1$relativeError,4)*100)," % korrekt.")
  expect_true(object=resTest1$relativeError>0.999,info="textError")
  
#   expect_equal(studentPlot1,testPlot1,
#              info = "Klarar inte test 1 (se labbinstruktionen).")
#   image(abs(studentPlot1-testPlot1))

  # 2:  testar att med icke konsistenta argument
#   test2String<-"Argumenten funkar ej tillsammans"
#   #prints_text(regexp=test2String,subPlotFunc(myData=plotOptions1$myData,rowLength=3,colLength=1,myOrder=1:8))
#   expect_output(subPlotFunc(myData=plotOptions1$myData,rowLength=3,colLength=1,myOrder=1:8),regexp=test2String,
#                 info="Klarar inte test 2 (se labbinstruktionen). Rätt text skrivs inte ut till konsolen.")
# 
# 
#   # 3:  1 rader och 3 kolumner
#   studentPlot3<-createMatrixFromPlot(plotCode=subPlotFunc,myData=plotOptions3$myData,rowLength=plotOptions3$rowLength,
#                                    colLength=plotOptions3$colLength,myOrder=plotOptions3$myOrder)
#   expect_equal(studentPlot3,testPlot3,
#              info = "Klarar inte test 3 (se labbinstruktionen).")
# 
#   # 4:  2 rader och 3 kolumner
#   studentPlot4<-createMatrixFromPlot(plotCode=subPlotFunc,myData=plotOptions4$myData,rowLength=plotOptions4$rowLength,
#                                    colLength=plotOptions4$colLength,myOrder=plotOptions4$myOrder)
#   expect_equal(studentPlot3,testPlot3,
#              info = "Klarar inte test 4 (se labbinstruktionen).")

  }
)


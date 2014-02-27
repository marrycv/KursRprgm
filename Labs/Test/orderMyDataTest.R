### Assignment : orderMyData() ###

test_that("Assignment: orderMyData()", {
  x1<-c(1,3,56,3) 
  x2<-c("a","b","a","c")
  x3<-rep(TRUE,4)
  x4<-2:5
  x5<-rep(FALSE,4)
  x6<-c("a","a","c","b")
  test1<-data.frame(x1,x1,x3,x4,x4,x3) # skilja ut bara numeric
  test2<-data.frame(x2,x3,x4,x5,x6) # skilja ut bara character
  test3<-data.frame(x1,x2,x3,x4,x5,x6) # både numeric och character
  print(GruppNr)
  expect_that(orderMyData, is_a("function"),
              info = "Fel: orderMyData är inte en funktion.")
  expect_that(all(names(formals(orderMyData)) %in% c("myData")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(orderMyData(myData=test3), is_a("list"),
              info = "Fel: Funktionen returnerar inte en lista.")
  
  expect_that(length(orderMyData(myData=test1)), is_equivalent_to(expected=2),
              info = "Listan har inte två element")
  
  # testa innehåll:
  numData<-data.frame(x1,x1,x4,x4)
  expect_equal(orderMyData(myData=test1)[[1]],numData,info = "Kan inte hantera dataset där bara numeric variabler ska väljas")
  
  charData<-data.frame(x2,x6)
  expect_equal(orderMyData(myData=test2)[[2]],charData, info = "Kan inte hantera dataset där character ska väljas")
  numData2<-data.frame(x1,x4)
  charData2<-data.frame(x2,x6)
  testList<-list(numData2,charData2)
  expect_equal(orderMyData(myData=test3),testList, info = "Kan inte hantera dataset där både character och numeric variabler ska väljas")
  
})






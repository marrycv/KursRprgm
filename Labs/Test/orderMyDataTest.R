### Assignment : orderMyData() ###

test_that("Assignment: orderMyData()", {
  x1<-c(1,3,56,3) 
  x2<-c("a","b","a","c")
  x3<-rep(TRUE,4)
  x4<-2:5
  x5<-rep(FALSE,4)
  x6<-c("a","a","c","b")
  test1<-data.frame(x1,x2,x3,x4,x5,x6)
  
  expect_that(orderMyData, is_a("function"),
              info = "Fel: orderMyData är inte en funktion.")
  expect_that(all(names(formals(orderMyData)) %in% c("myData")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(orderMyData(myData=test1), is_a("list"),
              info = "Fel: Funktionen returnerar inte en lista.")
})


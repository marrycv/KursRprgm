context("moment_func()")

test_that("moment_func()", {
  x<-1:10
  px<-rep(1/10,10)
  x_mat<-cbind(x,px)
  y<-1:3
  py<-c(0.2,0.7,0.1)
  y_mat<-cbind(y,py)
  z<-seq(1,by = 3,length=5)
  pz<- c(0.1,0.2,0.3,0.2,0.2)
  z_mat<-cbind(z,pz)
  
  test1<-list(density_matrix=x_mat)
  test2<-list(density_matrix=y_mat)
  test3<-list(density_matrix=z_mat)
  
  test4<-list(density_matrix=x_mat,trans=c(4,2))
  test5<-list(density_matrix=y_mat,trans=c(3,0))
  
  test_list1<-list(test1)
  test_list2<-list(test1,test2)
  test_list3<-list(test1,test2,test3)
  test_list4<-list(test1,test4,test5)
  
  expect_that(exists("moment_func"), is_true(),
              info = "Fel: moment_func() saknas.")
  expect_that(moment_func, is_a("function"),
              info = "Fel: moment_func är inte en funktion.")
  expect_self_contained(object = moment_func,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(moment_func)) %in% c("densities", "moment")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_function_code(object = moment_func, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")
  
  expect_error(moment_func(densities = TRUE,moment = E_discrete),
               info = "Fel: Funktionen stoppar inte när densities är något annat än en lista.")  
  
  expect_error(moment_func(densities = TRUE,moment = E_discrete), "densities is not a list!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande då densities är något annat än en lista.")  
  
  
  expect_error(moment_func(densities = test_list1,moment = 1:10),
               info = "Fel: Funktionen stoppar inte när moment inte är en funktion")  
  
  expect_error(moment_func(densities = test_list1,moment = 1:10), "No function supplied!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande då moment inte är en funktion")  
  
  
  expect_error(moment_func(density_matrix = cbind(y,c(0.4,0.6,0.8))),
               info = "Fel: Funktionenen stoppar inte när sannolikheterna inte summerar till 1.")  
  
  expect_error(moment_func(density_matrix = cbind(y,c(0.4,0.6,0.8))), "Probabilities do not sum to 1!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande när sannolikheterna inte summerar till 1.") 
  
  
  expect_that(class(moment_func()), 
              is_equivalent_to("numeric"),
              info="Fel: Funktionen returnerar inte en numerisk vector")
  
  expect_equal(length(moment_func(density_matrix = x_mat)), c(1),
               info="Fel: Funktionen returnerar inte en vektor av längd 1")
  
  expect_equal(moment_func(),c(0),
               info="Fel: funktionen returnerar inte rätt värde vid moment_func()")
  
  expect_equal(moment_func(trans=c(2,0)),c(0),
               info="Fel: funktionen returnerar inte rätt värde vid moment_func(trans=c(2,0))")
  
  expect_equal(moment_func(trans=c(2,4)),c(0),
               info="Fel: funktionen returnerar inte rätt värde vid moment_func(trans=c(2,4))")
  
  expect_equal(moment_func(density_matrix = x_mat),c(8.25),
               info="Fel: funktionen returnerar inte rätt värde vid moment_func(density_matrix = x_mat)")
  
  expect_equal(moment_func(density_matrix = y_mat),c(0.29),
               info="Fel: funktionen returnerar inte rätt värde vid moment_func(density_matrix = y_mat)")
  
  expect_equal(moment_func(density_matrix = y_mat,trans = c(4,0)),c(4.64),
               info="Fel: funktionen returnerar inte rätt värde med density_matrix = y_mat,trans = c(4,0)t")
  
  expect_equal(moment_func(density_matrix = y_mat,trans = c(1,5)),c(0.29),
               info="Fel: funktionen returnerar inte rätt värde med density_matrix = y_mat,trans = c(1,5)")
  
  expect_equal(moment_func(density_matrix = y_mat,trans = c(0,5)),c(0),
               info="Fel: funktionen returnerar inte rätt värde med density_matrix = y_mat,trans = c(0,5)")
  
  
})
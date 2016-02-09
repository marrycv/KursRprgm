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
  
  
  
  expect_that(class(moment_func()), 
              is_equivalent_to("list"),
              info="Fel: Funktionen returnerar inte en lista")
  
  expect_equal(length(moment_func(densities = test_list3,moment = E_discrete)), c(3),
               info="Fel: Funktionen returnerar inte en lista med rätt längd då densities = test_list3,moment = E_discrete")
  
  
  expect_equal(moment_func(densities = test_list1,moment = E_discrete),list(density1=5.5),
               info="Fel: funktionen returnerar inte rätt värde vid densities = test_list1,moment = E_discrete")
  
  expect_equal(moment_func(densities = test_list2,moment = V_discrete),list(density1=8.25,density2=0.29),
               info="Fel: funktionen returnerar inte rätt värde vid densities = test_list2,moment = V_discrete")
  
  expect_equal(moment_func(densities = test_list3,moment = E_discrete),list(density1=5.5,density2=1.9,density3=7.6),
               info="Fel: funktionen returnerar inte rätt värde vid densities = test_list3,moment = E_discrete")
  
  expect_equal(moment_func(densities = test_list4,moment = E_discrete),list(density1=5.5,density2=24,density3=5.7),
               info="Fel: funktionen returnerar inte rätt värde vid densities = test_list4,moment = E_discrete")
  
  expect_equal(moment_func(densities = test_list4,moment = V_discrete),list(density1=8.25,density2=132,density3=2.61),
               info="Fel: funktionen returnerar inte rätt värde med densities = test_list4,moment = V_discrete")
  

  
})
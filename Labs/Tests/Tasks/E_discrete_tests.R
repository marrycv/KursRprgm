context("E_discrete()")

test_that("E_discrete()", {
  x<-1:10
  px<-rep(1/10,10)
  x_mat<-cbind(x,px)
  
  y<-1:3
  py<-c(0.2,0.7,0.1)
  y_mat<-cbind(y,py)
  z<-1
  
  expect_that(exists("E_discrete"), is_true(),
              info = "Fel: E_discrete() saknas.")
  expect_that(E_discrete, is_a("function"),
              info = "Fel: E_discrete är inte en funktion.")
  expect_self_contained(object = E_discrete,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(E_discrete)) %in% c("density_matrix", "trans")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_function_code(object = E_discrete, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")
  
  expect_error(E_discrete(density_matrix = matrix("hej")),
               info = "Fel: Funktionen stoppar inte när density_matrix är icke numerisk.")  
  
  expect_error(E_discrete(density_matrix = matrix("hej")), "density_matrix is not numeric!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande då density_matrix är icke numerisk.")  
 
  
  expect_error(E_discrete(trans = matrix("hej")),
               info = "Fel: Funktionenen stoppar inte när trans är icke numerisk.")  
  
  expect_error(E_discrete(trans = matrix("hej")), "trans is not numeric!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande då trans är icke numerisk.")  
  
  
  expect_error(E_discrete(density_matrix = cbind(y,c(0.4,0.6,0.8))),
               info = "Fel: Funktionenen stoppar inte när sannolikheterna inte summerar till 1.")  
  
  expect_error(E_discrete(density_matrix = cbind(y,c(0.4,0.6,0.8))), "Probabilities do not sum to 1!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande när sannolikheterna inte summerar till 1.") 
  
  
  expect_error(E_discrete(trans = c(1,2,3)),
               info = "Fel: Funktionenen stoppar inte när trans inte har längd 2.")  
  
  expect_error(E_discrete(trans = c(1,2,3)), "trans has not length 2!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande när när trans inte har längd 2.")
  
  
  expect_that(class(E_discrete()), 
              is_equivalent_to("numeric"),
              info="Fel: Funktionen returnerar inte en numerisk vector")
  
  expect_equal(E_discrete(),c(1),
               info="Fel: funktionen returnerar inte rätt värde vid E_discrete()")
  
  expect_equal(E_discrete(trans = c(2,0)),c(2),
               info="Fel: funktionen returnerar inte rätt värde vid E_discrete(trans = c(2,0))")
  
  expect_equal(E_discrete(trans = c(2,5)),c(7),
               info="Fel: funktionen returnerar inte rätt värde vid E_discrete(trans = c(2,5))")
  
  
  expect_equal(length(E_discrete(density_matrix = x_mat)), c(1),
               info="Fel: Funktionen returnerar inte en vektor av längd 1")
  
  expect_equal(E_discrete(density_matrix = x_mat),c(5.5),
               info="Fel: funktionen returnerar inte rätt värde vid E_discrete(density_matrix = x_mat)")
  
  expect_equal(E_discrete(density_matrix = y_mat),c(1.9),
               info="Fel: funktionen returnerar inte rätt värde vid E_discrete(density_matrix = y_mat)")
  
  expect_equal(E_discrete(density_matrix = y_mat,trans = c(4,0)),c(7.6),
               info="Fel: funktionen returnerar inte rätt värde med density_matrix = y_mat,trans = c(4,0)")
  
  expect_equal(E_discrete(density_matrix = y_mat,trans = c(1,5)),c(6.9),
               info="Fel: funktionen returnerar inte rätt värde med density_matrix = y_mat,trans = c(1,5)")
  
  expect_equal(E_discrete(density_matrix = y_mat,trans = c(0,5)),c(5),
               info="Fel: funktionen returnerar inte rätt värde med density_matrix = y_mat,trans = c(0,5)")

  
})
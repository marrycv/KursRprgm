### Assignment : dynamic_linear_system() ###

context("dynamic_linear_system()")

test_that("Assignment: dynamic_linear_system", {
    
  expect_that(exists("dynamic_linear_system"), is_true(),
              info = "Fel: dynamic_linear_system() saknas.")
  expect_that(dynamic_linear_system, is_a("function"),
              info = "Fel: dynamic_linear_system ska vara en funktion.")
  expect_self_contained(object = dynamic_linear_system,
                        "Fel: Funktionen har fria variabler")
  expect_that(all(names(formals(dynamic_linear_system)) %in% c("f_0", "A", "n")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  A <- matrix((1/100)*c(70, 30, 30, 5, 55, 20, 25, 15, 50), ncol=3, byrow = TRUE) 
  f_0 <- c(20,40,40)
  n <- 5
  
  expect_is(dynamic_linear_system(f_0, A, n), "data.frame", 
              info="Fel: Funktionen returnerar inte en data.frame")
  expect_that(all(names(dynamic_linear_system(f_0, A, n)) %in% 
              c("n", "var1", "var2", "var3")), is_true(),
              info="Fel: Funktionen returnerar inte korrekta variabelnamn (om f_0 saknar namn).")
  expect_equal(round(dynamic_linear_system(f_0, A, n)[,2],2), c(20,49.69), 
            info="Fel: Funktionen returnerar felaktiga berakningar")
  expect_equal(round(dynamic_linear_system(f_0, A, n)[,4],2), c(40,30.52), 
               info="Fel: Funktionen returnerar felaktiga berakningar")

  names(f_0) <- c("Fido","Telus","Rogers")
  expect_that(all(names(dynamic_linear_system(f_0, A, n)) %in% 
                    c("n","Fido","Telus","Rogers")), is_true(),
              info="Fel: Funktionen returnerar inte korrekta variabelnamn (om f_0 ar namngiven).")

  A <- matrix(c(.3, .2, -.3, 1.1),ncol=2,byrow = TRUE) 
  f_0 <- c(5,1)
  n <- c(5,10)
  
  expect_that(all(names(dynamic_linear_system(f_0, A, n)) %in% 
                    c("n", "var1", "var2")), is_true(),
              info="Fel: Funktionen returnerar inte korrekta variabelnamn (om f_0 saknar namn).")
  expect_equal(round(dynamic_linear_system(f_0, A, n)[,2],2), c(5.00,-0.33,-0.41), 
               info="Fel: Funktionen returnerar felaktiga berakningar")
  expect_equal(round(dynamic_linear_system(f_0, A, n)[,3],2), c(1.00,-1.32,-1.46), 
               info="Fel: Funktionen returnerar felaktiga berakningar")
  
})


context("apartment()")

test_that("apartment()", {  

  expect_that(exists("apartment"), is_true(),
              info = "Fel: apartment() saknas.")
  expect_that(appartment, is_a("function"),
              info = "Fel: apartment är inte en funktion.")
  expect_equal(names(formals(apartment)), expected =  c("rooms","m2") ,
              info = "Fel: Funktionen ska ha argumenten rooms och m2.")

  expect_true(class(apartment(1,29))=="apartment", 
              info="Fel: Funktionen returnerar inte ett apartment-objekt.")
  
  expect_output(print(apartment(1,29)), regexp = "studio") 
  expect_output(print(apartment(1,29)), regexp = "29") 
  
  expect_output(print(apartment(3,88)), regexp = "apartment") 
  expect_output(print(apartment(3,88)), regexp = "88") 

})

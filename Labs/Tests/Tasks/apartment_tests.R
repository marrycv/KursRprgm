
context("apartment()")

test_that("apartment()", {  

  expect_true(exists("apartment"),
              info = "Fel: apartment() is missing")
  checkmate::expect_function(apartment, nargs = 2)
  expect_function_arguments(apartment, c("rooms", "m2"))

  expect_class(x = apartment(1,29), classes = "apartment",
              info="Fel: Funktionen returnerar inte ett apartment-objekt.")
  
  expect_output(print(apartment(1,29)), regexp = "studio",
                info="Fel: print-metoden för fallet apartment(1,29) fungerar inte") 
  expect_output(print(apartment(1,29)), regexp = "29",
                info="Fel: print-metoden för fallet apartment(1,29) fungerar inte") 
  
  expect_output(print(apartment(3,88)), regexp = "apartment",
                info="Fel: print-metoden för fallet apartment(3,88) fungerar inte") 
  expect_output(print(apartment(3,88)), regexp = "88",
                info="Fel: print-metoden för fallet apartment(3,88) fungerar inte") 

})

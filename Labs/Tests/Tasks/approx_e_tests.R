### Assignment : approx_e ###

context("approx_e()")

test_that("Kontroll av approx_e.", {
  
  is_true()
  
  expect_true(exists("approx_e"),
              info = "Fel: approx_e() saknas.")
  expect_true(is.function(approx_e),
              info = "Fel: approx_e är inte en funktion.")
  expect_function_self_contained(object = approx_e,
                        "Fel: Funktionen innehåller fria variabler")
  
  name_vect<-names(formals(approx_e))
  expect_true(all(name_vect %in% c("N"))&!is.null(name_vect),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_equal(is.numeric(approx_e(2)), TRUE,
               info = "Fel: Funktionen returnerar inte ett numeriskt element.")
  expect_equal(approx_e(2), 2.5,
              info = "Fel: Funktionen returnerar fel värde.")
  expect_equal(approx_e(4), 2.708333, tolerance=0.0001,
               info = "Fel: Funktionen returnerar fel värde.")
  expect_equal(approx_e(100), exp(1), 
               info = "Fel: Funktionen returnerar fel värde.")
  expect_function_code(object = approx_e, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})


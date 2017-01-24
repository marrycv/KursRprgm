### Assignment : approx_e ###

context("approx_e()")

test_that("Kontroll av approx_e.", {
  expect_that(exists("approx_e"), is_true(),
              info = "Fel: approx_e() saknas.")
  expect_that(approx_e, is_a("function"),
              info = "Fel: approx_e är inte en funktion.")
  expect_function_self_contained(object = approx_e,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(approx_e)) %in% c("N")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_equal(is.numeric(approx_e(2)), TRUE,
               info = "Fel: Funktionen returnerar inte ett logiskt element.")
  expect_equal(approx_e(2), 2.5,
              info = "Fel: Funktionen returnerar fel värde.")
  expect_equal(approx_e(4), 2.708333, tolerance=0.0001,
               info = "Fel: Funktionen returnerar fel värde.")
  expect_equal(approx_e(100), exp(1), 
               info = "Fel: Funktionen returnerar fel värde.")
  expect_function_code(object = approx_e, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})


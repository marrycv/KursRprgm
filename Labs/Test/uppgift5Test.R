### Assignment : uppgift5 ###

test_that("Kontroll av uppgift5.", {
  expect_that(uppgift5, is_a("function"),
              info = "Fel: uppgift5 är inte en funktion.")
  expect_that(all(names(formals(uppgift5)) %in% c("N")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_equal(is.numeric(uppgift5(2)), TRUE,
               info = "Fel: Funktionen returnerar inte ett logiskt element.")
  expect_equal(uppgift5(2), 2.5,
              info = "Fel: Funktionen returnerar fel värde.")
  expect_equal(uppgift5(4), 2.708333, tolerance=0.0001,
               info = "Fel: Funktionen returnerar fel värde.")
  expect_equal(uppgift5(100), exp(1), 
               info = "Fel: Funktionen returnerar fel värde.")
})


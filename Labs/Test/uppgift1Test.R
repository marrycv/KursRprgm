### Assignment : uppgift1 ###

context("uppgift1()")

test_that("Kontroll av uppgift1.", {
  expect_that(uppgift1, is_a("function"),
              info = "Fel: uppgift1 är inte en funktion.")
  expect_that(is.numeric(uppgift1()), condition=is_true(),
              info = "Fel: Funktionen returnerar inte en numerisk vektor.")
  expect_equal(length(uppgift1()), 3,
              info = "Fel: Funktionen returnerar inte en vektor av längd 3.")
  expect_that(log(3) %in% uppgift1(), is_true(), 
              info="Kommentar: ln(3) saknas / är fel")
  expect_that(exp(pi+1) %in% uppgift1() | exp(1)^(pi+1) %in% uppgift1(), is_true(), 
              info="Kommentar: e^(pi+1) saknas / är fel")
  expect_that(sin(pi/3) %in% uppgift1(), is_true(), 
              info="Kommentar: sin(pi/3) saknas / är fel")
})



### Assignment : three_elements ###

context("three_elements()")

test_that("Kontroll av three_elements.", {
  expect_that(exists("three_elements"), is_true(), 
              info = "Fel: three_elements() saknas.")
  expect_that(three_elements, is_a("function"),
              info = "Fel: three_elements är inte en funktion.")
  expect_self_contained(object = three_elements,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(is.numeric(three_elements()), condition=is_true(),
              info = "Fel: Funktionen returnerar inte en numerisk vektor.")
  expect_equal(length(three_elements()), 3,
              info = "Fel: Funktionen returnerar inte en vektor av längd 3.")
  expect_that(log(3) %in% three_elements(), is_true(), 
              info="Kommentar: ln(3) saknas / är fel")
  expect_that(exp(pi+1) %in% three_elements() | exp(1)^(pi+1) %in% three_elements(), is_true(), 
              info="Kommentar: e^(pi+1) saknas / är fel")
  expect_that(sin(pi/3) %in% three_elements(), is_true(), 
              info="Kommentar: sin(pi/3) saknas / är fel")
})



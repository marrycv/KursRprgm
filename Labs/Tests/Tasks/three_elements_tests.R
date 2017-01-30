### Assignment : three_elements ###

context("three_elements()")

test_that("Kontroll av three_elements.", {
  expect_true(exists("three_elements"), 
              info = "Fel: three_elements() saknas.")
  expect_true(is.function(three_elements),
              info = "Fel: three_elements är inte en funktion.")
  #expect_function_self_contained(object = three_elements,
  #                               "Fel: Funktionen innehåller fria variabler")
  expect_true(is.numeric(three_elements()),
              info = "Fel: Funktionen returnerar inte en numerisk vektor.")
  expect_equal(length(three_elements()), 3,
              info = "Fel: Funktionen returnerar inte en vektor av längd 3.")
  expect_true(log(3) %in% three_elements(), 
              info="Kommentar: ln(3) saknas / är fel")
  expect_true(exp(pi+1) %in% three_elements() | exp(1)^(pi+1) %in% three_elements(), 
              info="Kommentar: e^(pi+1) saknas / är fel")
  expect_true(sin(pi/3) %in% three_elements(), 
              info="Kommentar: sin(pi/3) saknas / är fel")
  
  expect_function_code(object = three_elements, expected = "return\\(", 
                       info = "Fel: return() saknas i funktionen.")  
})



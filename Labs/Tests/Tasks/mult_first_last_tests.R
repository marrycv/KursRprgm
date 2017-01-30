### Assignment : mult_first_last ###

context("mult_first_last()")

test_that("Kontroll av mult_first_last.", {
  expect_true(exists("mult_first_last"),
              info = "Fel: mult_first_last() saknas.")
  expect_true(is.function(mult_first_last),
              info = "Fel: mult_first_last är inte en funktion.")
  expect_function_self_contained(object = mult_first_last,
                        "Fel: Funktionen innehåller fria variabler")
  
  name_vect<-names(formals(mult_first_last))
  expect_true(all(name_vect %in% c("vektor"))&!is.null(name_vect), 
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  expect_true(is.numeric(mult_first_last(5:10)),
              info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  expect_equal(length(mult_first_last(5:10)), 1,
              info = "Fel: Funktionen returnerar inte ett värde.")
  expect_equal(mult_first_last(vektor=5:10), 50,
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = 5:10.")
  expect_equal(mult_first_last(vektor=c(8,1,1,1,0,5)), 40,
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = c(8,1,1,1,0,5).")
  expect_function_code(object = mult_first_last, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")
})


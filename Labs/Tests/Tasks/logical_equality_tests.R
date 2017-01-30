### Assignment : logical_equality ###

context("logical_equality()")

test_that("Kontroll av logical_equality.", {
  expect_true(exists("logical_equality"),
              info = "Fel: logical_equality() saknas.")
  expect_true(is.function(logical_equality),
              info = "Fel: logical_equality är inte en funktion.")
  expect_function_self_contained(object = logical_equality,
                        "Fel: Funktionen innehåller fria variabler")
  
  name_vect<-names(formals(logical_equality))
  expect_true(all(name_vect %in% c("A", "B"))&!is.null(name_vect)|length(name_vect)==2,
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  expect_true(is.logical(logical_equality(TRUE, TRUE)),
              info = "Fel: Funktionen returnerar inte ett logiskt värde.")
  
  expect_true(logical_equality(TRUE, TRUE),
              info = "Fel: logical_equality(TRUE, TRUE) returnerar inte TRUE.")
  expect_false(logical_equality(FALSE, TRUE),
              info = "Fel: logical_equality(FALSE, TRUE) returnerar inte FALSE.")
  expect_false(logical_equality(TRUE, FALSE),
              info = "Fel: logical_equality(TRUE, FALSE) returnerar inte FALSE.")
  expect_true(logical_equality(FALSE, FALSE),
              info = "Fel: logical_equality(FALSE, FALSE) returnerar inte TRUE.")
  expect_function_code(object = logical_equality, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})



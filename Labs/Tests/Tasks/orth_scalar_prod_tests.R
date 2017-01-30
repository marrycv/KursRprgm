### Assignment : orth_scalar_prod ###

context("orth_scalar_prod()")

test_that("Kontroll av orth_scalar_prod.", {
  
  expect_true(object = exists("orth_scalar_prod"),
              info = "Fel: orth_scalar_prod() saknas.")
  
  expect_true(is.function(orth_scalar_prod),
              info = "Fel: orth_scalar_prod är inte en funktion.")
  
  expect_function_self_contained(object = orth_scalar_prod,
                        "Fel: Funktionen innehåller fria variabler")
  expect_true(object = all(names(formals(orth_scalar_prod)) %in% c("a", "b")),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  name_vect<-names(formals(orth_scalar_prod))
  expect_true(all(name_vect %in% c("a", "b"))&!is.null(name_vect),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  expect_true(is.numeric(orth_scalar_prod(a=1:3, b=4:6)),
              info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  expect_equal(length(orth_scalar_prod(a=1:3, b=4:6)), 1,
              info = "Fel: Funktionen returnerar inte ett värde.")
  expect_equal(orth_scalar_prod(a=1:3, b=4:6), 32,
               info = "Fel: Funktionen returnerar inte ett korrekt värde.")
  expect_equal(orth_scalar_prod(a=5:10, b=20:25), 1030,
               info = "Fel: Funktionen returnerar inte ett korrekt värde.")
  
  expect_function_code(object = orth_scalar_prod, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})


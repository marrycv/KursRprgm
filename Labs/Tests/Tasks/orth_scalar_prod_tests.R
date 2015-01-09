### Assignment : orth_scalar_prod ###

context("orth_scalar_prod()")

test_that("Kontroll av orth_scalar_prod.", {
  expect_that(orth_scalar_prod, is_a("function"),
              info = "Fel: orth_scalar_prod är inte en funktion.")
  expect_that(all(names(formals(orth_scalar_prod)) %in% c("a", "b")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.numeric(orth_scalar_prod(a=1:3, b=4:6)), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  expect_equal(length(orth_scalar_prod(a=1:3, b=4:6)), 1,
              info = "Fel: Funktionen returnerar inte ett värde.")
  expect_equal(orth_scalar_prod(a=1:3, b=4:6), 32,
               info = "Fel: Funktionen returnerar inte ett korrekt värde.")
  expect_equal(orth_scalar_prod(a=5:10, b=20:25), 1030,
               info = "Fel: Funktionen returnerar inte ett korrekt värde.")
})


### Assignment : uppgift3 ###

context("uppgift3()")

test_that("Kontroll av uppgift3.", {
  expect_that(uppgift3, is_a("function"),
              info = "Fel: uppgift3 är inte en funktion.")
  expect_that(all(names(formals(uppgift3)) %in% c("a", "b")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.numeric(uppgift3(a=1:3, b=4:6)), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  expect_equal(length(uppgift3(a=1:3, b=4:6)), 1,
              info = "Fel: Funktionen returnerar inte ett värde.")
  expect_equal(uppgift3(a=1:3, b=4:6), 32,
               info = "Fel: Funktionen returnerar inte ett korrekt värde.")
  expect_equal(uppgift3(a=5:10, b=20:25), 1030,
               info = "Fel: Funktionen returnerar inte ett korrekt värde.")
})


### Assignment : uppgift2 ###

test_that("Kontroll av uppgift2.", {
  expect_that(uppgift2, is_a("function"),
              info = "Fel: uppgift2 är inte en funktion.")
  expect_that(all(names(formals(uppgift2)) %in% c("vektor")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.numeric(uppgift2(5:10)), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  expect_equal(length(uppgift2(5:10)), 1,
              info = "Fel: Funktionen returnerar inte ett värde.")
  expect_equal(uppgift2(vektor=5:10), 50,
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = 5:10.")
  expect_equal(uppgift2(vektor=c(8,1,1,1,0,5)), 40,
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = c(8,1,1,1,0,5).")
})


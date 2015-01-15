### Assignment : mult_first_last ###

context("mult_first_last()")

test_that("Kontroll av mult_first_last.", {
  expect_that(exists("mult_first_last"), is_true(),
              info = "Fel: mult_first_last() saknas.")
  expect_that(mult_first_last, is_a("function"),
              info = "Fel: mult_first_last är inte en funktion.")
  expect_self_contained(object = mult_first_last,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(mult_first_last)) %in% c("vektor")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.numeric(mult_first_last(5:10)), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  expect_equal(length(mult_first_last(5:10)), 1,
              info = "Fel: Funktionen returnerar inte ett värde.")
  expect_equal(mult_first_last(vektor=5:10), 50,
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = 5:10.")
  expect_equal(mult_first_last(vektor=c(8,1,1,1,0,5)), 40,
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = c(8,1,1,1,0,5).")
})


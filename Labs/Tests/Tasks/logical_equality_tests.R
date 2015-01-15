### Assignment : logical_equality ###

context("logical_equality()")

test_that("Kontroll av logical_equality.", {
  expect_that(exists("logical_equality"), is_true(),
              info = "Fel: logical_equality() saknas.")
  expect_that(logical_equality, is_a("function"),
              info = "Fel: logical_equality är inte en funktion.")
  expect_self_contained(object = logical_equality,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(logical_equality)) %in% c("A", "B")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.logical(logical_equality(TRUE, TRUE)), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett logiskt värde.")
  expect_that(logical_equality(TRUE, TRUE), is_true(),
              info = "Fel: logical_equality(TRUE, TRUE) returnerar inte TRUE.")
  expect_that(!logical_equality(FALSE, TRUE), is_true(),
              info = "Fel: logical_equality(FALSE, TRUE) returnerar inte FALSE.")
  expect_that(!logical_equality(TRUE, FALSE), is_true(),
              info = "Fel: logical_equality(TRUE, FALSE) returnerar inte FALSE.")
  expect_that(logical_equality(FALSE, FALSE), is_true(),
              info = "Fel: logical_equality(FALSE, FALSE) returnerar inte TRUE.")
})



### Assignment : pnr_age ###

context("pnr_age()")

test_that("Kontroll av pnr_age.", {
  expect_that(exists("pnr_age"), is_true(),
              info = "Fel: pnr_age() saknas.")
  expect_that(pnr_age, is_a("function"),
              info = "Fel: pnr_age är inte en funktion.")
  expect_self_contained(object = pnr_age,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(pnr_age)) %in% c("pnr", "date")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.numeric(pnr_age(pnr = "196408233234", date="2012-12-01")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett numeriskt element.")
  expect_equal(pnr_age(pnr = "196408233234", date="2012-12-01"), 48,
              info = "Fel: Ska returnera 48.")
  expect_equal(pnr_age(pnr = "198112189876", date="2012-12-18"), 31,
               info = "Fel: Ska returnera 31.")
  expect_equal(pnr_age(pnr = "198112189876", date="2012-12-17"), 30,
               info = "Fel: Ska returnera 30.")
})

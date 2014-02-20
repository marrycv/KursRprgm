### Assignment : pnrAge ###

test_that("Kontroll av pnrAge.", {
  expect_that(pnrAge, is_a("function"),
              info = "Fel: pnrAge är inte en funktion.")
  expect_that(all(names(formals(pnrAge)) %in% c("pnr", "date")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.numeric(pnrAge(pnr = "196408233234", date="2012-12-01")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett numeriskt element.")
  expect_equal(pnrAge(pnr = "196408233234", date="2012-12-01"), 48,
              info = "Fel: Ska returnera 48.")
  expect_equal(pnrAge(pnr = "198112189876", date="2012-12-18"), 31,
               info = "Fel: Ska returnera 31.")
  expect_equal(pnrAge(pnr = "198112189876", date="2012-12-17"), 30,
               info = "Fel: Ska returnera 30.")
})

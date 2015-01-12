### Assignment : pnr_date ###

test_that("Kontroll av pnr_date.", {
  expect_that(pnr_date, is_a("function"),
              info = "Fel: pnr_date är inte en funktion.")
  expect_that(all(names(formals(pnr_date)) %in% c("date")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.character(pnr_date(as.character(Sys.Date()))), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett textelement.")
  expect_equal(pnr_date(date="2012-01-23"), "2012-01-23",
              info = "Fel: Funktionen returnerar inte ett korrekt datum.")
  expect_equal(pnr_date(), "2013-12-31",
              info = "Fel: Ska returnera 2013-12-31.")
  expect_error(pnr_date(date="has"), 
               info = "Fel: Funktionen stoppas inte om fel format anges.")
  expect_error(pnr_date("has"), "Incorrect date format",
               info = "Fel: Funktionen genererar inte ett korrekt felmeddelande.")
})

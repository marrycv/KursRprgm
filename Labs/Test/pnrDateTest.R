### Assignment : pnrDate ###

test_that("Kontroll av pnrDate.", {
  cat("pnrDate : ")
  expect_that(pnrDate, is_a("function"),
              info = "Fel: pnrDate är inte en funktion.")
  expect_that(all(names(formals(pnrDate)) %in% c("date")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.character(pnrDate(as.character(Sys.Date()))), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett textelement.")
  expect_that(pnrDate("2012-01-23"), "2012-01-23",
              info = "Fel: Funktionen returnerar inte ett korrket datum.")
  expect_equal(pnrDate(), "2013-12-31",sep=""),
              info = "Fel: Ska returnera 2013-12-31.")
  expect_error(pnrDate("has"), 
               info = "Fel: Funktionen stoppas inte om fel format anges.")
  expect_error(pnrDate("has"), "Incorrect date format",
               info = "Fel: Funktionen genererar inte ett korrekt felmeddelande.")
})

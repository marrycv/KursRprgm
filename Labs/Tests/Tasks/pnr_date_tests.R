### Assignment : pnr_date ###

context("pnr_date()")

test_that("Kontroll av pnr_date.", {
  expect_that(exists("pnr_date"), is_true(),
              info = "Fel: pnr_date() saknas.")  
  expect_that(pnr_date, is_a("function"),
              info = "Fel: pnr_date är inte en funktion.")
  expect_self_contained(object = pnr_date,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(pnr_date)) %in% c("date")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.symbol(formals(pnr_date)$date), condition=is_false(),
              info = "Fel: Argumentet 'date' saknar default value.")
  expect_that(is.character(pnr_date(as.character(Sys.Date()))), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett textelement.")
  expect_equal(pnr_date(date="2012-01-23"), "2012-01-23",
              info = "Fel: Funktionen returnerar inte ett korrekt datum.")
  last_year <- paste0(as.character(as.numeric(paste(substr(Sys.Date(),1,4))) - 1),"-12-31")
  expect_equal(pnr_date(), last_year,
              info = paste0("Fel: Ska returnera", last_year, "."))
  expect_error(pnr_date(date="has"), 
               info = "Fel: Funktionen stoppas inte om fel format anges.")
  expect_error(pnr_date("has"), "Incorrect date format",
               info = "Fel: Funktionen genererar inte ett korrekt felmeddelande.")
  
  expect_function_code(object = pnr_date, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})

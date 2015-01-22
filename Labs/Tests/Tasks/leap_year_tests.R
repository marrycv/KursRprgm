
context("leap_year()")

test_that("leap_year()", {
  test_years <- c("1800","1900","2000", "1856", "1236", "1999", "12")
  test_years_leap <-c(FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE)
  
  expect_that(exists("leap_year"), is_true(),
              info = "Fel: leap_year() saknas.")
  expect_that(leap_year, is_a("function"),
              info = "Fel: leap_year är inte en funktion.")
  expect_self_contained(object = leap_year,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(leap_year)) %in% c("years")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(class(leap_year(years=test_years)), 
              is_equivalent_to("data.frame"),
              info="Fel: Funktionen leap_year() returnerar inte en data.frame")
  expect_that(dim(leap_year(years=test_years)), 
              is_equivalent_to(c(length(test_years),2)), 
              info="Kommentar: Funktionen leap_year() returnerar fel dimensioner (kolumner och/eller rader)")
  expect_that(all(colnames(leap_year(years=test_years)) %in% c("years","leap_year")), is_true(),
              info="Fel: Funktionen returnerar fel variabelnamn.")
  expect_that(unlist(lapply(leap_year(years=test_years),class)), 
              is_equivalent_to(c("numeric","logical")), 
              info="Kommentar: Variablerna är inte av rätt typ (logisk/numerisk)")
  expect_that(leap_year(years=test_years)["years"], 
              is_equivalent_to(data.frame(years=as.numeric(test_years))), 
              info="Kommentar: Variabeln years är felaktig (ej numerisk).")
  expect_that(leap_year(years=test_years)["leap_year"], 
              is_equivalent_to(data.frame(leap_year=test_years_leap)), 
              info="Kommentar: Variabeln leap_years är felaktig.")
  expect_function_code(object = leap_year, expected = "return\\(", 
                       info = "Fel: return() saknas i funktionen.")  
})
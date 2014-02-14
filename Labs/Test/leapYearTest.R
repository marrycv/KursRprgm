### Assignment : leapYear() ###

test_that("Assignment: leapYear()", {
  test_years <- c("1800","1900","2000", "1856", "1236", "1999", "12")
  test_years_leap <-c(FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE)
  
  expect_that(leapYear, is_a("function"),
              info = "Fel: matrixTrace är inte en funktion.")
  expect_that(all(names(formals(leapYear)) %in% c("years")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(class(leapYear(years=test_years)), 
              is_equivalent_to("data.frame"),
              info="Fel: Funktionen leapYear() returnerar inte en data.frame")
  expect_that(dim(leapYear(years=test_years)), 
              is_equivalent_to(c(length(test_years),2)), 
              info="Kommentar: Funktionen leapYear() returnerar fel dimensioner (kolumner och/eller rader)")
  expect_that(all(colnames(leapYear(years=test_years)) %in% c("years","leapYear")), is_true()  
              info="Fel: Funktionen returnerar fel variabelnamn.")
  expect_that(unlist(lapply(leapYear(years=test_years),class)), 
              is_equivalent_to(c("numeric","logical")), 
              info="Kommentar: Variablerna är inte av rätt typ (logisk/numerisk)")
  expect_that(leapYear(years=test_years)["years"], 
              is_equivalent_to(data.frame(years=as.numeric(test_years))), 
              info="Kommentar: Variabeln years är felaktig (ej numerisk).")
  expect_that(leapYear(years=test_years)["leapYear"], 
              is_equivalent_to(data.frame(leapYear=test_years_leap)), 
              info="Kommentar: Variabeln leapYears är fel.")
})
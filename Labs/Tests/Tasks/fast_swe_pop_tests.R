
context("fast_swe_pop()")

test_that("fast_swe_pop()", {  
  expect_that(exists("fast_swe_pop"), is_true(),
              info = "Fel: fast_swe_pop() saknas.")
  expect_that(fast_swe_pop, is_a("function"),
              info = "Fel: fast_swe_pop är inte en funktion.")
  expect_that(is.null(formals(fast_swe_pop)), condition=is_true(),
              info = "Fel: Funktionen ska sakna argument.")
  res <- fast_swe_pop()
  expect_true(class(res)=="data.frame", 
              info="Fel: Funktionen returnerar inte en data.frame.")
  expect_true(all(names(res) %in% c("year", "population")), 
               info="Fel: Funktionen returnerar felaktiga variabelnamn.")
  expect_true(is.numeric(res$year),
               info="Fel: year ska vara en numerisk variabel.")
  expect_true(is.numeric(res$population), 
               info="Fel: population ska vara en numerisk variabel.")
  expect_true(all(res$year[12:15] == c(1979,1980,1981,1982)),
               info="Fel: Felaktigt resultat i year.")
  expect_true(all(res$population[12:15] == c(8303010,8317937,8323033,8327484)),
               info="Fel: Felaktigt resultat i population.")
})

### Assignment : pnr_format ###
context("pnr_format()")

test_that("Kontroll av pnr_format().", {
  expect_that(exists("pnr_format"), is_true(),
              info = "Fel: pnr_format() saknas.")
  expect_that(pnr_format, is_a("function"),
              info = "Fel: pnr_format är inte en funktion.")
  expect_that(all(names(formals(pnr_format)) %in% c("pnr")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.character(pnr_format(6408233234)), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett textelement.")
  expect_that(is.character(pnr_format("6408233234")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett textelement.")
  expect_equal(pnr_format("640823-3234"), "196408233234",
              info = "Fel: Funktionen returnerar fel vid formatet ÅÅMMDD-NNNK")
  expect_equal(pnr_format("196408233234"), "196408233234",
               info = "Fel: Funktionen returnerar fel vid formatet ÅÅÅÅMMDDNNNK")
  expect_equal(pnr_format(6408233234), "196408233234",
               info = "Fel: Funktionen returnerar fel vid formatet ÅÅMMDDNNNK (numeriskt).")
  pnrToday <- paste(substr(Sys.Date(),1,4), 
                    substr(Sys.Date(),6,7),
                    substr(Sys.Date(),9,10),
                    "0133", sep="")
  pnrTomorrow <- paste(substr(Sys.Date()+1,1,4), 
                       substr(Sys.Date()+1,6,7),
                       substr(Sys.Date()+1,9,10),
                       "0133", sep="")  
  expect_equal(pnr_format(substr(pnrToday,3,12)), pnrToday,
               info = "Fel: Funktionen returnerar fel för en person som föddes idag.")
  expect_equal(pnr_format(substr(pnrTomorrow,3,12)), pnrTomorrow,
               info = "Fel: Funktionen returnerar fel för en person som fyller 100 imorgon.")
  
})

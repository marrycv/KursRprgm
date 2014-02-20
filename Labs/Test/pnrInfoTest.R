### Assignment : pnrInfo ###

test_that("Kontroll av pnrInfo.", {
  expect_that(pnrInfo, is_a("function"),
              info = "Fel: pnrInfo är inte en funktion.")
  expect_that(all(names(formals(pnrInfo)) %in% c("pnr", "...", "date")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.data.frame(pnrInfo(pnr = "196408233234", date="2012-12-01")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte en data.frame.")
  expect_message(pnrInfo(pnr = "196408233234", date="2012-12-01"), 
                 "The age has been calculated at",
              info = "Fel: Funktionen returnerar inte ett meddelande om datum för åldersberäkning.")
  expect_message(pnrInfo(pnr = "196408233234", date="2012-12-01"), 
                 "2012-12-01",
                 info = "Fel: Funktionen returnerar inte ett meddelande om datum för åldersberäkning (fel datum).")
  expect_that(all(colnames(pnrInfo(pnr = "196408233234", date="2012-12-01")) %in%
              c("pnr", "correct", "samordn", "sex", "age")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte korrekta variabelnamn.")
  expect_that(all(dim(pnrInfo(pnr = "196408233234", date="2012-12-01")) == c(1, 5)),
              condition=is_true(),
              info = "Fel: Funktionen returnerar inte en data.frame med rätt antal rader och kolumner.")  
  expect_equal(pnrInfo(pnr = "198112189876", date="2012-12-18")$correct, TRUE,
               info = "Fel: Returnerar fel värde för correct.")
  expect_equal(pnrInfo(pnr = "198112189876", date="2012-12-18")$samordn, FALSE,
               info = "Fel: Returnerar fel värde för samordn.")  
  expect_equal(as.character(pnrInfo(pnr = "198112189876", date="2012-12-18")$sex), "M",
               info = "Fel: Returnerar fel värde för sex.")  
  expect_equal(pnrInfo(pnr = "198112189876", date="2012-12-18")$age, 31,
               info = "Fel: Returnerar fel värde för age.")  
})

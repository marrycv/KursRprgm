### Assignment : pnr_info ###

context("pnr_info()")

test_that("Kontroll av pnr_info.", {
  expect_that(exists("pnr_info"), is_true(),
              info = "Fel: pnr_info() saknas.")
  expect_that(pnr_info, is_a("function"),
              info = "Fel: pnr_info är inte en funktion.")
  expect_self_contained(object = pnr_info,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(pnr_info)) %in% c("pnr", "...", "date")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn/saknas.")
  expect_that(is.data.frame(pnr_info(pnr = "196408233234", date="2012-12-01")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte en data.frame.")
  expect_message(pnr_info(pnr = "196408233234", date="2012-12-01"), 
                 "The age has been calculated at",
              info = "Fel: Funktionen returnerar inte ett meddelande om datum för åldersberäkning.")
  expect_message(pnr_info(pnr = "196408233234", date="2012-12-01"), 
                 "2012-12-01",
                 info = "Fel: Funktionen returnerar inte ett meddelande om datum för åldersberäkning (fel datum).")
  
  expect_that(all(colnames(pnr_info(pnr = "196408233234", date="2012-12-01")) %in%
              c("pnr", "correct", "samordn", "sex", "age")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte korrekta variabelnamn.")
  
  expect_that(all(dim(pnr_info(pnr = "196408233234", date="2012-12-01")) == c(1, 5)),
              condition=is_true(),
              info = "Fel: Funktionen returnerar inte en data.frame med rätt antal rader och kolumner.")  
  
  expect_equal(is.logical(pnr_info(pnr = "198112189876", date="2012-12-18")$correct), TRUE,
               info = "Fel: correct är inte en logisk variabel.")
  
  expect_equal(pnr_info(pnr = "198112189876", date="2012-12-18")$correct, TRUE,
               info = "Fel: Returnerar fel värde för correct.")
  
  expect_equal(is.logical(pnr_info(pnr = "198112189876", date="2012-12-18")$samordn), TRUE,
               info = "Fel: samordn är inte en logisk variabel.")
  
  expect_equal(pnr_info(pnr = "198112189876", date="2012-12-18")$samordn, FALSE,
               info = "Fel: Returnerar fel värde för samordn.")  
  
  expect_equal(as.character(pnr_info(pnr = "198112189876", date="2012-12-18")$sex), "M",
               info = "Fel: Returnerar fel värde för sex.")  
  
  expect_equal(is.numeric(pnr_info(pnr = "198112189876", date="2012-12-18")$age), TRUE,
               info = "Fel: age är inte en numerisk variabel.")
  
  expect_equal(pnr_info(pnr = "198112189876", date="2012-12-18")$age, 31,
               info = "Fel: Returnerar fel värde för age.")

  expect_function_code(object = pnr_info, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
  
  
  pnr1<-c("196408233234","196408833234","198112189876","197003081242")
  correct<-c(TRUE,FALSE,TRUE,TRUE)
  samordn<-c(FALSE,TRUE,FALSE,FALSE)
  sex<-c("M","M","M","K")
  age<-c(35,35,18,30)
  test<-data.frame(pnr=pnr1,correct,samordn,sex,age)
  
  expect_equal(pnr_info(pnr = pnr1, date= "2000-06-01"), test,
               info = "Fel: ger inte rätt data.frame för argumenten 
               pnr=c('196408233234','196408833234','198112189876','197003081242') och
               date='2000-06-01'")
  
})

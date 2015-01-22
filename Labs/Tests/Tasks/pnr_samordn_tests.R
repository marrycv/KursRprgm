### Assignment : pnr_samordn ###
context("pnr_samordn()")

test_that("Kontroll av pnr_samordn.", {
  expect_that(exists("pnr_samordn"), is_true(),
              info = "Fel: pnr_samordn() saknas.")
  expect_that(pnr_samordn, is_a("function"),
              info = "Fel: pnr_samordn är inte en funktion.")
  expect_self_contained(object = pnr_samordn,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(pnr_samordn)) %in% c("pnr")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.logical(pnr_samordn("196408233234")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett logiskt element.")
  expect_equal(pnr_samordn("196408233234"), FALSE,
              info = "Fel: Ska returnera FALSE för 196408233234.")
  expect_equal(pnr_samordn("196408833234"), TRUE,
               info = "Fel: Ska returnera FALSE för 196408233234.")
  expect_equal(pnr_samordn("198112189876"), FALSE,
               info = "Fel: Ska returnera FALSE för 198112189876.")
  expect_equal(pnr_samordn("198112789866"), TRUE,
               info = "Fel: Ska returnera TRUE för 198112189866.")
  
  expect_function_code(object = pnr_samordn, expected = "return\\(", 
                       info = "Fel: return() saknas i funktionen.")  
})

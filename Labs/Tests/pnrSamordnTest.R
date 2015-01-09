### Assignment : pnrSamordn ###

test_that("Kontroll av pnrSamordn.", {
  expect_that(pnrSamordn, is_a("function"),
              info = "Fel: pnrSex är inte en funktion.")
  expect_that(all(names(formals(pnrSamordn)) %in% c("pnr")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.logical(pnrSamordn("196408233234")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett logiskt element.")
  expect_equal(pnrSamordn("196408233234"), FALSE,
              info = "Fel: Ska returnera FALSE för 196408233234.")
  expect_equal(pnrSamordn("196408833234"), TRUE,
               info = "Fel: Ska returnera FALSE för 196408233234.")
  expect_equal(pnrSamordn("198112189876"), FALSE,
               info = "Fel: Ska returnera FALSE för 198112189876.")
  expect_equal(pnrSamordn("198112789866"), TRUE,
               info = "Fel: Ska returnera TRUE för 198112189866.")
})

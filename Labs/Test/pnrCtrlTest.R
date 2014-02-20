### Assignment : pnrCtrl ###

test_that("Kontroll av pnrCtrl.", {
  expect_that(pnrCtrl, is_a("function"),
              info = "Fel: pnrCtrl är inte en funktion.")
  expect_that(all(names(formals(pnrCtrl)) %in% c("pnr")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.logical(pnrCtrl("196408233234")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett logiskt element.")
  expect_that(pnrCtrl("196408233234"), condition=is_true(),
              info = "Fel: Ska returnera TRUE för 196408233234.")
  expect_that(pnrCtrl("196408233238"), condition=is_false(),
              info = "Fel: Ska returnera FALSE för 196408233238.")
  expect_that(pnrCtrl("198112189876"), condition=is_true(),
              info = "Fel: Ska returnera TRUE för 198112189876.")
  expect_that(pnrCtrl("198112189879"), condition=is_false(),
              info = "Fel: Ska returnera FALSE för 198112189879.")
  expect_that(pnrCtrl("199909090909"), condition=is_false(),
              info = "Fel: Ska returnera FALSE för 199909090909.")
})

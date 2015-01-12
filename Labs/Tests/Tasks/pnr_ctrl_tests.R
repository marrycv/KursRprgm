### Assignment : pnr_ctrl ###
context("pnr_ctrl()")

test_that("Kontroll av pnr_ctrl.", {
  expect_that(exists("pnr_ctrl"), is_true(),
              info = "Fel: pnr_ctrl() saknas.")
  expect_that(pnr_ctrl, is_a("function"),
              info = "Fel: pnr_ctrl är inte en funktion.")
  expect_that(all(names(formals(pnr_ctrl)) %in% c("pnr")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.logical(pnr_ctrl("196408233234")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett logiskt element.")
  expect_that(pnr_ctrl("196408233234"), condition=is_true(),
              info = "Fel: Ska returnera TRUE för 196408233234.")
  expect_that(pnr_ctrl("196408233238"), condition=is_false(),
              info = "Fel: Ska returnera FALSE för 196408233238.")
  expect_that(pnr_ctrl("198112189876"), condition=is_true(),
              info = "Fel: Ska returnera TRUE för 198112189876.")
  expect_that(pnr_ctrl("198112189879"), condition=is_false(),
              info = "Fel: Ska returnera FALSE för 198112189879.")
  expect_that(pnr_ctrl("199909090909"), condition=is_false(),
              info = "Fel: Ska returnera FALSE för 199909090909.")
})

### Assignment : pnrCtrl ###

test_that("Kontroll av pnrSex.", {
  cat("pnrCtrl : ")
  expect_that(pnrSex, is_a("function"),
              info = "Fel: pnrSex är inte en funktion.")
  expect_that(all(names(formals(pnrSex)) %in% c("pnr")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.character(pnrSex("196408233234")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett textelement.")
  expect_equal(pnrSex("196408233234"), "M",
              info = "Fel: Ska returnera 'M' för 196408233234.")
  expect_equal(pnrSex("196408233224"), "K",
               info = "Fel: Ska returnera 'K' för 196408233224.")
  expect_equal(pnrSex("198112189876"), "M",
               info = "Fel: Ska returnera 'M' för 198112189876.")
  expect_equal(pnrSex("198112189866"), "K",
               info = "Fel: Ska returnera 'K' för 198112189866.")
})

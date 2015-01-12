### Assignment : pnr_sex ###

test_that("Kontroll av pnr_sex.", {
  expect_that(pnr_sex, is_a("function"),
              info = "Fel: pnr_sex är inte en funktion.")
  expect_that(all(names(formals(pnr_sex)) %in% c("pnr")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.character(pnr_sex("196408233234")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett textelement.")
  expect_equal(pnr_sex("196408233234"), "M",
              info = "Fel: Ska returnera 'M' för 196408233234.")
  expect_equal(pnr_sex("196408233224"), "K",
               info = "Fel: Ska returnera 'K' för 196408233224.")
  expect_equal(pnr_sex("198112189876"), "M",
               info = "Fel: Ska returnera 'M' för 198112189876.")
  expect_equal(pnr_sex("198112189866"), "K",
               info = "Fel: Ska returnera 'K' för 198112189866.")
})

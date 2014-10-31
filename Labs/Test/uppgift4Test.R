### Assignment : uppgift4 ###

context("uppgift4()")

test_that("Kontroll av uppgift4.", {
  expect_that(uppgift4, is_a("function"),
              info = "Fel: uppgift4 är inte en funktion.")
  expect_that(all(names(formals(uppgift4)) %in% c("namn")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_output(uppgift4("Benny"), "Benny",
              info = "Fel: Funktionen returnerar inte namnet.")
  expect_output(uppgift4("Benny"), "I am your father",
                info = "Fel: Funktionen returnerar inte 'I am your father'.")
  expect_output(uppgift4("Benny"), "Benny, I am your father",
                info = "Fel: Funktionen returnerar inte 'I am your father'.")
})


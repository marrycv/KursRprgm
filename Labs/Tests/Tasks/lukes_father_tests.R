### Assignment : lukes_father ###

context("lukes_father()")

test_that("Kontroll av lukes_father.", {
  expect_that(lukes_father, is_a("function"),
              info = "Fel: lukes_father är inte en funktion.")
  expect_that(all(names(formals(lukes_father)) %in% c("namn")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_output(lukes_father("Benny"), "Benny",
              info = "Fel: Funktionen returnerar inte namnet.")
  expect_output(lukes_father("Benny"), "I am your father",
                info = "Fel: Funktionen returnerar inte 'I am your father'.")
  expect_output(lukes_father("Benny"), "Benny, I am your father",
                info = "Fel: Funktionen returnerar inte 'I am your father'.")
})


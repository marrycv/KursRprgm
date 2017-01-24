### Assignment : lukes_father ###

context("lukes_father()")

test_that("Kontroll av lukes_father.", {
  expect_that(exists("lukes_father"), is_true(),
              info = "Fel: lukes_father() saknas.")
  expect_that(lukes_father, is_a("function"),
              info = "Fel: lukes_father är inte en funktion.")
  expect_function_self_contained(object = lukes_father,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(lukes_father)) %in% c("namn")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_output(lukes_father("Benny"), "Benny",
              info = "Fel: Funktionen skriver inte ut namnet.")
  expect_output(lukes_father("Benny"), "I am your father",
                info = "Fel: Funktionen skriver inte ut 'I am your father'.")
  temp <- capture.output(ret_val <- lukes_father("Benny"))
  expect_null(ret_val,
              info = "Fel: Funktionen ska inte returnera ngt, bara skriva ut till skarmen.")
})


### Assignment : lukes_father ###

context("lukes_father()")

test_that("Kontroll av lukes_father.", {
    expect_true(exists("lukes_father"),
              info = "Fel: lukes_father() saknas.")
  expect_true(is.function(lukes_father),
              info = "Fel: lukes_father är inte en funktion.")
  expect_function_self_contained(object = lukes_father,
                        "Fel: Funktionen innehåller fria variabler")
  
  name_vect<-names(formals(lukes_father))
  expect_true(all(name_vect %in% c("namn"))&!is.null(name_vect),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  
  expect_output(lukes_father("Benny"), "Benny",
              info = "Fel: Funktionen skriver inte ut namnet.")
  expect_output(lukes_father("Stina"), "Stina",
                info = "Fel: Funktionen skriver inte ut namnet.")
  expect_output(lukes_father("Benny"), "I am your father",
                info = "Fel: Funktionen skriver inte ut 'I am your father'.")
  temp <- capture.output(ret_val <- lukes_father("Benny"))
  expect_null(ret_val,
              info = "Fel: Funktionen ska inte returnera ngt, bara skriva ut till skarmen.")
})


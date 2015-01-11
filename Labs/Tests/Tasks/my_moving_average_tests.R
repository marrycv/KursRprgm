### Assignment : my_moving_average() ###

context("my_moving_average()")

test_that("Assignment: my_moving_average()", {
  x <- 1:3
  y <- c(1, 5, 6, 7, 7, 1, -2)
  y_res_n2 <- c(3.0, 5.5, 6.5, 7.0, 4.0, -0.5) 

  expect_that(exists("my_moving_average"), is_true(),
              info = "Fel: my_moving_average() saknas.")  
  expect_that(my_moving_average, is_a("function"),
              info = "Fel: my_moving_average är inte en funktion.")
  expect_that(all(names(formals(my_moving_average)) %in% c("x","n")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.numeric(my_moving_average(x=y, n=2)), condition=is_true(),
              info = "Fel: Funktionen returnerar inte en numerisk vector.")
  expect_that(all(my_moving_average(x=y, n=2) == y_res_n2), condition=is_true(),
              info = "Fel: Funktionen returnerar fel om x = c(1,5,6,7,7,1,-2).")
  expect_error(my_moving_average(x="Pelle", n=3),
               info = "Fel: Funktionenen stoppar inte om dimensionerna är fel.")  
  expect_error(my_moving_average(x="Pelle", n=3), "Not a numeric vector!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande.")  
})

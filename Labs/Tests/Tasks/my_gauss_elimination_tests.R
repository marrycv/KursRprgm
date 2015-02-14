### Assignment : my_gauss_elimination() ###

context("my_gauss_elimination()")

test_that("my_gauss_elimination()", {
  A1 <- diag(3)
  b1 <- c(1,4,5)
  x1 <- c(1,4,5)

  A2 <- matrix(c(6, 10, 4, 3, 4, 6, 3, 10, 8),nrow=3)
  b2 <- c(18,40,24)
  x2 <- c(2,0,2)
    
  expect_that(exists("my_gauss_elimination"), is_true(),
              info = "Fel: my_gauss_elimination() saknas.")
  expect_that(my_gauss_elimination, is_a("function"),
              info = "Fel: my_gauss_elimination är inte en funktion.")
  expect_self_contained(object = my_gauss_elimination,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(my_gauss_elimination)) %in% c("A","b")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.numeric(my_gauss_elimination(A=A1, b=b1)), condition=is_true(),
              info = "Fel: Funktionen returnerar inte en numerisk vektor.")
  expect_equal(as.vector(my_gauss_elimination(A=A1, b=b1)), x1,
               info = "Fel: Funktionen returnerar fel värde för A <- diag(3) och b <- c(1,4,5).")
  expect_equal(as.vector(my_gauss_elimination(A=A2, b=b2)), x2,
               info = "Fel: Funktionen returnerar fel värde för A <- matrix(c(6, 10, 4, 3, 4, 6, 3, 10, 8),nrow=3) och b <- c(18,40,24).")
  expect_function_code(object = my_gauss_elimination, expected = "return\\(", 
                       info = "Fel: return() saknas i funktionen.")  
  
  res <- markmyassignment:::function_code("solve")(my_gauss_elimination)
  expect_that(res$passed, is_false(), "Fel: Funktionen solve() finns i funktionen.")
})

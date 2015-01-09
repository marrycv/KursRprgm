### Assignment : myMatrixProd() ###

test_that("Assignment: myMatrixProd()", {
  testMatA1 <- matrix(c(3, 1, 5, 6), nrow = 2, ncol = 2)
  testMatB1 <- t(testMatA1)
  testMatA2 <- matrix(c(3, 1, 5, 6, 1, 1), nrow = 3, ncol = 3)
  testMatB2 <- t(testMatA2)
  testMatA3 <- matrix(c(3, 1, 5, 6, 1, 1), nrow = 1, ncol = 6)
  testMatB3 <- t(testMatA3)  
  testMatA4 <- matrix(2:9, nrow = 2, ncol = 4)
  testMatB4 <- t(testMatA4)

  expect_that(myMatrixProd, is_a("function"),
              info = "Fel: bmi är inte en funktion.")
  expect_that(all(names(formals(myMatrixProd)) %in% c("A","B")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.matrix(myMatrixProd(A=testMatA1, B=testMatB1)), condition=is_true(),
              info = "Fel: Funktionen returnerar inte en matris.")
  expect_equal(myMatrixProd(A=testMatA1, B=testMatB1), testMatA1%*%testMatB1,
              info = "Fel: Funktionen returnerar fel värde för två 2*2 matriser.")
  expect_equal(myMatrixProd(A=testMatA2, B=testMatB2), testMatA2%*%testMatB2,
               info = "Fel: Funktionen returnerar fel värde för två 3*3 matriser.")
  expect_equal(myMatrixProd(A=testMatA3, B=testMatB3), testMatA3%*%testMatB3,
               info = "Fel: Funktionen returnerar fel värde för två matriser (1*6 och 6*1.)")
  expect_equal(myMatrixProd(A=testMatA4, B=testMatB4), testMatA4%*%testMatB4,
               info = "Fel: Funktionen returnerar fel värde för två matriser (2*4 och 4*2.)")
  expect_error(myMatrixProd(A=testMatB3, B=testMatB3),
               info = "Fel: Funktionenen stoppar inte om dimensionerna är fel.")  
  expect_error(myMatrixProd(A=testMatB3, B=testMatB3), "Matrix dimensions mismatch",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande då dimensionerna är fel.")  
})

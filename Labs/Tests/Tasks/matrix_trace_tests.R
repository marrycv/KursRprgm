context("matrix_trace()")

test_that("matrix_trace", {
  test_matA <- matrix(2*4:7,nrow=2)
  test_matB <- matrix(9:12,nrow=2)
  test_matC <- matrix(7:15 * 3, nrow=3)
  test_matD <- matrix(2:17 * 1.5, nrow=4)
  
  expect_that(matrix_trace, is_a("function"),
              info = "Fel: matrixTrace är inte en funktion.")
  expect_that(all(names(formals(matrixTrace)) %in% c("X")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(class(matrix_trace(test_matA)), is_equivalent_to("numeric"),
              info="Fel: Funktionen returnerar inte ett numeriskt värde")
  expect_that(length(matrix_trace(test_matA)), is_equivalent_to(1),
              info="Fel: Funktionen returnerar inte ett element (numeriskt)")
  expect_that(matrix_trace(test_matA), 
              is_equivalent_to(22), 
              info="Fel: Returnerar fel värde för en 2 * 2 matris.")
  expect_that(matrix_trace(test_matB),
              is_equivalent_to(21), 
              info="Fel: Returnerar fel värde för en 2 * 2 matris.")
  expect_that(matrix_trace(test_matC), 
              is_equivalent_to(99), 
              info="Fel: Returnerar fel värde för en 3 * 3 matris.")
  expect_that(matrix_trace(test_matD), 
              is_equivalent_to(57), 
              info="Fel: Returnerar fel värde för en 4 * 4 matris.")  
})
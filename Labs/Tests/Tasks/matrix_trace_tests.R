context("matrix_trace()")

test_that("matrix_trace", {
  
  test_matA <- matrix(2*4:7,nrow=2)
  test_matB <- matrix(9:12,nrow=2)
  test_matC <- matrix(7:15 * 3, nrow=3)
  test_matD <- matrix(2:17 * 1.5, nrow=4)
  
  expect_true(exists("matrix_trace"),
              info = "Fel: matrix_trace() saknas.")
  expect_true(is.function(matrix_trace),
              info = "Fel: matrix_trace är inte en funktion.")
  
  expect_function_arguments(object = matrix_trace,expected = c("X"),
                            info = "Fel: Argumenten i funktionen har felaktiga namn.")

  expect_function_self_contained(object = matrix_trace,
                        "Fel: Funktionen innehåller fria variabler")
  
  expect_silent(matrix_trace)
  
  expect_true(class(matrix_trace(test_matA))=="numeric",
              info="Fel: Funktionen returnerar inte ett numeriskt värde")
  
  expect_true(length(matrix_trace(test_matA))==1,
              info="Fel: Funktionen returnerar inte ett element (numeriskt)")
  
  expect_true(matrix_trace(test_matA)==22, 
              info="Fel: Returnerar fel värde för en 2 * 2 matris.")
  
  expect_true(matrix_trace(test_matB)==21,
              info="Fel: Returnerar fel värde för en 2 * 2 matris.")
  
  expect_true(matrix_trace(test_matC)==99, 
              info="Fel: Returnerar fel värde för en 3 * 3 matris.")
  
  expect_true(matrix_trace(test_matD)==57, 
              info="Fel: Returnerar fel värde för en 4 * 4 matris.")  
  
  expect_function_code(object = matrix_trace, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})
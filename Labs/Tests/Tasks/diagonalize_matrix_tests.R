### Assignment : diagonalize_matrix() ###

context("diagonalize_matrix()")

test_that("Assignment: diagonalize_matrix", {
  X <- matrix(c(-1,-3,-3,3,5,3,-1,-1,1),ncol=3)
  
  expect_true(exists("diagonalize_matrix"),
              info = "Fel: diagonalize_matrix() saknas.")
  checkmate::expect_function(diagonalize_matrix, nargs = 1)
  expect_function_self_contained(diagonalize_matrix)
  
  expect_function_arguments(diagonalize_matrix, c("X"))
  
  checkmate::expect_class(diagonalize_matrix(X), "list")

  expect_silent(diagonalize_matrix(X))
    
  expect_names(names(diagonalize_matrix(X)), permutation.of = c("D", "P", "Pinv"))
  
  checkmate::expect_class(diagonalize_matrix(X)$D, "matrix")
  
  checkmate::expect_class(diagonalize_matrix(X)$P, "matrix")
  
  checkmate::expect_class(diagonalize_matrix(X)$Pinv, "matrix")
  
  expect_error(diagonalize_matrix(matrix(c(3,3,2,2),byrow = TRUE, ncol=2)),
              info = "Fel: Funktionen avbryter inte for singulara matriser (det(A) = 0).")
  
  # Check that mat$P %*% mat$D %*% mat$Pinv returns the matrix
  result1 <- diagonalize_matrix(matrix(3:6, ncol=2))
  expect_equal(diag(result1$D), c(9.22, -0.22), tolerance = 0.01, info="result <- diagonalize_matrix(matrix(3:6, ncol=2))")
  expect_equal(result1$P %*% result1$D %*% result1$Pinv, matrix(3:6, ncol=2), tolerance = 0.01, info="result <- diagonalize_matrix(matrix(3:6, ncol=2))")

  B <- matrix(c(-1,-3,-3, 3, 5, 3, -1, -1, 1),ncol=3)
  result2 <- diagonalize_matrix(B)
  expect_equal(diag(result2$D), c(2,2,1), tolerance = 0.01, info = "D is incorrect.")
  expect_equal(result2$P %*% result2$D %*% result2$Pinv, B, tolerance = 0.01, info="P * D * Pinv != original matrix.")
  
})

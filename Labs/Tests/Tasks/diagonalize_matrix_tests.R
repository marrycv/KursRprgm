### Assignment : diagonalize_matrix() ###

context("diagonalize_matrix()")

test_that("Assignment: diagonalize_matrix", {
  X <- matrix(c(-1,-3,-3,3,5,3,-1,-1,1),ncol=3)
  expect_that(exists("diagonalize_matrix"), is_true(),
              info = "Fel: diagonalize_matrix() saknas.")
  expect_that(diagonalize_matrix, is_a("function"),
              info = "Fel: diagonalize_matrix ska vara en funktion.")
  expect_self_contained(object = diagonalize_matrix,
                        "Fel: Funktionen har fria variabler")
  expect_that(all(names(formals(diagonalize_matrix)) %in% c("X")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(class(diagonalize_matrix(X)), 
              is_equivalent_to("list"),
              info="Fel: Funktionen returnerar inte en lista")
  expect_that(all(names(diagonalize_matrix(X)) %in% 
              c("D", "P", "Pinv")), is_true(),
              info="Fel: Funktionen returnerar inte korrekta listelementnamn.")
  expect_that(class(diagonalize_matrix(X)$D), 
              is_equivalent_to("matrix"),
              info="Fel: D ska vara en matris")
  expect_that(class(diagonalize_matrix(X)$P), 
              is_equivalent_to("matrix"),
              info="Fel: P ska vara en matris")
  expect_that(class(diagonalize_matrix(X)$Pinv), 
              is_equivalent_to("matrix"),
              info="Fel: Pinv ska vara en matris")
  expect_error(diagonalize_matrix(matrix(c(3,3,2,2),byrow = TRUE,ncol=2)),
              info = "Fel: Funktionen avbryter inte för singulära matriser (det(A) = 0).")
  
  # Check that mat$P %*% mat$D %*% mat$Pinv returns the matrix
  A <- matrix(3:6,ncol=2)
  mat <- diagonalize_matrix(A)
  expect_true(all(diag(round(mat$D,2)) %in% c(9.22, -0.22)), 
              info="Fel: Berakning av D")
  expect_true(all(round(mat$P %*% mat$D %*% mat$Pinv) == A), 
              info="Fel: P %*% D %*% Pinv returnerar inte den ursprungliga matrisen.")  
    
  B <- matrix(c(-1,-3,-3,3,5,3,-1,-1,1),ncol=3)
  mat <- diagonalize_matrix(B)
  expect_true(all(diag(round(mat$D,2)) %in% c(2,2,1)), 
              info="Fel: Berakning av D ar felaktig.")
  expect_true(all(round(mat$P %*% mat$D %*% mat$Pinv) == B), 
              info="Fel: P %*% D %*% Pinv returnerar inte den ursprungliga matrisen.")  

})

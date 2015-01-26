### Assignment : diagonalize_matrix() ###

test_that("Assignment: diagonalize_matrix", {
    
  expect_that(exists("diagonalize_matrix"), is_true(),
              info = "Fel: diagonalize_matrix() saknas.")
  expect_that(diagonalize_matrix, is_a("function"),
              info = "Fel: diagonalize_matrix ska vara en funktion.")
  expect_self_contained(object = diagonalize_matrix,
                        "Fel: Funktionen har fria variabler")
  expect_that(all(names(formals(diagonalize_matrix)) %in% c("X")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(class(diagonalize_matrix(matrix(1:4,ncol=2))), 
              is_equivalent_to("list"),
              info="Fel: Funktionen returnerar inte en lista")
  expect_that(all(names(diagonalize_matrix(matrix(1:4,ncol=2))) %in% 
              c("D", "P", "Pinv")), is_true(),
              info="Fel: Funktionen returnerar inte korrekta listelementnamn.")
  expect_that(class(diagonalize_matrix(matrix(1:4,ncol=2))$D), 
              is_equivalent_to("matrix"),
              info="Fel: D ska vara en matris")
  expect_that(class(diagonalize_matrix(matrix(1:4,ncol=2))$P), 
              is_equivalent_to("matrix"),
              info="Fel: P ska vara en matris")
  expect_that(class(diagonalize_matrix(matrix(1:4,ncol=2))$Pinv), 
              is_equivalent_to("matrix"),
              info="Fel: Pinv ska vara en matris")
  
  expect_equal(round(diagonalize_matrix(matrix(3:6,ncol=2))$Pinv,2)[1,], 
               c(-0.54, -0.85),
              info="Fel: berakning av Pinv")
  expect_equal(round(diagonalize_matrix(matrix(3:6,ncol=2))$P,2)[1,], 
               c(-0.63, -0.84),
               info="Fel: berakning av P")
  expect_equal(round(diagonalize_matrix(matrix(3:6,ncol=2))$D,2)[1,], 
               c(9.22, 0),
               info="Fel: berakning av D")
  
  expect_equal(round(diagonalize_matrix(matrix(10:18,ncol=3))$Pinv,2)[3,], 
               c(0.41, -0.82, 0.41),
               info="Fel: berakning av Pinv")
  expect_equal(round(diagonalize_matrix(matrix(10:18,ncol=3))$P,2)[1,], 
               c(-0.54, -0.80, 0.41),
               info="Fel: P")
  expect_equal(round(diagonalize_matrix(matrix(10:18,ncol=3))$D,2)[2,2], 
               c(-0.42), info="Fel: berakning av D")
  expect_equal(round(diagonalize_matrix(matrix(10:18,ncol=3))$D,2)[1,1], 
               c(42.42), info="Fel: berakning av D")
  expect_equal(round(diagonalize_matrix(matrix(10:18,ncol=3))$D,2)[3,3], 
               c(0), info="Fel: berakning av D")
})

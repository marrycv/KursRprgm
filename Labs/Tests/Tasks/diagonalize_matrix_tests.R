### Assignment : diagonalize_matrix() ###

test_that("Assignment: diagonalize_matrix", {
    
  expect_that(exists("diagonalize_matrix"), is_true(),
              info = "Fel: diagonalize_matrix() saknas.")
  expect_that(diagonalize_matrix, is_a("function"),
              info = "Fel: diagonalize_matrix är inte en funktion.")
  expect_self_contained(object = diagonalize_matrix,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(diagonalize_matrix)) %in% c("X")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(class(diagonalize_matrix(1:3)), 
              is_equivalent_to("matrix"),
              info="Fel: Funktionen returnerar inte en matrix")
  expect_equal(dim(diagonalize_matrix(1:5)), c(3,3),
               info="Fel: Funktionen returnerar en matrix med fel dimension")
  expect_equal(dim(diagonalize_matrix(1)), c(1,1),
               info="Fel: Funktionen returnerar en matrix med fel dimension för diagonalize_matrix(1)")
  expect_equal(diagonalize_matrix(1:9)[3:4,5], c(3,2),
               info="Fel: Funktionen returnerar en felaktig matris med diagonalize_matrix(1:9)")

 


})

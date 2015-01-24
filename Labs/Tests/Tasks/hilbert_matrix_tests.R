
context("hilbert_matrix()")

test_that("hilbert_matrix()", {  
  expect_that(exists("hilbert_matrix"), is_true(),
              info = "Fel: hilbert_matrix() saknas.")
  expect_that(hilbert_matrix, is_a("function"),
              info = "Fel: hilbert_matrix är inte en funktion.")
  expect_self_contained(object = hilbert_matrix,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(hilbert_matrix)) %in% c("nrow", "ncol")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(class(hilbert_matrix(1,1)), 
              is_equivalent_to("matrix"),
              info="Fel: Funktionen returnerar inte en matrix")
  expect_equal(dim(hilbert_matrix(nrow=2, ncol=2)), c(2,2),
               info="Fel: Funktionen returnerar en matrix med fel dimension")
  expect_equal(dim(hilbert_matrix(nrow=5, ncol=1)), c(5,1),
               info="Fel: Funktionen returnerar en matrix med fel dimension")
  expect_equal(round(as.vector(hilbert_matrix(nrow=2, ncol=2)), 3), c(1.000,0.500,0.500,0.333),
               info="Fel: Funktionen returnerar en felaktik matris med hilbert_matrix(nrow=2, ncol=2)")
  expect_equal(round(as.vector(hilbert_matrix(nrow=10, ncol=10)), 3)[13:14], c(0.25, 0.20),
               info="Fel: Funktionen returnerar en felaktik matris med hilbert_matrix(nrow=10, ncol=10)")

})

context("toeplitz_matrix()")

test_that("toeplitz_matrix()", {  
  expect_that(exists("toeplitz_matrix"), is_true(),
              info = "Fel: toeplitz_matrix() saknas.")
  expect_that(toeplitz_matrix, is_a("function"),
              info = "Fel: toeplitz_matrix är inte en funktion.")
  expect_self_contained(object = toeplitz_matrix,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(toeplitz_matrix)) %in% c("x")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(class(toeplitz_matrix(1:3)), 
              is_equivalent_to("matrix"),
              info="Fel: Funktionen returnerar inte en matrix")
  expect_equal(dim(toeplitz_matrix(1:5)), c(3,3),
               info="Fel: Funktionen returnerar en matrix med fel dimension")
  expect_equal(dim(toeplitz_matrix(1)), c(1,1),
               info="Fel: Funktionen returnerar en matrix med fel dimension för toeplitz_matrix(1)")
  expect_equal(toeplitz_matrix(1:9)[3:4,5], c(3,2),
               info="Fel: Funktionen returnerar en felaktig matris med toeplitz_matrix(1:9)")
  expect_equal(toeplitz_matrix(1:11)[6,6], c(1),
               info="Fel: Funktionen returnerar en felaktig matris med toeplitz_matrix(1:11)")
  expect_equal(toeplitz_matrix(1:11)[1,6], c(6),
               info="Fel: Funktionen returnerar en felaktig matris med toeplitz_matrix(1:11)")
  expect_equal(toeplitz_matrix(1:11)[6,1], c(11),
               info="Fel: Funktionen returnerar en felaktig matris med toeplitz_matrix(1:11)")
  expect_error(toeplitz_matrix(1:4),
               info="Fel: Funktionen avbryter/stoppar om x har jämt antal element.")
})
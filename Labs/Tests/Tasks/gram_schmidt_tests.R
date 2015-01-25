
context("gram_schmidt()")

test_that("gram_schmidt()", {  
  expect_that(exists("gram_schmidt"), is_true(),
              info = "Fel: gram_schmidt() saknas.")
  expect_that(gram_schmidt, is_a("function"),
              info = "Fel: gram_schmidt är inte en funktion.")
  expect_self_contained(object = gram_schmidt,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(gram_schmidt)) %in% c("X")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_is(gram_schmidt(matrix(1:4, ncol=2)),class = "matrix",
               info="Fel: Funktionen returnerar inte en matris")
  expect_equal(as.vector(round(gram_schmidt(matrix(1:4, ncol=2)),2)),c(0.45, 0.89, 0.89, -0.45),
               info="Fel: Funktionen returnerar fel ortonormering med gram_schmidt(matrix(1:4, ncol=2))")
  expect_equal(as.vector(round(gram_schmidt(matrix(1:9, ncol=3)),2))[2:4], c(0.53, 0.80, 0.87),
               info="Fel: Funktionen returnerar fel ortonormering med gram_schmidt(matrix(1:9, ncol=3))")
  expect_equal(as.vector(round(gram_schmidt(matrix(1:25, ncol=5)),2))[12:14], c(0.49,0.45,0.27),
               info="Fel: Funktionen returnerar fel ortonormering med gram_schmidt(matrix(1:25, ncol=3))")
  expect_error(gram_schmidt("Pelle"),
               info="Fel: Funktionen avbryter/stoppar inte om X är något annat än en matris")
})
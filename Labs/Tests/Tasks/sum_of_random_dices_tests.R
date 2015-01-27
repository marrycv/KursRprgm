### Assignment : sum_of_random_dices() ###

context("sum_of_random_dices()")

test_that("Assignment: sum_of_random_dices()", {
  
  # ladda in test-data:

  expect_that(exists("sum_of_random_dices"), is_true(),
              info = "Fel: sum_of_random_dices() saknas.")
  expect_that(sum_of_random_dices, is_a("function"),
              info = "Fel: sum_of_random_dices är inte en funktion.")
  expect_that(all(names(formals(sum_of_random_dices)) %in% c("K","lambda","my_seed")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
  
  res <- sum_of_random_dices(K=10,lambda=2,my_seed=4711)
  expect_that(res, is_a("data.frame"),
              info = "Fel: Funktionen returnerar inte en data.frame")
  expect_that(all(colnames(res) %in% c("value", "dices")), is_true(),
              info = "Fel: Den returnerade data.framen har fel variabelnamn.")
  expect_equal(nrow(res), 10,
              info = "Fel: Den returnerade data.framen har fel antal rader.")
  expect_equal(res$value[2:7], c(1,1,0,7,1,10),
               info = "Fel: Den returnerade data.framen har fel i 'value'.")
  expect_equal(res$dices[2:4], c(1,1,0),
               info = "Fel: Den returnerade data.framen har fel i 'dices'.")
  
  res <- sum_of_random_dices(K=15,lambda=6,my_seed=4711)
  expect_equal(nrow(res), 15,
               info = "Fel: Den returnerade data.framen har fel antal rader.")
  expect_equal(res$value[12:14], c(36,27,16),
               info = "Fel: Den returnerade data.framen har fel i 'value'.")
  expect_equal(res$dices[10:11], c(10, 5),
               info = "Fel: Den returnerade data.framen har fel i 'dices'.")
  
})

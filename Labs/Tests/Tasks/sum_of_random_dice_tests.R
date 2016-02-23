### Assignment : sum_of_random_dice() ###

context("sum_of_random_dice()")

test_that("Assignment: sum_of_random_dice()", {
  
  # ladda in test-data:

  expect_that(exists("sum_of_random_dice"), is_true(),
              info = "Fel: sum_of_random_dice() saknas.")
  expect_that(sum_of_random_dice, is_a("function"),
              info = "Fel: sum_of_random_dice är inte en funktion.")
  expect_that(all(names(formals(sum_of_random_dice)) %in% c("K","lambda","my_seed")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen ar fel.")
  
  res <- sum_of_random_dice(K=10,lambda=2,my_seed=4711)
  expect_that(res, is_a("data.frame"),
              info = "Fel: Funktionen returnerar inte en data.frame")
  expect_that(all(colnames(res) %in% c("value", "dice")), is_true(),
              info = "Fel: Den returnerade data.framen har fel variabelnamn.")
  expect_equal(nrow(res), 10,
              info = "Fel: Den returnerade data.framen har fel antal rader.")

  res <- sum_of_random_dice(K=15,lambda=6,my_seed=4711)
  expect_equal(nrow(res), 15,
               info = "Fel: Den returnerade data.framen har fel antal rader.")
  
  res <- sum_of_random_dice(K=5000,lambda=6)
  #res <- sum_of_random_dice(K=2000,lambda=6)
  res_mean1 <- round(mean(res[,1]),2)
  res_sd1 <- round(sd(res[,1]),2)
  res_mean2 <- round(mean(res[,2]),2)
  res_sd2 <- round(sd(res[,2]),2)
  expect_more_than(object = res_mean1, 20.25,
    info = "Fel: 'value' beraknas felaktigt.")
  expect_less_than(object = res_mean1, 21.75,
    info = "Fel: 'value' beraknas felaktigt.")
  expect_more_than(object = res_sd1, 8.95,
    info = "Fel: 'value' beraknas felaktigt.")
  expect_less_than(object = res_sd1, 10.05,
    info = "Fel: 'value' beraknas felaktigt.")
  
  expect_more_than(object = res_mean2, 5.85,
                   info = "Fel: 'dice' beraknas felaktigt.")
  expect_less_than(object = res_mean2, 6.15,
                   info = "Fel: 'dice' beraknas felaktigt.")
  expect_more_than(object = res_sd2, 2.3,
                   info = "Fel: 'dice' beraknas felaktigt.")
  expect_less_than(object = res_sd2, 2.6,
                   info = "Fel: 'dice' beraknas felaktigt.")
})

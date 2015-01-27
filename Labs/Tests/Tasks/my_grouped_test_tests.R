### Assignment : my_grouped_test() ###

test_that("Assignment: my_grouped_test()", {
      
  # General tests
  expect_that(exists("my_grouped_test"), is_true(),
              info = "Fel: my_grouped_test() saknas.")
  expect_that(my_grouped_test, is_a("function"),
              info = "Fel: my_grouped_test är inte en funktion.")
  expect_that(all(names(formals(my_grouped_test)) %in% c("data_vector","my_groups","alpha")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
  
  data(chickwts)
  chick <- my_grouped_test(chickwts[,1],chickwts[,2],0.05)
  expect_is(chick, "matrix",
            info = "Fel: Funktionen returnerar inte en matris")
  expect_true(all(colnames(chick) %in% 
                    c("Lower CI-limit", "Mean", "Upper CI-limit", "No of obs.")),
              info = "Fel: Funktionen returnerar fel kolumnnamn.")
  expect_true(all(rownames(chick) %in% 
                    c("casein", "horsebean", "linseed", "meatmeal", "soybean", "sunflower")),
              info = "Fel: Funktionen returnerar fel radnamn.")
  expect_equal(dim(chick), c(6,4),
            info = "Fel: Funktionen returnerar inte en matris av rätt storlek.")
  expect_equal(round(chick["soybean", "Mean"], 2), 
               246.43, info = "Fel: Funktionen returnerar fel värde på 'Mean'.")
  expect_equal(round(chick["meatmeal", "Upper CI-limit"], 2), 
               320.51, info = "Fel: Funktionen returnerar fel värde på 'CI-limit'.")
  expect_equal(round(chick["meatmeal", "No of obs."], 2), 
               11, info = "Fel: Funktionen returnerar fel värde på 'No of obs.'.")
    
  data(InsectSprays)
  # Test 1 - InsectSprays data
  chick <- my_grouped_test(InsectSprays$count,InsectSprays$spray,0.1)
  expect_is(chick, "matrix",
            info = "Fel: Funktionen returnerar inte en matris")
  expect_true(all(colnames(chick) %in% 
                    c("Lower CI-limit", "Mean", "Upper CI-limit", "No of obs.")),
              info = "Fel: Funktionen returnerar fel kolumnnamn.")
  expect_true(all(rownames(chick) %in% 
                    c("A","B","C","D","E","F")),
              info = "Fel: Funktionen returnerar fel radnamn.")
  expect_equal(dim(chick), c(6,4),
               info = "Fel: Funktionen returnerar inte en matris av rätt storlek.")
  expect_equal(round(chick["B", "Mean"], 2), 
               15.33, info = "Fel: Funktionen returnerar fel värde på 'Mean'.")
  expect_equal(round(chick["F", "Upper CI-limit"], 2), 
               19.89, info = "Fel: Funktionen returnerar fel värde på 'CI-limit'.")
  expect_equal(round(chick["D", "No of obs."], 2), 
               12, info = "Fel: Funktionen returnerar fel värde på 'No of obs.'.")
  
})


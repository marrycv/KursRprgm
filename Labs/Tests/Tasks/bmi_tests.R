### Assignment : bmi() ###
context("bmi()")

test_that("Assignment: bmi()", {
  expect_that(exists("bmi"), is_true(),
              info = "Fel: bmi() saknas.")
  expect_that(bmi, is_a("function"),
              info = "Fel: bmi är inte en funktion.")
  expect_self_contained(object = bmi,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(bmi)) %in% c("body_weight","body_height")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.numeric(bmi(body_weight = 71, body_height = 1.78)), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  expect_equal(bmi(body_weight = 71, body_height = 1.78), 22.40879, tolerance = .001,
               info = "Fel: Fungerar inte för body_weight > 0 och body_height > 0")
  expect_equal(bmi(body_weight = 93, body_height = 1.88), 26.31281, tolerance = .001,
               info = "Fel: Fungerar inte för body_weight > 0 och body_height > 0")
  expect_warning(bmi(body_weight = 0, body_height = 1.78),
               info = "Fel: Genererar inget varningsmeddelande (då body_weight <= 0)")
  expect_warning(bmi(body_weight = -3, body_height = 1.78), "body_weight is not positive",
                 info = "Fel: Genererar fel varningsmeddelande (då body_weight <= 0)")
  expect_warning(bmi(body_weight = 71, body_height = 0),
                 info = "Fel: Genererar inget varningsmeddelande (då body_weight <= 0)")
  expect_warning(bmi(body_weight = 71, body_height = -2), "body_height is not positive",
                 info = "Fel: Genererar fel varningsmeddelande (då body_weight <= 0)")
  expect_warning(bmi(body_weight = -1, body_height = 0), "body_weight is not positive",
                 info = "Fel: Genererar fel varningsmeddelande (då body_weight <= 0)")  
  expect_warning(bmi(body_weight = 0, body_height = -2), "body_height is not positive",
                 info = "Fel: Genererar fel varningsmeddelande (då body_weight <= 0)")  
  
  expect_function_code(object = bmi, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})

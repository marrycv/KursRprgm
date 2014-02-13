### Assignment : bmi() ###

test_that("Assignment: bmi()", {
  expect_that(bmi, is_a("function"),
              info = "Fel: bmi är inte en funktion.")
  expect_that(all(names(formals(bmi)) %in% c("bodyWeight","bodyHeight")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(is.numeric(bmi(bodyWeight = 71, bodyHeight = 1.78)), condition=is_true(),
              info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  expect_equal(bmi(bodyWeight = 71, bodyHeight = 1.78), 22.40879, tolerance = .00001,
               info = "Fel: Fungerar inte för bodyWeight > 0 och bodyHeight > 0")
  expect_equal(bmi(bodyWeight = 93, bodyHeight = 1.88), 26.31281, tolerance = .00001,
               info = "Fel: Fungerar inte för bodyWeight > 0 och bodyHeight > 0")
  expect_warning(bmi(bodyWeight = 0, bodyHeight = 1.78),
               info = "Fel: Genererar inget varningsmeddelande (då bodyWeight <= 0)")
  expect_warning(bmi(bodyWeight = -3, bodyHeight = 1.78), "bodyWeight is not positive",
                 info = "Fel: Genererar fel varningsmeddelande (då bodyWeight <= 0)")
  expect_warning(bmi(bodyWeight = 71, bodyHeight = 0),
                 info = "Fel: Genererar inget varningsmeddelande (då bodyWeight <= 0)")
  expect_warning(bmi(bodyWeight = 71, bodyHeight = -2), "bodyHeight is not positive",
                 info = "Fel: Genererar fel varningsmeddelande (då bodyWeight <= 0)")
  expect_warning(bmi(bodyWeight = -1, bodyHeight = 0), "bodyWeight is not positive",
                 info = "Fel: Genererar fel varningsmeddelande (då bodyWeight <= 0)")  
  expect_warning(bmi(bodyWeight = 0, bodyHeight = -2), "bodyHeight is not positive",
                 info = "Fel: Genererar fel varningsmeddelande (då bodyWeight <= 0)")  
})

context("two_by_two_det()")

test_that("two_by_two_det()", {  
  expect_that(exists("two_by_two_det"), is_true(),
              info = "Fel: two_by_two_det() saknas.")
  expect_that(two_by_two_det, is_a("function"),
              info = "Fel: two_by_two_det är inte en funktion.")
  expect_self_contained(object = two_by_two_det,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(two_by_two_det)) %in% c("x")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_equal(two_by_two_det(matrix(1:4, ncol=2)),c(-2),
               info="Fel: Funktionen returnerar fel determinant för matrix(1:4, ncol=2)")
  expect_equal(two_by_two_det(matrix(9:12, ncol=2)),c(-2),
               info="Fel: Funktionen returnerar fel determinant för two_by_two_det(matrix(9:12, ncol=2)")
  expect_error(two_by_two_det(matrix(1:9, ncol=3)),
               info="Fel: Funktionen avbryter/stoppar inte 3*3 matriser")
  expect_error(two_by_two_det("test"),
               info="Fel: Funktionen avbryter/stoppar om x inte är en matris.")
})
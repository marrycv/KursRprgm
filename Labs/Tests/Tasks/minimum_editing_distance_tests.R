### Assignment : diagonalize_matrix() ###

context("minimum_editing_distance()")

test_that("Assignment: minimum_editing_distance", {

  expect_true(exists("minimum_editing_distance"),
              info = "Fel: minimum_editing_distance() saknas.")
  checkmate::expect_function(minimum_editing_distance, nargs = 2)
  expect_function_self_contained(minimum_editing_distance)
  expect_function_arguments(minimum_editing_distance, c("x", "y"))

  expect_silent(minimum_editing_distance("sitting", "kitten"))
  expect_error(minimum_editing_distance(2, "kitten"))
  expect_error(minimum_editing_distance("sitting", 3))
  
  checkmate::expect_class(minimum_editing_distance("sitting", "kitten"), "numeric")
  
  expect_no_forbidden_function_code(minimum_editing_distance, forbidden = "adist",
                                    info="Funktionen adist() är inte tillåten!")
  
  expect_equal(minimum_editing_distance("jobbar", "hoppa"), 4)  
  expect_equal(minimum_editing_distance("sitting", "kitten"), 3)
  expect_equal(minimum_editing_distance(" ", "R!"), 2)
  expect_equal(minimum_editing_distance("Josef Wilzen", "Mans Magnusson"), 12)
  expect_equal(minimum_editing_distance("programmering", "statistik"), 11)
  expect_equal(minimum_editing_distance("programmering", "matematik"), 11)
  expect_equal(minimum_editing_distance("matematik", "statistik"), 5)
  
  x <- "a dcmk eamdowmecmxeqecm "
  y <- "mmwqmMMqwdmk ecj wec "
  expect_equal(minimum_editing_distance(x, y), 17)

})

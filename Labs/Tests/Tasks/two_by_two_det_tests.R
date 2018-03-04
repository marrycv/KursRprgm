
context("two_by_two_det()")

test_that("two_by_two_det()", {  
  expect_true(exists("two_by_two_det"),
              info = "Fel: two_by_two_det() saknas.")
  checkmate::expect_function(two_by_two_det, nargs = 1)

  expect_function_self_contained(object = two_by_two_det)
  
  expect_function_arguments(two_by_two_det, c("x"))
  
  expect_error(two_by_two_det("test"),
               info="Fel: Funktionen avbryter/stoppar inte om x inte är en matris.")
  expect_error(two_by_two_det("test"),"Not an object of class matrix.",
               info="Fel: Funktionen ger inte rätt felmeddelande om x inte är en matris.")
  
  expect_error(two_by_two_det(matrix(1:9, ncol=3)),
               info="Fel: Funktionen avbryter/stoppar inte för 3*3 matriser")
  expect_error(two_by_two_det(matrix(1:9, ncol=3)),"Matrix not of size 2*2.",
               info="Fel: Funktionen returnerar inte rätt felmeddelande för 3*3 matriser")
  
  expect_equal(two_by_two_det(matrix(1:4, ncol=2)),c(-2),
               info="Fel: Funktionen returnerar fel determinant för x=matrix(1:4, ncol=2)")
  expect_equal(two_by_two_det(matrix(9:12, ncol=2)),c(-2),
               info="Fel: Funktionen returnerar fel determinant för two_by_two_det(matrix(9:12, ncol=2)")
  
  expect_function_code(object = two_by_two_det, expected = "return\\(", 
                       info = "Fel: return() saknas i funktionen.")
  
  
})
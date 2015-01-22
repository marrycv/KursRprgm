### Assignment : babylon() ###
context("babylon()")

test_that("Assignment: babylon()", {
  expect_that(exists("babylon"), is_true(),
              info = "Fel: babylon() saknas.")
  expect_that(babylon, is_a("function"),
              info = "Fel: babylon är inte en funktion.")
  expect_self_contained(object = babylon,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(babylon)) %in% c("x", "init", "tol")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(babylon(x=2, init=1.5, tol=0.01), is_a("list"),
              info = "Fel: Funktionen returnerar inte en lista.")
  expect_that(all(names(babylon(x=2, init=1.5, tol=0.01)) %in% c("iter", "rot")), condition=is_true(),
              info = "Fel: Funktionen returnerar inte en med rätt namngivna element.")
  expect_equal(babylon(x=2, init=1.5, tol=0.01)$rot, 1.414216, tolerance = .01,
              info = "Fel: Approximationen är felaktig för x = 2, init = 1.5 och tol = 0.01.")
  expect_equal(babylon(x=2, init=1.5, tol=0.01)$iter, 2,
               info = "Fel: Antalet iterationer är felaktig för x = 2, init = 1.5 och tol = 0.01.")  
  expect_that(babylon(x=2, init=1.5, tol=0.01)$rot == sqrt(2), is_false(),
               info = "Fel: Ingen approximation gjorde, utan det exakta värdet används.")  
  expect_equal(babylon(x=15, init=1.5, tol=0.01)$rot, 3.872, tolerance = .01,
               info = "Fel: Approximationen är felaktig för x = 15, init = 1.5 och tol = 0.01.")
  expect_equal(babylon(x=15, init=1.5, tol=0.01)$iter, 5,
               info = "Fel: Antalet iterationer är felaktig för x = 15, init = 1.5 och tol = 0.01.")
  expect_equal(babylon(x=15, init=0.1, tol=0.01)$rot, 3.872, tolerance = .01,
               info = "Fel: Approximationen är felaktig för x = 15, init = 1.5 och tol = 0.01.")
  expect_equal(babylon(x=15, init=0.1, tol=0.01)$iter, 9,
               info = "Fel: Antalet iterationer är felaktig för x = 15, init = 1.5 och tol = 0.01.")  
  expect_function_code(object = babylon, expected = "return\\(", 
                       info = "Fel: return() saknas i funktionen.")
})


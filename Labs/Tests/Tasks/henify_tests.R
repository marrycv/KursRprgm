### Assignment : henify() ###

context("henify()")

test_that("Assignment: henify()", {
    
  test1 <- c("Hon, hankar handskar, han", "handlar du honorarer?","honartad hona han.")
  test2 <- c("Hon, han, honom, Han, hon, hen, hankar handskar, han")
  
  # Övergripande om funktionen:
  expect_that(exists("henify"), is_true(),
              info = "Fel: henify() saknas.")
  expect_that(henify, is_a("function"),
              info = "Fel: henify är inte en funktion.")
  expect_that(all(names(formals(henify)) %in% c("text")), condition=is_true(),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
  expect_that(henify(text=test1), is_a("character"),
              info = "Fel: Funktionen returnerar inte en character-vektor")
 

  # testfall:
  expect_equal(henify(text=test1)[1], "Hen, hankar handskar, hen",
              info = "Fel: Funktionen fungerar inte för 'Hon, hankar handskar, han'")
  expect_equal(henify(text=test1)[2], "handlar du honorarer?",
               info = "Fel: Funktionen fungerar inte för 'handlar du honorarer?'")
  expect_equal(henify(text=test1)[3], "honartad hona hen.",
               info = "Fel: Funktionen fungerar inte för 'honartad hona han.'")
  expect_equal(henify(text=test2), "Hen, hen, honom, Hen, hen, hen, hankar handskar, hen",
               info = "Fel: Funktionen fungerar inte för 'Hon, han, honom, Han, hon, hen, hankar handskar, han'")

  # Testfall 2 i labben:
  test_file_name <- paste0(tempdir(),"/test.txt")
  writeLines(c(test1, test2), test_file_name)
  expect_equal(henify(text=test_file_name)[1], "Hen, hankar handskar, hen",
               info = "Fel: Funktionen kan inte läsa in txt-filer.")  
  unlink(test_file_name)
  
})

### Assignment : henify() ###

context("henify()")

test_that("Assignment: henify()", {
    
  test1 <- c("Hon, hankar handskar, han", "handlar du honorarer?","honartad hona han.")
  test2 <- c("Hon, han, honom, Han, hon, hen, hankar handskar, han")
  test3<-c("hon han abchon abchan honabc hanabc abchonabc abchanabc")
  #test4<-c("Hon Han abcHon abcHan Honabc Hanabc abcHonabc abcHanabc")
  
  
  # Övergripande om funktionen:
  expect_that(exists("henify"), is_true(),
              info = "Fel: henify() saknas.")
  expect_that(henify, is_a("function"),
              info = "Fel: henify ar inte en funktion.")
  expect_that(all(names(formals(henify)) %in% c("text")), condition=is_true(),
              info = "Fel: Namnen pa argumenten i funktionen ar fel.")
  expect_that(henify(text=test1), is_a("character"),
              info = "Fel: Funktionen returnerar inte en character-vektor")
 

  # testfall:
  expect_equal(tolower(henify(text=test1)[1]), "hen, hankar handskar, hen",
              info = "Fel: Funktionen fungerar inte för 'Hon, hankar handskar, han'")
  expect_equal(tolower(henify(text=test1)[2]), "handlar du honorarer?",
               info = "Fel: Funktionen fungerar inte för 'handlar du honorarer?'")
  expect_equal(tolower(henify(text=test1)[3]), "honartad hona hen.",
               info = "Fel: Funktionen fungerar inte för 'honartad hona han.'")
  expect_equal(tolower(henify(text=test2)), "hen, hen, honom, hen, hen, hen, hankar handskar, hen",
               info = "Fel: Funktionen fungerar inte foer 'Hon, han, honom, Han, hon, hen, hankar handskar, han'")

#   expect_equal(tolower(henify(text=test3)), "hen hen abchon abchan honabc hanabc abchonabc abchanabc",
#                info = "Fel: Funktionen fungerar inte för 'hon han abchon abchan honabc hanabc abchonabc abchanabc'")

  

  # Testfall 2 i labben:
  test_file_name <- paste0(tempdir(),"/test.txt")
  writeLines(c(test1, test2), test_file_name)
  expect_equal(tolower(henify(text=test_file_name)[1]), "hen, hankar handskar, hen",
               info = "Fel: Funktionen kan inte lasa in txt-filer.")  
  unlink(test_file_name)
  
})


context("fast_stock_analysis()")

test_that("fast_stock_analysis()", {

  # Ladda ned data för att testa funktionen på
  testFile <- tempfile(pattern="fast_stock_analysis_test_file", fileext=".csv")
  if(!file.exists(testFile)) {
    path <- markmyassignment:::path_type("https://raw.githubusercontent.com/MansMeg/KursRprgm/master/Labs/DataFiles/AppleTest.csv")
    markmyassignment:::get_file.path_http(path = path, dest = testFile)
  }
  
  expect_that(exists("fast_stock_analysis"), is_true(),
              info = "Fel: fast_stock_analysis() saknas.")
  expect_that(fast_stock_analysis, is_a("function"),
              info = "Fel: fast_stock_analysis är inte en funktion.")
  expect_self_contained(object = fast_stock_analysis,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(fast_stock_analysis)) %in% c("file_path", "period_length")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  expect_that(class(fast_stock_analysis(file_path=testFile, period_length=5)), 
              is_equivalent_to("list"), 
              info="Fel: Funktionen returnerar inte en lista")
  expect_that(all(names(fast_stock_analysis(file_path=testFile, period_length=5)) %in% 
                c("total_spridning", "medel_slutpris", "slutpris_upp", "datum")), 
              is_true(), 
              info="Fel: Listans element är inte korrekt namngivna")
  expect_function_code(object = fast_stock_analysis, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
  
  # Create myList1
  myList1 <- fast_stock_analysis(file_path=testFile, period_length=5)
  expect_equal(myList1$total_spridning, 11.82, tolerance = 0.01, 
              info="Fel: Elementet 'total_spridning' är fel.")
  expect_equal(myList1$medel_slutpris, 424.996, tolerance = 0.01, 
               info="Fel: Elementet 'medel_slutpris' är fel.")
  expect_equal(myList1$slutpris_upp, FALSE, 
               info="Fel: Elementet 'slutpris_upp' är fel.")
  expect_equal(myList1$slutpris_upp, FALSE, 
               info="Fel: Elementet 'slutpris_upp' är fel.")
  expect_true(all(myList1$datum %in% c("2012-01-24", "2012-01-18")), 
              info="Fel: Elementet 'datum' är fel.")
  
  expect_equal(myList1$datum, c("2012-01-24", "2012-01-18"), 
               info="Fel: Elementet 'datum' är fel.")

#   expect_equal(myList1, list(total_spridning=11.82,medel_slutpris=424.996,slutpris_upp=FALSE,datum=c("2012-01-24", "2012-01-18")), 
#                info="Fel: Elementet 'datum' är fel.")
  
  # Unlink temporary file
  unlink(testFile)
})

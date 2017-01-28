
context("fast_stock_analysis()")

test_that("fast_stock_analysis()", {

  # Ladda ned data för att testa funktionen på
  testFile <- tempfile(pattern="fast_stock_analysis_test_file", fileext=".csv")
  testFile2 <- tempfile(pattern="fast_stock_analysis_test_file", fileext=".csv")
  if(!file.exists(testFile)) {
    path <- markmyassignment:::path_type("https://raw.githubusercontent.com/MansMeg/KursRprgm/master/Labs/DataFiles/AppleTest.csv")
    markmyassignment:::get_file.path_http(path = path, dest = testFile)
  }
  if(!file.exists(testFile2)) {
    path <- markmyassignment:::path_type("https://raw.githubusercontent.com/MansMeg/KursRprgm/master/Labs/DataFiles/google2.csv")
    markmyassignment:::get_file.path_http(path = path, dest = testFile2)
  }
  
  expect_that(exists("fast_stock_analysis"), is_true(),
              info = "Fel: fast_stock_analysis() saknas.")
  expect_that(fast_stock_analysis, is_a("function"),
              info = "Fel: fast_stock_analysis är inte en funktion.")
  expect_function_self_contained(object = fast_stock_analysis,
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
  #-----------------------------------------------------------------------------------------------
  # Testa för AppleTest.csv och period_length=5
  # Create myList1
  myList1 <- fast_stock_analysis(file_path=testFile, period_length=5)
  expect_equal(myList1$total_spridning, 11.82, tolerance = 0.01, 
              info="Fel: Elementet 'total_spridning' är fel, för AppleTest.csv och period_length=5")
  expect_equal(myList1$medel_slutpris, 424.996, tolerance = 0.01, 
               info="Fel: Elementet 'medel_slutpris' är fel, för AppleTest.csv och period_length=5")
  expect_equal(myList1$slutpris_upp, FALSE, 
               info="Fel: Elementet 'slutpris_upp' är fel, för AppleTest.csv och period_length=5")
  expect_true(all(myList1$datum %in% c("2012-01-24", "2012-01-18")), 
              info="Fel: Elementet 'datum' är fel, för AppleTest.csv och period_length=5")
  
  #expect_equal(myList1$datum, c("2012-01-24", "2012-01-18"), 
  #             info="Fel: Elementet 'datum' är fel, för AppleTest.csv och period_length=5")

#   expect_equal(myList1, list(total_spridning=11.82,medel_slutpris=424.996,slutpris_upp=FALSE,datum=c("2012-01-24", "2012-01-18")), 
#                info="Fel: Elementet 'datum' är fel.")
  
  #-----------------------------------------------------------------------------------------------
  # Testa för AppleTest.csv och period_length=5
  # Create myList2
  myList2 <- fast_stock_analysis(file_path=testFile, period_length=3)
  expect_equal(myList2$total_spridning, 8.9, tolerance = 0.01, 
               info="Fel: Elementet 'total_spridning' är fel, för AppleTest.csv och period_length=3")
  expect_equal(myList2$medel_slutpris, 422.7067, tolerance = 0.01, 
               info="Fel: Elementet 'medel_slutpris' är fel, för AppleTest.csv och period_length=3")
  expect_equal(myList2$slutpris_upp, TRUE, 
               info="Fel: Elementet 'slutpris_upp' är fel, för AppleTest.csv och period_length=3")
  expect_true(all(myList2$datum %in% c("2012-01-24", "2012-01-20")), 
              info="Fel: Elementet 'datum' är fel, för AppleTest.csv och period_length=3")
  
  
  #-----------------------------------------------------------------------------------------------
  # Testa för google2.csv och period_length=20
  # Create myList3
  myList3 <- fast_stock_analysis(file_path=testFile2, period_length=20)
  expect_equal(myList3$total_spridning, 92.25, tolerance = 0.01, 
               info="Fel: Elementet 'total_spridning' är fel, för google2.csv och period_length=20")
  expect_equal(myList3$medel_slutpris, 631.19, tolerance = 0.01, 
               info="Fel: Elementet 'medel_slutpris' är fel, för google2.csv och period_length=20")
  expect_equal(myList3$slutpris_upp, FALSE, 
               info="Fel: Elementet 'slutpris_upp' är fel, för google2.csv och period_length=20")
  expect_true(all(myList3$datum %in% c("2012-01-24", "2011-12-23")), 
              info="Fel: Elementet 'datum' är fel, för google2.csv och period_length=20")
  
  
  # Unlink temporary file
  unlink(testFile)
})


test_that("Assignment: fastAnalysis()", {

  # Ladda ned data för att testa funktionen på
  testFile <- tempfile(pattern="TestFile", fileext=".csv")
  library(downloader)
  download(url="https://raw.github.com/MansMeg/KursRprgm/master/Demonstrations/Apple.csv", 
           destfile=testFile, quiet=TRUE)
    
  expect_that(fastAnalysis, is_a("function"),
              info = "Fel: fastAnalysis är inte en funktion.")
  expect_that(all(names(formals(fastAnalysis)) %in% c("filePath", "periodLength")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  expect_that(class(fastAnalysis(filePath=testFile, periodLength=5)), 
              is_equivalent_to("list"), 
              info="Fel: Funktionen returnerar inte en lista")
  expect_that(all(names(fastAnalysis(filePath=testFile, periodLength=5)) %in% 
                c("total_spridning", "medel_slutpris", "slutpris_upp", "datum")), 
              is_true(), 
              info="Fel: Listans element är inte korrekt namngivna")
  # Create myList1
  myList1 <- fastAnalysis(filePath=testFile, periodLength=5)
  expect_equal(myList1$total_spridning, 11.82, tolerance = 0.01, 
              info="Fel: Elementet 'total_spridning' är fel.")
  expect_equal(myList1$medel_slutpris, 424.996, tolerance = 0.01, 
               info="Fel: Elementet 'medel_slutpris' är fel.")
  expect_equal(myList1$slutpris_upp, FALSE, 
               info="Fel: Elementet 'slutpris_upp' är fel.")
  expect_equal(myList1$slutpris_upp, FALSE, 
               info="Fel: Elementet 'slutpris_upp' är fel.")
  expect_equal(myList1$datum, c("2012-01-24", "2012-01-18"), 
              info="Fel: Elementet 'datum' är fel.")

  # Unlink temporary file
  unlink(testFile)
})

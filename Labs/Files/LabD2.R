#### Programmering i R ####
#### Inlämning, Datalaboration 2 ####

# Ange ditt namn här, ex Namn <- "Alice Walker"
Namn <- "Mitt namn (ex. Måns Magnusson)"
# Ange ditt LiU-ID här, ex LiuId <- "aliwa123"
LiuId  <- "Mitt LiuId (ex. manma97)"


# Uppgift 1: Skottår ----
leapYear <- function(years){
  # Skriv din kod här
}


# Testa: 
# > my_test_years <- c("1900", "1984", "1997", "2000", "2001") 
# > myResult <- leapYear(years = my_test_years) 

# > str(myResult) 
# Korrekt resultat: 
# 'data.frame':  5 obs. of  2 variables:
#   $ years   : num  1900 1984 1997 2000 2001
#   $ leapYear: logi  FALSE TRUE FALSE TRUE FALSE

# > myResult 
# Korrekt resultat: 
#   years leapYear
# 1  1900    FALSE
# 2  1984     TRUE
# 3  1997    FALSE
# 4  2000     TRUE
# 5  2001    FALSE



# Uppgift 2: Spåret av en matris ----
matrixTrace <- function(X){
  # Skriv din kod här
}

# Testa:
# > A <- matrix(2:5, nrow=2)
# > matrixTrace(X = A)
# Korrekt resultat: [1] 7

# > B <- matrix(1:9, nrow=3)
# > matrixTrace(X = B)
# Korrekt resultat: [1] 15


# Uppgift 3: Snabbanalys av aktier ----


fastAnalysis <- function(file, period_length){
  # Skriv din kod här
}

# Testa:
# > appleFil <- "/" # Ange sökväg till var du har filen Apple.csv
# > myList1 <- fastAnalysis(file = appleFil, period_length = 5) 
# > str(myList1)
# Korrekt resultat:
# List of 4
#  $ total_spridning: num 11.8
#  $ medel_slutpris : num 425
#  $ slutpris_upp   : logi FALSE
#  $ datum          : chr [1:2] "2012-01-24" "2012-01-18"

# > myList2 <- fastAnalysis(file = appleFil, period_length = 10) 
# > str(myList2)
# List of 4
#  $ total_spridning: num 12.7
#  $ medel_slutpris : num 424
#  $ slutpris_upp   : logi FALSE
#  $ datum          : chr [1:2] "2012-01-24" "2012-01-10"



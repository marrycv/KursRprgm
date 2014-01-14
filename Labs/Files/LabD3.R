#### Programmering i R ####
#### Inlämning, Datalaboration 3 ####

Namn  #Ange ditt namn här, ex Namn <- "Alice Walker"
LiuId  # Ange ditt namn här, ex LiuId <- "aliwa"


# Uppgift 1: BMI ----

bmi <- function(bodyWeight, bodyHeight){
  # Skriv din kod här
}

# Testa:
# > bmi(bodyWeight = 95, bodyHeight = 1.98)
# Korrekt resultat: [1] 24.23

# > bmi(bodyWeight = 74, bodyHeight = -1.83)
# Korrekt resultat: 
# Warning:  bodyHeight is not positive, calculation is not meaningful
# [1] 22.1

# > bmi(bodyWeight = 0, bodyHeight = 1.63)
# Korrekt resultat: 
# Warning:  bodyWeight is not positive, calculation is not meaningful
# [1] 0

# > bmi(bodyWeight = -73, bodyHeight = 0)
# Korrekt resultat: 
# Warning:  bodyWeight is not positive, calculation is not meaningful
# Warning:  bodyHeight is not positive, calculation is not meaningful
# [1] -Inf


# Uppgift 2: Matrismultiplikation ----

myMatrixProd <- function(A, B){
  # Skriv din kod här
}

# Testa:
# > matX <- matrix(1:6, nrow = 2, ncol = 3)
# > matY <- matrix(6:1, nrow = 3, ncol = 2)
# > myMatrixProd(A = matX, B = matY)
# Korrekt resultat: 
#      [,1] [,2]
# [1,]   41   14
# [2,]   56   20

# > myMatrixProd(A = matY, B = matX)
# Korrekt resultat: 
#      [,1] [,2] [,3]
# [1,]   12   30   48
# [2,]    9   23   37
# [3,]    6   16   26

# > myMatrixProd(A = matX, B = matX) 
# Korrekt resultat: 
# Error : Matrix dimensions mismatch


# Uppgift 3 ----
babylon <- function(x, init, tol){
  # Skriv din kod här
}


# Testa:
# > babylon(x = 2, init = 1.5, tol = 0.01)
# Korrekt resultat: 
# $rot
# [1] 1.414
# $iter 
# [1] 2

# > babylon(x = 3, init = 2, tol = 1e-06)
# Korrekt resultat: 
# $rot
# [1] 1.732
# $iter [1] 4


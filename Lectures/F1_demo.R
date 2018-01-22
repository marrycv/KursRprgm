# Demo-kod: Lecture 1

# variables ----

my_variable <- "Calle"
my variable <- "Calle"

my_vector <- c("Calle", "Blomqvist")
my_vector
my_vector[1]
num_vec <- c(1, 1, 2)
my_vector[num_vec]


my_num <- 1:10
my_num

## Variabeltyper
typeof(my_vector)
typeof(my_num)


# functions ----

# Funktionens innehåll: 
# Skriv en funktion, f, som tar ett värde med argumentet z, och kvadrerar det:

# - Börja med kod som fungerar (men med funktionens argument)


# - Lyft in koden i funktionen


# - Pröva att funktionen fungerar som den ska




# Lokal miljö
f <- function(x, y){
  res <- x+y
  return(res)
}
x <- 5
y <- 5
f(2, 2)


# markmyassignment ----
## Installation
install.packages("markmyassignment")

## Använd paketet
library("markmyassignment")

## Ställ in uppgift
assignment_path <- 
  file.path(system.file(package = "markmyassignment"), "extdata", "example_assignment01.yml")
set_assignment(assignment_path)


## Uppgift:
# Mandatory: Assign you name to my_name 
my_name <- "Mans Magnusson"

## task1: Create a vector with the values pi and e
task1 <- c(2 * pi, exp(1)) # Wrong
task1 <- c(pi, exp(1)) # Correct

## task2: Create a function that return the sum of the first and last element
task2 <- function(vector){
  vector[2] + vector[length(vector)] # Wrong
}

task2 <- function(vector){
  vector[1] + vector[length(vector)] # Correct
}

mark_my_assignment()


# Logik ----

minVektor <- c(12, 1, 2, 7)
minBool <- c(TRUE, FALSE, FALSE, TRUE)
minVektor[minBool]


x <- 1:10
y <- x != 5
z <- x > 2
x[y & !z]



# Datorlabb 1 ----
# Uppgift 1: Three elements



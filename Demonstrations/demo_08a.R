#### Demo 08a: Mer om funktioner ####
#### Författare: Måns Magnusson

# Mer om funktioner ----
# En funktion består av: 
# - ett funktionsnamn, 
# - en funktionsdefinition ( function() )
# - 0 eller fler argument, 
# - kod / beräkningar och
# - return() / returnera "output"

# Exempel:
f <- function(x,y) {
  output <- x^2 - y
  return(output)
}
f(3,2)

# Men vi kan också skapa små funktioner enklare utan ex return() och/eller {}
g <- function(x,y) {
  x^2 - y
}
g(3,2)
# Obs! funktionen returnerar det senaste värdet om inte return() används

# Eller ännu enklare utan { }
h <- function(x,y) x^2 - y
h(3,2)
# Obs! Alltid en avvägning mot hur lättläst koden ska vara

# Argumentens ordning i funktioner spelar roll om argumenten inte anges
f(3, 2) 
f(2, 3)
# Om argumenten inte anges antar R att ordningen i funktionen används

# Men om argumentens namn anges, spelar ordningen ingen roll:
f(x = 3, y = 2) 
f(y = 2, x = 3)


# Funktioner är som vanliga objekt:
# Vi kan titta på funktioner
f

# Spara
save(f,file="minFunktion.Rdata")
rm(list=ls())
# och ladda in från fil...
load(file="minFunktion.Rdata")

# Vi kan också använda funktioner som argument till andra funktioner
SquareFunction <- function(x) {
  return(x^2)
}
integrate(SquareFunction, lower = 0, upper = 1)

# Vi behöver inte först spara ned funktionen om vi vill 
# använda den som argument
integrate(function(x) x^2 , lower = 0, upper = 1)

# Eftersom funktionen inte har något namn, 
# kallas detta för en anonym funktion


# Ibland vill vi att en funktion ska ha ett standardvärde för
# ett argument.
f <- function(x = 10) x^2 - 3
f(10)
f()
# Detta är ett enkelt sätt att styra funktioner, ex:
sd
# har na.rm = FALSE som standard

# Skapa dolda funktioner
hej <- function(x) x^2
.hej<-function(x) x^2
ls()


#### Demo 08b: Lokala och globala mijöer ####
#### Författare: Måns Magnusson

# Varje funktion som arbetar arbetar i en egen lokal miljö
f <- function(x) {
  y <- x^2 
  z <- x^3
  return(y)
}
# Anropar vi funktionen finns varken y eller z i globala miljön.
# De skapas i en temporär lokal miljö som kastas när funktionen 
# har kört klart
f(3)
ls()

# Hur gör R om flera funktioner har samma namn? Ex:
mean <- function(x) sum(x)
mean(1:3)

# R söker efter funktionen i en särskilt ordning. Den funktion som hittas
# först är den funktion som används.

# Sökordning för objekt i R ----
#   1. Lokala miljöer (inne i funktioner) -> söker vidare "uppåt" till:
#   2. Den global miljön (Global enviroment)
#   3. Vidare i ordning i laddade namespaces / paket
# Vi kan se sökordningen med funktionen search()
search()

# Eftersom .GlobalEnv med vår mean funktion ligger först är det 
# denna funktion som R använder (den vanliga mean ligger i base).

# Vi kan anropa en specific funktion direkt med ::
mean(1:3)
base::mean(1:3)
# Detta är bra att känna till när vi börjar med paket


# Fria variabler ----
# Det fungerar på ett linande sätt med "fria variabler"
# Fria variabler är variabler i funktioner som inte är definierade 
# i funktionen
ny <- function(x) {  
  z <- x / y
  return(z)
}
ny(3) # Detta går inte
ny(3, y=3) # Detta går inte

# Men det här:
y <- 5
ny(3)

# Precis som med funktioner följer R ordningen under 
# "Sökordning för objekt i R" ovan för fria variabler.

# MEN: Sökordningen börjar där funktionen definieras!

# Ett mer utförligt exempel
# I h1() är g1() definierad i den globala miljön,
# därför börjas sökningen av y där först
y <- 5
g1 <- function(x) x + y
h1 <- function(x) {
  y <- 3
  out <- g1(x)
  return(out)
}
h1(3)

# I h2() är g2() definierad inne i h2(), därför
# börjas sökningen av y inne i h2() först
y <- 5
h2 <- function(x) {
  g2 <- function(x) x + y
  y <- 3
  out <- g2(x)
  return(out)
}
h2(3)

# Vi kan se var en funktion är definierad med environment
environment(h2)
environment(base::factor)

# Kort om assignment ----
# <- kan användas överallt för att assigna i den aktuella miljön
rm(list = ls())
ls()
x1<-1
fy1 <- function() {
  y <- 1
  return(y)}
fy1()
ls()

# <<- kan användas överallt för att assigna i den globala miljön
x2 <<- 2
fy2 <- function() {
  y <<- 2
  return(y)}
fy2()
ls()

# = fungerar som <-, men kan bara användas i kod (top level), exempel:
mean(vec = c(1:10))
mean(vec <- c(1:10))
# I de kodstilsguider för R avråder från att använda =
# Syftet är att skilja på argument i funktioner och assignment

# I grunden använder sig alla av assign()
assign(x = "x4", value = 10)
x4

# Assign kan vara bra för att skapa flera olika värden med en for - loop
# eller för att tillskriva värden till specifika miljöer
ls()
for (i in 1:5){
  assign(x=paste("var", i, sep=""), i)
}
ls()
var1
var5


# Ellipsis ----
# Vi kan vilja skicka information vidare inom funktioner
# ... sätt som argument och sedan var de godtyckliga argumenten ska
ellipsisEx <- function(...){
  myList <- list(...)
  return(myList)
}

ellipsisEx( x=1:10, y="Hej")

# Vanligast är det när vi ska skicka information inom och mellan funktioner
myMeanComp <- function(x, y, ...){
  xm <- mean(x, ...)  
  ym <- mean(y, ...)  
  output <- max(xm, ym)
  return(output)
}

myMeanComp(x = c(1:10,NA), y = c(1:9))
# Men vi kan nu skicka in argumentet na.rm = TRUE
myMeanComp(x = c(1:10,NA), y = c(1:9), na.rm=TRUE)


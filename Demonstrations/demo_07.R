#### Demo 07: Loopar####
#### Författare: Måns Magnusson

# for - loopar ----
# En for - loop loopar över en godtycklig vektor
vektor <- c("a", "b", "c")
for ( element in vektor ) { 
  print(element) 
}

# Ibland vill vi istället använda index
for ( index in seq_along(vektor) ) { 
  print(vektor[index]) 
}

# Detta är (nog) det vanligaste sättet
for ( index in 1:length(vektor) ) {
  print(vektor[index])
}

# Det går också bra att loopa över en lista
minLista <- list(1:4, "Text", TRUE, list())
for ( element in minLista ) {
  print(element)
}


# Nästlade loopar ----
# Ibland vill vi loopa över flera index (ex. matris och data.frame).
# Med fördel skapas en nästlad loop:
A <- matrix(1:9, nrow = 3)
A
for (i in 1:nrow(A)){
  for (j in 1:ncol(A)){
   print(A[i,j]) 
  }  
}
# Och omvänd ordning
for (j in 1:ncol(A)){
  for (i in 1:nrow(A)){
    print(A[i,j]) 
  }  
}


# while - loopar ----
# Ett exempel
x <- 1 # Obs! det som testas i villkoret i while måste definieras innan
y <- 1
while ( x < 5 & y < 10){
  print(c(x, y))
  x <- x + 1
  y <- x + y
}

# Ett problem med en "oändlig" 
while ( x > 1 ){
  print(x)
  x <- x + 1
}
# Stoppas med "Stoppknappen" i Console - fönstrer


# kontrollstrukturer för loopar ----
# Ett exempel på next()
x <- 1
for (i in 2:9){
  x <- c(x, i^2) # Detta steg utvärderas i varje iteration
  if( i %% 3 == 0) { next } # Om i är delbart med 3 börjar loopen om från början
  print(x) # Detta utvärderas därför bara då i är udda
}
x # Hela loopen körs


# Ett exempel på break (samma som innan, men med break istället)
y <- 1
for (i in 2:9){
  y <- c(y, i^2) 
  if( i %% 3 == 0) { break() } 
  print(y) 
}
y # Loopen körs bara till dess att break anropas


# Break i en nästlad loop:
for (i in 1:3){
  for (j in 1:4){
    if (j == 2) { break() }
    cat("i=",i,", j=",j,"\n",sep="")
  }
}
# Loopen avbryter bara den innersta loopen

# Och om vi flyttar ut break till den yttre loopen
for (i in 1:3){
  if (i == 2) { break() }    
  for (j in 1:4){
     cat("i=",i,", j=",j,"\n",sep="")
  }
}
# Eftersom break anropas i den yttre loopen avbryts både den inre och yttre


# stop() och warning() ----
# Om vi vill stopp en loop eller funktion helt används stop
for (i in 1:5){
  print(i)
  if(i == 4) { stop("i är 4. Hallå!") }
}

# stop() kan vara aktuellt om exempelvis något värde inte är definierat
# och beräkningar tar lång tid
divisionStop <- function(x,y){
  if (y == 0) {stop("Division med noll är inte definierat")}
  return( x / y )  
}
divisionStop(4,5)
divisionStop(4,0)
4 / 0

# warning() används på ett liknande sätt, men då vi inte vill avbryta funktionen
divisionWarn <- function(x,y){
  if (y == 0) {warning("Division med noll är inte definierat")}
  return( x / y )  
}
divisionWarn(4,0)

# Varningar samlas och presenteras i slutet
flera_y <- c(0,3,1,2,0,0,1,2)
for (y in flera_y){
  print(divisionWarn(4,y))
}

# Vi kan skriva ut varningarna igen om vi vill 
warnings()


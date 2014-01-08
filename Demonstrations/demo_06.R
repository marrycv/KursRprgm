#### Demo 06: Villkorssatser  ####
#### Författare: Måns Magnusson


# Villkorssatser ----
# Den enklaste villkorssatsen består av ett if ( Villkor ) { uttryck }
if ( TRUE ) { print("Sant") }
if ( FALSE ) { print("Falskt") }

# Missing values i logiska uttryck blir fel!
if ( as.logical(NA) ) { print("Saknade värden") }

# Lite mer komplicerat 
x <- 10
if ( x > 5 ) {print("Stort x!")}
if ( x < 5 ) {print("Litet x!")}
# Men om x är 5? Vad händer då?

# Obs! Endast ett villkor kan användas
if(c(TRUE, TRUE, TRUE)) { print("För många logiska värden!") }

# Villkorssatser med else ----
# else måste ha en if-sats. else skrivs ut om if är falskt.
villkor <- FALSE
if( villkor ) { 
  print("Villkoret är sant!")
} else {
  print("Villkoret är falskt!")  
}

# Villkorssatser med else if ----
# Ibland vill vi ha flera villkor:
villkor <- 1
if( villkor == 1 ) { 
  print("Villkoret är 1!")
} else if ( villkor == 2 ){
  print("Villkoret är 2!")  
} else {
  print("Villkoret är något annat!")  
}

# Villkorssatser i funktioner ----
# Det är här villkorssatser blir smidiga att använda, 
# ex. för att styra resultatet
kortAnalys <- function(x, std){
  medel <- mean(x)
  resultat <- medel
  if( std ) { 
    stdev <- sd(x)
    resultat <- c(resultat, stdev)
  }
  return(resultat)
}
kortAnalys(x = 1:10, std = FALSE)
kortAnalys(x = 1:10, std = TRUE)

# Eller lite mer komplicerat:
whosBad <- function(film){
  if(film == "Terminator"){
    bad <- "SkyNet"
  } else if (film == "1984") {
    bad <- "Storebror"
  } else if (film == "2001") {
    bad <- "Hal 2000"
  } else {
    bad <- "Michael Jackson"
  }
  return(bad)
}
whosBad("Terminator")
whosBad("2001")
whosBad("Thor")
whosBad("1984")

# switch ----
# Vi kan implementera exakt samma med switch (något enklare)
whosBad <- function(film){
  switch(film,
         Terminator = {bad <- "SkyNet"},
         "1984" = {bad <- "Storebror"},
         "2001" = {bad <- "Hal 2000"},
         {bad <- "Michael Jackson"}
         )
  return(bad)
}

whosBad("Terminator")
whosBad("2001")
whosBad("Thor")
whosBad("1984")

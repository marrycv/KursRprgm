#### Demo 02: Introduktion till funktioner ####
#### Författare: Måns Magnusson


# Funktior med argument -----

# En funktion består av: 
# - ett funktionsnamn, 
# - en funktionsdefinition ( function() )
# - 0 eller fler argument, 
# - kod / beräkningar och
# - return() / returnera "output"

minProdFunktion <- function(arg1, arg2){
  # Funktionen
  resultat <- arg1 * arg2
  #Returnera värdet
  return (resultat)
}

minProdFunktion(arg1 = 4, arg2 = 5)
# Observera att arg1, arg2 eller resultat inte finns i "Global enviroment"
ls()

# Det som returneras från en funktion kan sparas som ett objekt
mittVarde <- minProdFunktion(arg1 = 2, arg2 = 9)
mittVarde


# En funktion utan argument men med print() ----
en_femma <- function(){
  # Det går att printa från funktioner
  print("Nu får du snart en femma av mig")
  cat("Såhär ser cat ut\n") # Vi lägger till \n för att skapa en ny rad

  # Funktionens beräkning
  x <- 5
  return (x) # Här returneras värdet och då avbryts funktionen
  
  # Det går också att printa (med cat eller print)
  print("Detta ser vi inte eftersom return() ligger innan")
}

en_femma()
y <- en_femma
y


# En mer komplicerad funktion med vektorer ----
# Denna funktion multiplicerar summan av x med y
f <- function(x, y){
  resultat <- sum(x) * y
  return(resultat)
}

f(x = 1:3, y = 2)

# En funktion kan också returnera vektorer
f(x = 1:3, y = c(2, 4))


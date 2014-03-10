#----------------------------------------------------
#----------------------------------------------------
#### Programmering i R ####
#### Inlämning, Datalaboration 8 ####
#### Funktioner till miniprojektet
#----------------------------------------------------
#----------------------------------------------------

# Ange gruppnummer här
GruppNr <- "Mitt gruppnummer (ex. 4)"
# Ange namnen här f?r alla i gruppen, ex Namn <-c( "Alice Walker","Gustav Vasa")
Namn <- c("ex. Måns Magnusson", "ex. Josef Wilzen")
# Ange Liu-ID här f?r alla i gruppen, ex LiuId <- c("aliwa432","gusva204")
LiuId  <- c("ex. manma97", "ex. joswi128")

# Här nedan ska ni skriva de funktioner som ni skapar själva
# Det är viktigt att ni kommenterar era funktioner, följ då exemplet nedan, 
# Funktionen nedan är ett exempel, som inte har nått med uppgifterna att göra.



#----------------------------------------------------
# Funktion: mySin
#----------------------------------------------------
# Syfte: Beräkna och plotta olika sinuskurvor
# Argument
# x: numerisk vektor
# amp: amplituden i sinus
# phase: fasen i sinus
#----------------------------------------------------
mySin<-function(x,amp,phase){
  y<-amp*sin(phase*x)  # beräkna sinuskurva
  plot(x,y,type="l")  # plotta resultatet
}




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



# Funktioner ####
# Här nedan ska ni skriva de funktioner som ni skapar själva
# Det är viktigt att ni dokumenterar era funktioner korrekt, 
# nedan finns ett exempel på detta.
# Detta sätt att dokumentera bygger på standarden ROxygen2, det är 
# ett paket för att automatiskt generera R-hjälpfiler från kod.
# Mer information finns här:
# http://adv-r.had.co.nz/Documenting-functions.html

# Funktionen nedan är ett exempel, som inte har något med uppgifterna att göra.


#' @title Min egen sinusplotfunktion
#'
#' @description 
#' Beräknar och plottar olika sinuskurvor 
#' 
#' @param x numerisk vektor
#' @param amp amplituden i sinus
#' @param phase fasen i sinus
#' 
#' @return 
#' Funktionen returnerar inget värde, den skapar bara en plot.
#' 

mySin<-function(x,amp,phase){
  y<-amp*sin(phase*x)  # beräkna sinuskurva
  plot(x,y,type="l")  # plotta resultatet
}




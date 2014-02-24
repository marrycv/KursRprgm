#### Demo 11: Föreläsning 6 ####
#### Författare: Josef Wilz?n
# Hantera paket m.m. 


# Undersök vilka paket som är inladdade och vilka som är installerade:
library()
a<-installed.packages()

# Installera ett paket:
install.packages("MASS")

# ladda in:
library(MASS)

# Om du inte har rättigheter att skriva till hårddisken där paketen installeras som standard
# kan du behöva specificera argumentet "lib=" till en plats där du har skrivrättgiheter
# testa
?install.packages()
?library()

# Ex:
installed.packages("MASS", lib="sökvägen till min mapp")
library(MASS, lib="sökvägen till min mapp")


# läs i ett dataset:
data(longley)

# skattar en statistik modell på data: (ni behöver inte förstå modellen)
lm.ridge(GNP.deflator~.,data=longley)

# spara över funktionen med en annan funktion
lm.ridge<-sd

# skatta modellen igen:
lm.ridge(GNP.deflator~.,data=longley)

# anropa den ursprungliga funktion i paketet: 
MASS::lm.ridge(GNP.deflator~.,data=longley)

# Demo av namespaces
search()

# funktioner i MASS:
ls("package:MASS")

?loadedNamespaces()
loadedNamespaces()

?citation()
citation()

















#### Demo 04: Datatyper i R ####
#### Författare: Måns Magnusson



# Konvertera mellan olika atomära klasser / modes ----
char <- c("Hej", "på", "dej!", "TRUE", "1")
num <- 0:3
logi <- num > 2

char
num
logi

# Vi testar att konvertera de olika vektorerna mellan atomära klasser
as.numeric(char)
as.numeric(logi)

as.character(num)
as.character(logi)

as.logical(char)
as.logical(num)


# Faktorvariabler ----

# Skapa faktorvariabler
# Från grunden:
minFaktor <- factor(x=c(1,3,3,1,2), labels=c("A", "B", "C"), levels=c(1, 2, 3))
minFaktor

as.numeric(minFaktor)
as.character(minFaktor)


# Om vi vill ändra vilket värde som har vilket value ändrar vi levels
minFaktor <- factor(x=c(1,3,3,1,2), labels=c("A", "B", "C"), levels=c(2, 1, 3))
minFaktor

# Observera skillnaden mot en textvektor
as.character(minFaktor) # Skillnaden är "" och Levels: nedtill

# Vi kan skapa faktorvariabler direkt från textvektorer
text <- c("B", "C", "C", "B", "A")
minFaktor <- factor(text)
# Labels (och levels) bygger då på en alfabetisk ordning

# Att skapa faktorer är också ett sätt att hantera stora data 
# då faktorer (oftast) tar mindre utrymme. Vi prövar skillnaden med 70000 namn:
minText <- rep(c("Pelle", "Mahmood", "Mahmood", "Pelle", "Kajsa", "Pelle", "Kajsa"), 10000)
minFaktor <- factor(minText)
object.size(minText) # object.size() kan användas för att studera ett objekts storlek
object.size(minFaktor)

# Faktorvariabler kan snabbt konverteras till sina 
# levels eller labels på följande sätt:
minFaktor <- factor(x=c(1,3,2,2,1,3), levels=1:3, labels=c("A","B","C"))
minFaktor
as.character(minFaktor)
as.integer(minFaktor)



# Matriser ----

# Matriser skapas med matrix(), som standard fylls kolumn för kolumn
A <- matrix(data = c(3, 12, 2, 1), nrow = 2)
A

# Det är också möjligt att bestämma matrisens storlek med antalet kolumner
B <- matrix(data = c(3, 12, 2, 1), ncol = 2)
B

# Det går också att fylla matrisen rad för rad
C <- matrix(data = c(3, 12, 2, 1), ncol = 2, byrow = TRUE)
C

# Det finns numeriska (integer och real), logiska och textmatriser
textMat <- matrix(data = c("Hej", "på", "dej", "!"), ncol = 2)
textMat
typeof(textMat)

logiMat <- matrix(data = c(TRUE, FALSE, TRUE, TRUE), ncol = 2)
logiMat
typeof(logiMat)

# Det går att skapa en vektor av matrisen igen.
as.vector(C)

# Aritmetik - vanliga operatorer sker elementvis
A <- matrix(data = c(13, 1, 0, 0), ncol = 2, byrow = TRUE)
B <- matrix(data = c(3, 4, 2, 1), ncol = 2, byrow = TRUE)
A
B

A + B
A * B
A / B
A ^ B
A %% B

# Relationsoperatorer fungerar också för att skapa en logisk matris
A < B
A != B

# Matrisoperatorer  
# Matrismultiplikation 
A %*% B
# Tronsponering
t(A)
# Matrisinvers
solve(B)

# "Slicing" sker både rader och kolumner med [ , ]
# För att plocka ut ett (enskilt värde) värde
B
B[1, 1]
B[1, 2]

# För att plocka ut en rad, lämna kolumnen tom
B[1, ]

# Samma för kolumner
B[ , 1]

#
B[ , 1, drop = FALSE]

# Ändra element i en matris kan göras med index:
B[1, 2] <- 10
# Eller med en logisk matris:
B > 2
B[B > 2] <- 5
B

# Obs! Plockas en rad/kolumn ut innebär det att den blir en vektor.
is.matrix(A)
is.matrix(A[1, ])






# Data.frame ----

# Skapa dataset from scratch
# Lägg till en vektor och namnge den:
minData <- 
  data.frame(vikt=c(58,78,98),
             namn=c("Lisa","Kim","Max"), 
             rik=c(TRUE,FALSE,FALSE))
minData

# Som standard blir textvektorer faktorer
# Detta kan ändras med stringsAsFactors = FALSE
minData <- 
  data.frame(vikt=c(58,78,98),
             namn=c("Lisa","Kim","Max"), 
             rik=c(TRUE,FALSE,FALSE))
minData$namn

# I R-studio går det att "titta" på datasetet under "Enviroment"
# Observera att namn har blivit en faktorvariabel.
# Detta kan ändras genom att sätta stringsAsFactors = FALSE

minData <- 
  data.frame(vikt=c(58,78,98),
             namn=c("Lisa","Kim","Max"), 
             rik=c(TRUE,FALSE,FALSE),
             stringsAsFactors=FALSE)
minData$namn

# Läsa in dataset som kommer med R ----
# För att se vilka dataset som finns:
data()
# Och för att ladda in i R sessionen:
data(faithful)

# Ett snabbt sätt att få en snabb bild av datasetet är med head() och tail()
head(faithful)
tail(faithful)

# En data.frame har dels variabelnamn och radnamn
names(faithful)
colnames(faithful)
rownames(faithful)

# Byta namn
names(faithful) <- c("erupt", "wait")
# eller bara ett namn i taget:
names(faithful)[1] <- "eruptions"
names(faithful)[2] <- "waiting"



# "Slicing" av data frames ----
# För att välja ut en eller flera variabler (ex. för beräkningar) finns flera metoder
# Välja ut enskilda variabler
faithful$eruptions # Som en lista
faithful[["eruptions"]]

# Subsetta / slicea flera variabler
faithful[ , c(1, 2)] # Som en matris
faithful[ , c("eruptions","waiting")]

# För att välja ut rader görs på samma sätt som i matriser
faithful[c(1,2,5), ] # OBS! Glöm inte ","
# Ofta vill vi använda logiska vektorer för att välja rader 

# Exempel: De observationer med en waiting time mindre än 50
faithful[faithful$waiting < 50 , ]

# Exempel: Lite mer komplicerad
faithful[faithful$waiting > 50 & faithful[["eruptions"]] < 2, ]



# Skapa nya variabler i data.frame ----
# För att lägga till / skapa en ny variabel i en data.frame används $ eller within()
# Med $ 
faithful$wait_by_erupt <- faithful$waiting / faithful[["eruptions"]]
# Med within()
faithful <- within(faithful, erupt_by_wait <- eruptions / waiting)

# $ är mycket smidigt i R-Studio med tabbkomplettering


# Listor ----
# Skapa en tom lista 
# Detta kan man ibland vilja göra för att ha en lista att stoppa objekt i
min_tomma_lista <- list()
min_tomma_lista

# Skapa en lista med olika element
minListNamn <- list(int = 1:10 , char = "Hej", logi = c(TRUE,FALSE))
minListNamn

minListUtanNamn <- list(1:10 , "Hej", c(TRUE,FALSE))
minListUtanNamn

# Namnge listornas element
names(minListUtanNamn)
names(minListUtanNamn) <- c("int", "char", "logi")
minListUtanNamn

# Plocka ut objekt ur listorna 
# Plockar ut (ett) elementet med: [[]]
minListNamn[[1]]
mode(minListNamn[[1]])

# Slicea lista (plocka ut ett eller flera objekt)
minListNamn[1]
mode(minListNamn[1])
minListNamn[1:2]

# Kan också välja ut element med namn (om de är namngivna)
minListNamn[["char"]]
minListNamn["char"]

minListNamn$int

# Lägga till ett objekt görs enkelt genom att
minListNamn[[4]] <- "Hejdå"
minListNamn
# eller
minListNamn[["slut"]] <- "Hejdå"
minListNamn  


# Sortera vektorer och data.frame ----
vektor <- c(5,2,4,3,-1)
minData <- 
  data.frame(vikt=c(58,78,98), stringsAsFactors=TRUE,
             namn=c("Lisa","Kim","Max"), 
             rik=c(TRUE,FALSE,FALSE))

# För att sortera bara en vektor kan sort() användas
sort(vektor)
sort(vektor, decreasing = TRUE)

# Funktionen order() ger en indexvektor med i vilken ordning elementen
# ska flyttas för att en sortering ska ske
order(vektor)
order(vektor, decreasing = TRUE)

# Dessa index kan sedan användas för att sortera
vektor[order(vektor)]

# Framförallt används detta för att sortera data.frame:s
order_vektor <- order(minData$vikt, decreasing = TRUE)
minData[order_vektor, ] # OBS! Glöm inte ,
minData[order(minData$namn), ]


# Att studera objekt i R ----

# Vektor
a <- 1:10 
length(a)
is.vector(a)
summary(a)
str(a)


# Matriser
A <- matrix(1:9,nrow=3)
dim(A)
ncol(A)
nrow(A)
is.matrix(A)
summary(A)
str(A)


# Data.frame
minData <-
  data.frame(vikt=c(58,78,98), 
             namn=c("Lisa","Kim","Max"), 
             rik=c(TRUE,FALSE,FALSE))

dim(minData)
ncol(minData)
nrow(minData)
is.data.frame(minData)
summary(minData)
str(minData)


# List
minList <- list(1:10 , "Hej", c(TRUE,FALSE))
length(minList)
is.list(minList)
summary(minList)




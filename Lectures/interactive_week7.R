#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
# Kod för den interaktiva delen för vecka 7
#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------


# Generella
# Hur ser poängsystemet ut på tentan?
# svar:
# max 20 p
# 12 p = G
# 16 p = VG
# Se här: https://github.com/STIMALiU/KursRprgm/tree/master/OldExams

# för full poäng på en uppgift måste koden vara korrekt
# Men delpoäng kan erhållas om viktiga element är med i svaret 





#------------------------------------------------------------------------------------------
# Datum
#------------------------------------------------------------------------------------------

# När man räknar med dagar. Räknar den då med skottår? Om ej hur gör man så att den gör de? 
# svar: lubridate tar automatiskt hänsyn till skottår när ni har tider som är "fixa i tiden"


#Hur skapa man en sekvens med datumet för alla fredagar under 2014? Med Lubridate.
# svar:
library(lubridate)
b<-ymd("2014-01-03")
str(b)
weekdays(b)

a<-b+0:51*days(7)
a
weekdays(a)


#------------------------------------------------------------------------------------------
# Grafik
#------------------------------------------------------------------------------------------

# Hur ändrar man värdena på x-axeln när man skapar ett tidsseriediagram i rMarkdown? 
# Om man t.ex. har index på x-axeln men vill ha månader där istället?

# svar:
# formatera den aktuella variablen till datum.
x<-1:52
y<-sin(x)+0.1*x
plot(x,y,t="l")
class(a)
plot(x=a,y=y,t="l")


?ts

# I ett histogram, går det att ändra skalan för axlarna? Exempelvis 2e04 = 20,000.
# svar: se här
# http://stackoverflow.com/questions/5963047/do-not-want-scientific-notation-on-plot-axis
# http://stackoverflow.com/questions/14563989/force-r-to-stop-plotting-abbreviated-axis-labels-e-g-1e00-in-ggplot2
# en variant är att byta enhet på data, tex: x/1000


#------------------------------------------------------------------------------------------
# Markdown/latex
#------------------------------------------------------------------------------------------

# Finns det några direkta nackdelar med LaTex och R Markdown? 
# Eller är det att föredra i alla situationer

# svar: När det gäller 
# Ibland vid mycket enkla/korta rapporter kan det vara 
# enklare/snabbare att arbeta med traditionell dokumenthantering.
# Men annars så är det oftast bättre att LaTex/markdown tillsammans med knitr,
# i tex RStudio eller i lyx (https://www.lyx.org/)


# Skulle du kunna gå igenom hur man kan ladda ner mjukvarorna till Rmarkdown?
# svar: du kan behöva installera latex, tex Miktex till windows
# https://miktex.org/download
# kolla även här: https://www.latex-project.org/get/


# Hur sparar med som en PDF fil från Markdown?
# alt:
# knitr: Ctrl+Shift+k -> ger pdf/html/word
# spara som html och sen spara som pdf
# testa själv genom att trycka på:
# File -> New File -> R Markdown
# spara filen och tryck sedan på Ctrl+Shift+k

#------------------------------------------------------------------------------------------
# OO (Objektorientering)
#------------------------------------------------------------------------------------------

# träffande klasser, generiska funktioner och metoder. Det blir väldigt rörigt, vad är absolut nödvändigt att kunna? 
# När och på vilket sätt brukar det oftast användas?
# Kan du gå igenom lite mer om generiska funktioner, greppar inte helt hur det fungerar?

# OO används ofta i generiska funktioner, och förekommer i många olika paket.
# Det är viktigt att ha koll på följande:
# Klasser kopplar samman data (objekt) med beteenden (metoder/funktioner)
# R:s OO-system S3 utgår från generiska funktioner (tex print(), summary(), plot())
# Dessa gör olika saker beroende på vilken klass inargumentet har. 
# Den generiska funktionen anropar den metod (=en specifik funktion) som hör ihop med 
# den aktuella klassen.

# testa:
x<-iris$Species
class(x)
print(x)
print.factor(x)
print.default(x)

a<-letters[1:5]
a
print(a)
b<-list(a=1,b=T,c=NULL)
class(b)<-"hej"
print(b)

trees$Height[c(2,10,25)]<-NA

mean(x = trees$Height,na.rm = TRUE)

cbind(1:10,1:10,10:1)

apply()


# I know class can be set using the class() or attr() function, but the structure() function is new to me.
# Are there other ways to create a constructor than example 1 and 2? 

# Svar: jag känner inte till något ytterligare sätt än de nedan.

#1- a constructor function for the "player" class
newPlayer <- function(x, y){
  structure(class = "newPlayer", list(
    name = x, #Sets name
    weapon <- "rock", #Weapon of choice
    hp = y #Sets initial HP
  ))}

#2 - another constructor function for the "player" class
newPlayer <- function(x,y) {
  value <- list(name = x, #Sets name
                weapon = "rock", #Weapon of choice
                hp = y) #Sets initial HP
  attr(value, "class") <- "newPlayer" 
  value
}

haakon <- newPlayer(10, "Haakon")

loose.Player

(haakon)

loose <- function(){
  hp <- hp - 1
}
kembo <- new_player()

#This outputs a list with 
player1 <- myClass(7, "Kembo")

class(my_object)
## [1] "myClass"
my_object$get_x()
## [1] "x was 7"


#------------------------------------------------------------------------------------------
# Blandade frågor
#------------------------------------------------------------------------------------------

# Vad innebär fria variabler?

# Fira variabler är variabler som inte är definerade i den lokala miljön.
# tex vi skapar en funktion:

rm(list=ls())  # ta bort allt i den globala miljön
f<-function(x){
  cat("mitt x",x)
  return(y^3)
}
f(3)

# i detta falla är y en fri variabel
# bättre lösning:
f<-function(x,y){
  cat("mitt x:",x,"\n")
  return(y^3)
}
f(3,4)

# se även materialet på vecka 4.


# Kan man addera två olika rader med varandra i en tabell? Hur gör man isåfall?

library(ggplot2)
data(mpg)
?mpg
a<-table(mpg$fl,mpg$drv)
a
class(a)
str(a)
a[3,]
a[4,]
a[3,]+a[4,]
# alt:
a2<-as.matrix(a)
a2[3,]+a2[4,]


# När jag har en vector som är en factor och jag vill göra till den till en numeric, 
# varför kan jag inte göra det direkt med as.numeric utan måste skriva as.character(as.numeric(x))?

# factor är representerat som heltal
x<-iris$Species
class(x)
print(x)
levels(x)
# vill vi åt heltalen eller eller etiketterna?
as.numeric(x)
as.character(x)

set.seed(3939)
y<-sample(x = round(rnorm(5),3),size = 20,replace = TRUE)
y
table(y)
y_fac<-as.factor(y)
y_fac
levels(y_fac)
as.numeric(y_fac)
as.character(y_fac)
y2<-as.numeric(as.character(y_fac))
y2^2+3

# Kan man på ett enkelt sätt plocka ut data ur sitt 
# datamaterial med specifikationskrav, ex alla observationer som är större än 5?

data("trees")
index<-trees$Volume<20
trees[index,]

# Om jag har en data.frame som innehåller en kolumn som visar tid, 
# men class av den kolumnen är "numeric", hur kan jag ändra hela kolumnen till date?

#använd
# ymd() eller likande från lubridate
# as.d
as.Date()

my_dates<-c("2017-01-01","2017-03-01","2017-12-08","2019-08-09","2021-06-22")
my_data<-c(2,134,23,12,64)
a<-data.frame(my_dates,my_data)
class(a$my_dates)
a$my_dates<-as.Date(a$my_dates)
class(a$my_dates)

# eller
a$my_dates<-ymd(a$my_dates)
class(a$my_dates)



# hur kan en fylla matriser med data?
A1 <- matrix(data=1:20,nrow=4,ncol=5,byrow = FALSE)
A1
A2 <- matrix(data=1:20,nrow=4,ncol=5,byrow = TRUE)
A2


# hur kan man enklast välj bort och sortera datamaterialet i pxweb?

# Detta är en komplex fråga, det beror på vilken data/variabler du laddar ner 
# och vilket alternativ du väljer vid nedladdningen. Och hur du vill välja ut variabler 
# och vilka sortering du vill göra. 
# Vid ett specifikt fall av pxwebdata: Fråga på slack eller under laborationstid.
library(pxweb)
a<-interactive_pxweb()

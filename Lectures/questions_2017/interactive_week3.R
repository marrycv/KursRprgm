#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
# Kod för den interaktiva delen för vecka 3
#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------
# Generella:
#-----------------------------------------------------------------------------------------

# markmyassignmnet kommer inte användas på tentan


#------------------------------------------------------------------------------------------
# kategoriska variabler, factor() och cut():
#------------------------------------------------------------------------------------------

# kategoriska variabler kan representeras med character eller factor
# factor-variabler ger fördelar när de används tillsammans med andra R-funktioner, tex lm() som gör linjär regression

x<-letters[1:5]
x
x<-factor(x)
x
levels(x)
typeof(x)
is.factor(x)
x<-relevel(x,ref="d")
x

?read.table()
# stringsAsFactors=FALSE
# logical: should character vectors be converted to factors?

head(iris)
summary(iris)

?cut
cut(iris$Petal.Width, breaks=2)
cut(iris$Petal.Width, breaks=2,labels = FALSE)
cut(iris$Petal.Width, breaks=2,labels =c("A","B"))

cut(iris$Petal.Width, breaks=c(0,2,3,5))


iris$newCat2 <- cut(iris$Petal.Width, breaks=2)
head(iris)
iris$newCat3 <- cut(iris$Petal.Width, breaks=c(0,2,5))
table(iris$newCat3)
table(iris$newCat2)

# manuellt:
iris$newCat4<-""
iris$newCat4

iris$newCat4[iris$Petal.Length<2] <-"x<2"
iris$newCat4
iris$newCat4[iris$Petal.Length>=2]<-"2<=x<5"
# alt: 
iris$newCat4[iris$Petal.Length>=2&iris$Petal.Length<5]<-"2<=x<5"

iris$newCat4
iris$newCat4[iris$Petal.Length>=5]<-"5<=x"
iris$newCat4
table(iris$newCat4)
class(iris$newCat4)
as.factor(iris$newCat4)

#------------------------------------------------------------------------------------------
# Matriser och data.frame:
#------------------------------------------------------------------------------------------

# matriser 2-dim datastruktur, alla element av samma typ. 
# Bra vid numerisk linjär algebra.


# Lite numerisk linjär algebra (mer del 2 i kursen)
A<-matrix(1:6,3,2)
B<-matrix(6:12,2,3)
A
B
B2<-B%*%A  # matrismultiplikation

solve(B2)  # matrisinvers

# data.frame 2-dim datastruktur, 
# kolumner kan vara av olika typ. Bra vid databearbetning.


?read.table   # läs under value

# om vi vill ha matris istället:
my_df<-read.table(file = "sökväg till min fil")
my_mat<-as.matrix(my_df)

# lite om indexering

a<-rep(c(1,2,3,4,5),10)
b<-1:50
c<-(1:50)^2
d<-log(1:50)
stor_matris <- cbind(a,b,c,d)

stor_matris[3,2]
stor_matris[,2]


# använda en 2-dim matris  indexering:
index_mat<-matrix(c(4,2,4,1),2) 
index_mat 
stor_matris[index_mat]  # resultatet är en vektor!

#(a) Välj med metoden ovan ut elementen (4, 4), (5,3) och (2, 1)
#(b) Välj med metoden ovan ut elementet (42, 2)
index_mat<-matrix(c(4,5,2,4,3,1),nrow = 3,ncol = 2) 
index_mat 
stor_matris[index_mat]
stor_matris[index_mat]<-NA
head(stor_matris)
stor_matris[3,]<-NA
head(stor_matris)

# logiska matriser och indexering
x <- c(1,2,3,4,5,6)
min_matris <- matrix(x, nrow=3,ncol=2)
min_matris
index_mat<-min_matris < 5
min_matris[index_mat]  # resultatet är en vektor!

min_matris2<-min_matris
min_matris2[min_matris2 <=4]<-99

min_matris2
min_matris

# data.frame
data("trees")
head(trees)
colnames(trees)
colnames(trees)<-c("A","B","C")
head(trees)

#------------------------------------------------------------------------------------------
# Modulus och heltalsdivision:
#------------------------------------------------------------------------------------------

# Var är heltalsdivision?

?"%/%"

13%/%4
13/4

23%/%7

# Modulus ger resten vid heltalsdivision
# https://en.wikipedia.org/wiki/Modulo_operation

13%%4

23%%7

# hur testar jag om en tal är delbart med ett annat tal?

20%/%5
20%%5
20%%5==0


delbar<-function(x,y){
  res<-x%%y==0
  return(res)
}

delbar(x = 10,y = 3)
delbar(x = 12,y = 3)
delbar(x = 180,y = 10)
delbar(x = 180,y = 2)

#------------------------------------------------------------------------------------------
# blandade frågor:
#------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------
# Hur fungerar heads() och tails()?
# Används för att undersöka data.frame,matriser,vektorer och en del andra object
?head()

data(iris)
head(iris)
head(iris,n = 3)
head(iris,n = 10)

tail(iris,4)

#------------------------------------------------------------------------------------------
# Vad är skillnaden mellan read.csv och read.csv2?

?read.csv
# read.csv: sep=","  dec="."
# read.csv2: sep=";"  dec=","

#------------------------------------------------------------------------------------------
# hur fungerar order()?

?order()

data(trees)
trees$Height
# enkel sortering
sort(trees$Height)
sort(trees$Height,decreasing = TRUE)

# order ger indexordnignen på sorteringen-> bra föra att sortera vektorer/matriser/data.frame
index<-order(trees$Height)
index
index[1]
trees$Height[3]

order(trees$Height,decreasing = TRUE)
trees2<-trees

head(trees2,10)
trees2<-trees2[index,]

head(trees2,10)

#------------------------------------------------------------------------------------------
# vad är skillanden på ftable och table?

data()
table()

data(mtcars)
A<-table(mtcars$gear,mtcars$carb)
A
B<-ftable(mtcars$gear,mtcars$carb)
B

A<-table(mtcars$gear,mtcars$carb,mtcars$cyl)
A
B<-ftable(mtcars$gear,mtcars$carb,mtcars$cyl)
B
B
as.data.frame(A)

#------------------------------------------------------------------------------------------
# Är det fel att använda samma namn på en funktion och en variabel?
# I R är det möjligt, men bör undvikas
?c
c("a","d","dkj")
c<-23344
c
c(2,4,1,44,2,1)
# leap_year i labben dåligt exempel

#------------------------------------------------------------------------------------------
# Vad är skillnad mellan library() och require()?
# Båda läser in R-paket, men vissa skilnader finns
?require
# "require is designed for use inside other functions;
# it returns FALSE and gives a warning (rather than an error as library() 
# does by default) if the package does not exist."

a<-require("hejhej")
a

library("hejhej")
library()


#------------------------------------------------------------------------------------------
# Vad är skillnaden på om <- har mellanrum till höger/vänster eller inte? Har det någon betydelse?
# Båda fungerar
a<-1:3
a
b <- 1:7  #rekomenderas, läs mer här adv-r.had.co.nz/Style.html    
b


#------------------------------------------------------------------------------------------
# Finns det något sätt att också beräkna hur de ingående variablerna i ett datamaterial påverkar en vald beroendevariabel?
# korreltioner med cor
data("trees")
cor(trees$Height,trees$Volume)

# linjär regression
?lm
lm(trees$Volume~trees$Height)

# resten av utblidnigen: kolla här https://cran.r-project.org/web/views/


#------------------------------------------------------------------------------------------
# När använder man for-loopar och när använder man while-satser?
# Mer om det vecka 3.

#------------------------------------------------------------------------------------------
# Hur gör man för att importera datamaterial från en excel-fil till R?
# mer om det i del 2.

# readxl package

# https://cran.r-project.org/web/packages/readxl/readxl.pdf
# https://www.r-bloggers.com/read-excel-files-from-r/


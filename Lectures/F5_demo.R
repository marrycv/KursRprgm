
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Grafik
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------



data("iris")
head(iris)
plot(x = iris$Sepal.Length, y = iris$Petal.Length)
plot(iris)

plot(x = iris$Sepal.Length, y = iris$Petal.Length,col="red")

plot(x = iris$Sepal.Length, y = iris$Petal.Length,col="red",pch=7)

col_var<-iris$Species

plot(x = iris$Sepal.Length, y = iris$Petal.Length,col=col_var,pch=16,cex=1.5)

data("AirPassengers")
y<-as.numeric(AirPassengers)
plot(x=y,t="l",lty=3,lwd=3,main="AirPassengers")

# AirPassengers är ett ts-objekt (ts=tidserie), så det går att plotta direkt:
plot(AirPassengers)


boxplot(y)



# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Demo: Slumptal
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------

rnorm(n = 5, mean = 10, sd = 1)
set.seed(20180218)
rnorm(n = 5, mean = 10, sd = 1)
set.seed(20180218)
rnorm(n=5, mean=10, sd=1)

text <- c("Linköpings", "Universitet")
set.seed(20180218)
sample(x=text, size=4, replace=TRUE)
sample(x=text, size=4, replace=TRUE)
set.seed(20180218)
sample(x=text, size=4, replace=TRUE)

?Distributions


z<-rexp(n = 1000,rate = 10)
hist(z,breaks = 30,freq = FALSE)

pexp(q = 0.01,rate = 10)

pexp(q = 2,rate = 0.1)

# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Demo: Markdown
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------

# 1. 
# https://rmarkdown.rstudio.com/
# https://rmarkdown.rstudio.com/lesson-1.html

# 2. 
# https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf

# 3. 
# Markdown file + Notebook

# öppna en markdown fil



# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Demo: PXWEB + Grafik
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
install.packages("pxweb")
library(pxweb)

# -------------------------------------------------------------------------------------------
# det finns två gränsnitt till pxweb
# -------------------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------------
# de gamla funktionerna
my_data <- interactive_pxweb()


head(my_data)



myDataSetName <- 
  get_pxweb_data(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/BE/BE0101/BE0101A/BefolkningR1860",
                 dims = list(Alder = c('*'),
                             Kon = c('1', '2'),
                             ContentsCode = c('BE0101C£'),
                             Tid = c('1860', '2017')),
                 clean = TRUE)




# Ladda ned husdjur
my_data <- get_pxweb_data(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/JO/JO0103/HusdjurL",
                 dims = list(Region = c('00'),
                             Djurslag = c('70'),
                             ContentsCode = c('JO0103L1'),
                             Tid = c('*')),
                 clean = TRUE)

# Visualisera över tid
dim(my_data)
index <- !is.na(my_data$values)
data2 <- my_data[index,]
temp <- as.character(data2$Tid)
my_years <- as.numeric(temp)

plot(x = my_years, y = data2$values, xlab="År", ylab="Antal hästar", type="o",cex=2)


plot(x = my_years, y = data2$values, xlab="År", ylab="Antal hästar", type="l",cex=2)


Ni <- rpois(100, lambda = 5)
tN <- table(Ni)
barplot(tN)

barplot_data <- data2$values
names(barplot_data) <- my_years
barplot(barplot_data)


y <- rnorm(1000, mean = 0, sd = 1)
hist(y)
hist(y, probability = TRUE)


# Hämta data från ett givet api 
my_data2 <- interactive_pxweb(api = 'api.scb.se', version = 'v1', lang = 'sv')


# -------------------------------------------------------------------------------------------
# de nya funktionerna

# se här för mer detaljer:
# https://cran.r-project.org/web/packages/pxweb/vignettes/pxweb.html


mitt_data<-pxweb_interactive()

# ladda ner data med
# pxweb_get()

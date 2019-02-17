data("iris")
iris
plot(x = iris$Sepal.Length, y = iris$Petal.Length)
plot(iris)

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
my_data <- interactive_pxweb()

x <- 
  get_pxweb_data(url = "http://statistik.konj.se/PXWeb/api/v1/sv/KonjBar/hushall/Indikatorhus.px",
                 dims = list(Indikator = c('*'),
                             Grupp = c('100', '301', '302', '502'),
                             Period = c('*')),
                 clean = TRUE)

x


# Ladda ned husdjur
my_data <- 
  get_pxweb_data(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/JO/JO0103/HusdjurL",
                 dims = list(Region = c('00'),
                             Djurslag = c('70'),
                             ContentsCode = c('JO0103L1'),
                             Tid = c('*')),
                 clean = TRUE)

# Visualisera över tid
index <- !is.na(my_data$values)
data2 <- my_data[index,]
temp <- as.character(data2$år)
my_years <- as.numeric(temp)

plot(x = my_years, y = data2$values, xlab="År", ylab="Antal hästar", type="o")

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


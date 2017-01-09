


getwd()
setwd("Lectures")
dir()


#---------------------------------------------------------------------
# uppgit 1:
#---------------------------------------------------------------------

# a)
abs(sin(pi/3)+sqrt(3))

??"square"

# b)

txt_vec <- rep(c('polis', 'polis', 'potatismos'), 30)
my_num <- 2*(1:90)
my_num<-seq(2,180,by=2)


# c)

my_data <- data.frame(txt_vec, my_num)
colnames(my_data)<-c("txt","num")
my_data
dimnames()
array
# d)
index<-my_data$txt=='potatismos'
my_data[index,2]
sum(my_data$num[index])


#---------------------------------------------------------------------
# uppgift 2
#---------------------------------------------------------------------

# a)
cum_sum <- 0
for(i in 1:100){
  cum_sum <- cum_sum + i
  print(cum_sum)
  if(cum_sum > 200) break
}
cum_sum


# b)

cum_sum <- 0
i <- 1
while(cum_sum <= 200){
  cum_sum <- cum_sum + i
  i <- i +1
}
cum_sum


#---------------------------------------------------------------------
# uppgift 3
#---------------------------------------------------------------------

# a)

library(stringr)
library(lubridate)


# b)

begun <- ymd("1919-08-11")
ended <- ymd("1933-01-30")
# i.
wday(ended, label=TRUE)
weekdays(ended)
# ii.
interval(begun, ended) %/% weeks(1)

# iii.
interval(begun, ended) %/% months(1)

# c)
getwd()
setwd("Lectures")
dir()
poem <- readLines("hemmingway.txt")

# d)


index<-str_detect(string = poem, pattern = "[Oo]ld")
a<-poem[index]
a



#---------------------------------------------------------------------
# uppgift 4
#---------------------------------------------------------------------

# a)
binom_pdf<-function(x,n,p){
  if(x < 0 | x > n) stop()
  comb <- (factorial(n) / (factorial(x)*factorial(n-x)))
  res <- comb * p^x * (1-p)^(n-x)
  return(res)
}
binom_pdf(3,5,0.5)
binom_pdf(1,6,0.2)

# b)

binom_cdf<-function(x,n,p){
  res <- 0
  for(k in 0:x){
    res <- res + binom_pdf(x = k,n,p)
  }
  return(res)
}

binom_cdf(3,5,0.5)
binom_cdf(5,5,0.1)


# c)
1 - binom_cdf(5,10,0.5)


#---------------------------------------------------------------------
# uppgift 5
#---------------------------------------------------------------------

# a)
x1 <- rnorm(n = 150, mean = 3, sd = 3)
x2 <- rnorm(150, 2, 1)

hist(c(x1,x2))

# b)

t.test(x1, x2)

# C)

library(ggplot2)
qplot(x1,x2)

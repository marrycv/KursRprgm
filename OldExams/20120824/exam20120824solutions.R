# Question 1.

# 1a
fiveSteps <- seq(5,25, by = 5)

# 1b
fiveSteps <- rep(0,5)
for (i in 1:5){
  fiveSteps[i] <- 5*i 
}

# 1c
tenNumbers <- seq(0,3.14, length = 10)

# Question 2.

# 2a
rectArea <- function(a,b){
  area <- a*b
  return(area)
} 
rectArea(a = 2, b = 3)

# 2b
rectArea <- function(b,h){
  area <- b*h
  if (b==h) message('Rectangle is squared')
  return(area)
} 
rectArea(b = 2, h = 3) 
rectArea(b = 2, h = 2) # Here we see the message

# 2c
rectArea <- function(b, h = b){
  area <- b*h
  if (b==h) message('Rectangle is squared')
  return(area)
}
rectArea(b = 2, h = 3) # Same as before
rectArea(b = 2)        # Works!


# Question 3.

# 3a
X <- matrix(c(2,4,6,1,2,5), nrow = 3, ncol = 2)

# 3b
solve(t(X)%*%X)

# 3c
X <- as.data.frame(X)
is.data.frame(X) # returns TRUE
names(X) <- c('XCol1','XCol2')

# Question 4.

# 4a
attach(Orange)
regModel <- lm(circumference ~ age)
summary(regModel)

# 4b
is.factor(Tree)
plot(circumference ~ age, subset = (Tree == 1)) 

alternativt

plot(circumference[Tree == 1] ~ age[Tree == 1])

# 4c
lm(circumference ~age, subset = (Tree == 1))


# Question 5

# 5a
x <- c(5,2,4,-3,0,1)
y <- x[x>0]

# 5b
z <- x[x>0 & x%%2==0]

# 5c
x[2] <- NaN
q <- x[!is.nan(x)]


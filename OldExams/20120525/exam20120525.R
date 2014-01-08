# Question 1.

# 1a
students <- list(names = c('Amadeus','Rosa','Mona','Ludwig'), algebra = c(8,19,6,9), history = c(13,22,27,5), sex = c('M','F','F','M'))
students$sex <- as.factor(students$sex)

# 1b
femalesWhoPassedAlgebra <- (students$sex == 'F' & students$algebra>=10)
students$names[femalesWhoPassedAlgebra]

# 1c
continueProgramme <- (students$algebra>=10 & students$history>=10) | (students$algebra + students$history > 20)
students$names[continueProgramme]

# Question 2.

# 2a
myVector <- c(4,2,5,2)
myProduct <- 1
for (i in myVector){
  myProduct <- myProduct * i
}

# 2b
evenNumbers <- seq(2,14, by = 2)
for (i in evenNumbers){
  if (i>9) print(i)
}

# 2c
number <- 514
count <- 0
while (number>34){
  count <- count + 1
  number <- number / 2
}
print(count)


# Question 3.

# 3a
areaFunc <- function(r){
  area <- pi*r^2
  return(area)
}
areaFunc(r=2)

# 3b
randomDraws <- rexp(n = 10000, rate = 1/3)
areaSim <- areaFunc(randomDraws)
sum(areaSim > 50) / 10000

# Question 4.

# 4a
attach(attitude)
regModel <- lm(rating ~ complaints + raises + critical)
summary(regModel)

# 4b
X <- cbind(1, complaints, raises, critical)
y <- rating
betaHat <- solve(t(X) %*% X) %*% t(X) %*% y


# Question 5

# 5a
x <- rep(seq(0,2),4)

# 5b
y <- x[x>=1]

# 5c
xValues <- c(seq(-2,0,by = 0.1), seq(0.01,2, by = 0.01))
yValues <- 2*xValues^2 -3*xValues + 1
plot(xValues,yValues, col = 'red', type = "l", xlab = "x", ylab = 'f(x)', main = 'Just plotting a function')

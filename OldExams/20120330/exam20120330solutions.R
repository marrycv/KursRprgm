# ---------------------------------- Question 1 --------------------------------------

# 1a
staff <- list(names = c("Mike","Luke","Adrian","Sonja"), wage = c(24000,17000,31000,36000),
              manager = c(TRUE, FALSE, FALSE, TRUE))

# 1b
staff$name[staff$wage>30000 & staff$manager == TRUE]

# 1c
tooMuchMoney <- (staff$wage > 20000) & (staff$manager == FALSE)
staff$wage[tooMuchMoney] <- 0.9*staff$wage[tooMuchMoney]

# ---------------------------------- Question 2 --------------------------------------

# 2a
for (i in c(3,7,12,14)){
  print(i)
}

# 2b
myVector <- c(3,7,12,14)
mySum <- 0
for (i in 1:4){
  mySum <- mySum + myVector[i]
}

# 2c
condition <- TRUE
while(condition){
  randomNumber <- runif(1)
  if (randomNumber>0.9){
    condition <- FALSE
 }else{
   message('The random number is smaller than 0.9')
 }
}

# Alternativt

while(runif(1)<0.9){
  message('The random number is smaller than 0.9')
}







# ---------------------------------- Question 3 --------------------------------------

# 3a
CV <- function(dataSample){
  CoeffVar <- sd(dataSample)/mean(dataSample)
}

# 3b
expData <- rexp(n = 10, rate = 1/2) # Note that the help file says that rate = 1/mean
CVexp <- CV(expData)

# 3c
CVexp <- rep(0,1000)
for (i in 1:1000){
  expData <- rexp(n = 10, rate = 1/2)
  CVexp[i] <- CV(expData)
}
hist(CVexp)



# ---------------------------------- Question 4 --------------------------------------

# 4a
fish <- read.table(file = 'fishes.txt', header = TRUE, sep = '')

# 4b
regModel <- lm(fish$length ~ fish$age + fish$watertemp)

# 4c
plot(fish$age, regModel$residuals, col = 'red', pch = '+', ylab = 'Nice residuals')

# 4d
# The command class(regModel) tells me that regModel is of class 'lm', meaning a 
# linear model (regression model) object. An lm object is a little bit like a list
# in the sense that regModel$residuals gives me the residuals from the fitted model.
# See attributes(regModel) for a complete list of data that that is stored in the regModel object.
# But an lm object is more than a list since generic functions like plot and summary
# gives specially adapted plots and summaries that are tailored to regression-type object.


# ---------------------------------- Question 5 --------------------------------------

# 5a
x <- seq(0,pi, length = 100)
plot(x, sin(x), type = "l")

# 5b
PlotFunction <- function(funktion, interval, nPoints){
  xValues <- seq(interval[1], interval[2],length = nPoints)
  yValues <- funktion(xValues)
  plot(xValues,yValues, type = "l")
  return(NULL)
}
PlotFunction(sin,c(0,pi),100)
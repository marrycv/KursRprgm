


#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# ggplot()
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
library(ggplot2)
?ggplot()

data(diamonds)
data(longley)
?longley
?qplot


# testa ggplot:
data(mpg)
?mpg

?ggplot

# Quick plot:
qplot(mpg$displ, mpg$hwy)
qplot(displ, hwy, data=mpg, facets=.~drv)


# How to do this the correct way

p <- ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
p + geom_point()
# or
p <- ggplot(data = mpg) + aes(x = displ,y = hwy) + geom_point()
p

str(p)
summary(p)
class(p)

p + geom_smooth()
p + geom_smooth(method="lm")

p + facet_grid(.~drv)

p + geom_smooth(method="lm") + facet_grid(.~drv)

p + geom_smooth(method="loess") + facet_grid(.~drv)

# För lite data
p + facet_grid(fl~drv)




names(mpg)
?mpg


# Använda andra aestetics:
ggplot(data = mpg, aes(displ,hwy)) + 
  geom_point(color="steelblue") +
  geom_smooth(method="lm")

ggplot(data = mpg, aes(displ,hwy)) + 
  geom_point(color="green", size=4, alpha=0.5) +
  geom_smooth(method="lm")


# Använda färg och form som aestetic
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color=drv))

ggplot(data = mpg, aes(displ,hwy)) + 
  geom_point(aes(shape=drv, color=drv)) + 
  xlab("Displacement") + 
  ylab("Highway miles")


# Styra x labels och y labels


# Linjegrafer
library(ggplot2)
data(Nile)
Nile <- as.data.frame(Nile) 
colnames(Nile) <- "level"
Nile$years <- 1871:1970
Nile$period <- "- 1900" 
Nile$period[Nile$years >= 1900] <- "1900 - 1928"
Nile$period[Nile$years >= 1929] <- "1929 - 1946"
Nile$period[Nile$years > 1946] <- "1946 + " 
Nile$period <- as.factor(Nile$period)


ggplot(data=Nile) + aes(x=years, y=level) + geom_line()

ggplot(data=Nile) + aes(x=years, y=level) + geom_line(aes(color = period)) + scale_color_colorblind()

ggplot(data=Nile) + aes(x=years, y=level, color = period) + geom_line(aes(linetype = period))


# Teman
ggplot(data=Nile) + 
  aes(x=years, y=level, color = period) + 
  geom_line(aes(linetype = period)) + 
  theme_bw()

ggplot(data=Nile) + 
  aes(x=years, y=level, color = period) + 
  geom_line(aes(linetype = period)) + 
  theme_dark()

install.packages("ggthemes")
library(ggthemes)

ggplot(data=Nile) + 
  aes(x=years, y=level, color = period) + 
  geom_line(aes(linetype = period)) + 
  theme_economist()

ggplot(data=Nile) + 
  aes(x=years, y=level, color = period) + 
  geom_line(aes(linetype = period)) + 
  theme_excel()



# Longley data:

data(longley)
ggplot(data=longley) + aes(Year, GNP.deflator) + geom_line()


# ggplot och histgram:
data(chickwts)
a <- ggplot(data=chickwts, aes(x=weight))
a <- a + geom_bar()
a <- a + facet_grid(.~feed)
a

a <- ggplot(data=chickwts, aes(x=weight))
a <- a + geom_histogram(binwidth = 10)
a <- a + facet_grid(.~feed)
a


#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# regression:
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
?lm

data("trees")
class(trees)
plot(trees)
cov(trees)
cor(trees)
cor.test(trees$Girth, trees$Height)


# Run linear model
x <- lm(formula = Volume ~ Girth, data = trees)
class(x)
print(x)
x
summary(x)
anova(x)
plot(x)

x <- lm(formula = Volume ~ -1 + Girth, data = trees)

coef(x)
predict(x)
resid(x)

ggplot(data = data.frame(Volume = trees$Volume,  Girth = trees$Girth)) + 
  aes(x = Volume, y = Girth) +
  geom_point()

x <- lm(formula = Volume ~ ., data = trees)

x <- lm(formula = Volume ~ Girth + Height, data = trees)
print(x)
x
summary(x)
anova(x)
plot(x)

coef(x)
predict(x)
str(x)




#### Demo 08c: *apply-funktioner och körtid ####
#### Författare: Måns Magnusson

# Detta är (higher order) funktioner som kan användas isf. loopar
# Det finns flera, lapply (loopa över listor), tapply (loopa över index) m.m.

# Exempel på lapply
myList <- list(x = 1:10, y = c(NA,12:20))
lapply(X = myList, FUN = mean)
lapply(X = myList, FUN = mean, na.rm = TRUE)
lapply(X = myList, FUN = quantile, probs = seq(0, 1, 0.5), na.rm = TRUE)

# Exempel på tapply
# Denna funktion används ofta för att loopa över index, ex. medel i subgrupper
# Ett alternativ (wrapper) är funktionen aggregate
data(ChickWeight)

# Om vi vill använda en funktion per grupp, exempelvis diet görs följande
tapply(X = ChickWeight$weight, INDEX= ChickWeight$Diet, FUN= mean)
tapply(X = ChickWeight$weight, INDEX= ChickWeight$Diet, FUN= quantile)
tapply(X = ChickWeight$weight, INDEX= ChickWeight$Diet, FUN= quantile, probs = seq(0,1,0.1))



# Detta är extremt effektivt och används mycket i praktiken!


# Mäta körtid i R ----
system.time(expr=mean(rep(1:4, 1000)))
system.time(expr=mean(rep(1:4, 1000000)))
system.time(expr=mean(rep(1:4, 100000000)))


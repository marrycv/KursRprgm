#### Demo 14: Föreläsning 7 ####
#### Författare: Josef Wilzén
# test, strinr och linjär algebra

#----------------------------------------------------------
# Del 1: Linjär algebra
#----------------------------------------------------------



# Skapa en matris 

set.seed(20120301) 

A<-matrix(sample(1:9,size=9),ncol=3) 

B<-matrix(sample(1:12,size=12),ncol=3)

# Matrisoperationer

diag(3) 

t(B) 

B%*%A 

solve(A) 

solve(diag(3)) 

diag(c(1,2,3)) 

A%*%diag(3) 

A%*%diag(c(1,2,3)) 

eigen(A) 

eigen(diag(3)) 

rowSums(A) 

colSums(A) 

cbind(A,A) 

rbind(B,A) 

as.vector(A)


#----------------------------------------------------------
# Del 2: sweSCB
#----------------------------------------------------------

# för att intallera:
install.packages("devtools")
devtools::install_github("sweSCB","LCHansson")
library(sweSCB)


# hämta data:

minData <- findData()



topNode <- scbGetMetadata()
View(topNode)





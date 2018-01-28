#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
# Kod för den interaktiva delen för vecka 2
#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------



#------------------------------------------------------------------------------------------
# markmyassignment
#------------------------------------------------------------------------------------------
library(markmyassignment)
lab_path <-
  "https://raw.githubusercontent.com/STIMALiU/KursRprgm/master/Labs/Tests/d1.yml"
set_assignment(lab_path)
show_tasks()
LiuId<-"josad732"
Namn<-"josef"
three_elements<-function(){
  x<-c(1,2,3)
  return(x)
}

mark_my_assignment("three_elements")


#------------------------------------------------------------------------------------------
# return, print, cat, paste
#------------------------------------------------------------------------------------------

?cat

?print

?paste

a<-print("hej","lsakdg")
print(paste("hej","då"))
a
b<-cat("hej","ölkdsagöl")
b

f<-function(){
  print(1:10)
  return(mean(1:100))
}
a<-f()
a

f()



#------------------------------------------------------------------------------------------
# blandade frågor:
#------------------------------------------------------------------------------------------


# Vilken kodstil är lämplig?
# mer på vecka 4
# http://adv-r.had.co.nz/Style.html
# Google's R Style Guide


# Hur hanteras upphöjt till?

3^4
3**4

exp(1)  # = e^1 = e
exp(4)  # = e^4


# Skillanden mellan "<-", "=" och "=="?

#tilldelning
a<-3  # rekomenderas
b=2  # i funktionsargument

median(x = 20:100)

# "==" är en relationsoperator
# testar "lika med"

3==3
4==3
a==b

# olika parenteser i R:
# "()" används tillsammans med funktioner
?"("

mean(x =c(2,202,1,1,1))

# "{}": används för att "omsluta" en eller flera rader R-kod
# Tex i funktionsdefinitioner eller if-else (vecka 3)
a<-function(x){
  x<-x+5
  return(x)
}

# "[]": indexering
a<-20:4
a[4]

# räkna med TRUE och FALSE
# Hur många TRUE och FALSE är det i x?
x<-c(TRUE, TRUE,TRUE,FALSE,FALSE,TRUE,FALSE)
table(x)


# vad händer om vi gör en icke definerad matematisk operation?
sqrt(-3)
?NaN
NA
NaN
0/0
Inf-Inf

# Lägga ihop vektorer:
Test<- c(1,2,3,4,5,6,7) 
Test2<-c(1,2,3,4,5,4,4) 

y<-c(Test,Test2)
df<-data.frame(test_data=y)
df


# hur kan rep() användas?
# skapa vektorn (3 3 3 6 6 6)

a<-c(3,6)
rep(a,times=3)
rep(a,each=3)
rep(a,times=3,each=3)




















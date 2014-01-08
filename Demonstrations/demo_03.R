#### Demo 03: Introduktion till logik i R ####
#### Författare: Måns Magnusson



# Logiska vektorer ----

# Logiska vektorer kan skapas på samma sätt som övriga vektorer:
logisk_vektor1 <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
logisk_vektor1

# Även rep() fungerar för logiska vektorer
logisk_vektor2 <- rep(c(TRUE,FALSE,FALSE), 5)
logisk_vektor2

# Funktionen which() kan användas för att ta reda på vilka värden som är TRUE
which(logisk_vektor1)
which(logisk_vektor2)



# Slicing med logiska vektorer ----

# En mycket bra funktion med logiska vektorer är att de kan användas för "slicing".
# De värden som är TRUE, väljs ut från vektorn som "sliceas"
logisk_vektor <- c(TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE)
numerisk_vektor <- c(12,4,1,3,2,99,17)
logisk_vektor
numerisk_vektor

numerisk_vektor[logisk_vektor]

# Detta påminner om hur vi "sliceade" tidigare med index
which(logisk_vektor)
numerisk_vektor[logisk_vektor]
numerisk_vektor[which(logisk_vektor)]

# Att "slicea" med logiska vektorer är särskilt bra när vi använder relationsoperatorer



# Relationsoperatorer ----

# Relationsoperatorerna är ett sätt att skapa logiska vektorer enkelt.
# De vanligaste relationsoperatorerna är: ==, >=, <=, !=, <, >, %in%
numerisk_vektor <- c(3, 6, 1, 5, 2)
numerisk_vektor == 3
numerisk_vektor >= 2
numerisk_vektor < 1
numerisk_vektor != 6
numerisk_vektor %in% c(6, 2)


# Logiska operatorer ----
# Logiska operatorer är ett sätt att räkna med logiska tal (kallas ibland boolean algebra)
# De vanligaste logiska operatorerna är: !, &, |, xor()
A <- c(TRUE, TRUE, FALSE, FALSE)
B <- c(TRUE, FALSE, TRUE, FALSE)

!A
A & B
A | B
xor(A,B)

# Med paranteser kan dessa operatorer kombineras för att uttrycka andra logiska uttryck
a <- TRUE
b <- FALSE

xor(a,b) & !(!a & b)

# Det går att använda logiska operationer på vanliga numeriska vektorer också, då är 0 FALSE 
# och övriga tal TRUE. Exempel:
! 0:3



# Allt på en gång ----
# Ett vanligt sätt är att använda logiska vektorer, relationsoperatorer och logiska operatorer
# för att välja ut den data vi kan vara intresserad av
x <- c(-2, 88, 10, 9, 10,-100)

# Exempel: Vi vill välja ut tal som är större än 0 och mindre än 100
x[x > 0 & x < 100]

# Exempel: Vi vill välja ut tal som är positiva och delbara med 4
x[x > 0 | x %% 4 == 0]

# Exempel: Vi vill välja ut alla tal som som inte finns i vektorn 1:10
x[! x %in% 1:10 ]


#### Demo 01: Introduktion till R - programering ####
#### Författare: Måns Magnusson


# Enkla beräkningar -------------------------------------------------------
3 + 3 # Kommentarer görs med "hashtag" (#) 
1.1 - 0.2
4 * 5
1 / 4
5 ^ 2 # Potenser
9 %% 2 # Modulus (rest)
9 %/% 2 # Heltalsdivision


# Skapa variabler / objekt -------------------------------------------------------
# För att spara ett variabelnamn använd '<-'
year <- 2014

# Variabler fungerar som tal (och sparas i minnet (Global Enviroment))
year2 <- 2014 + 1

# För att "titta" på ett värde skriv variabelnamnet
year
year + 12 

# Variabler kan användas för att 
year10 <- year + 10
year10

# R är känsligt för gemener och versaler
YEAR # Fungerar inte
year # Fungerar

# Det går också att skapa variabler som innehåller text
namn <- "Måns"
adress <- "Hornsbruksgatan 5A"
namn
adress

# Enkla funktioner -------------------------------------------------------
# Alla funktioner skrivs med paranteser
sqrt(16) # Kvadratroten
factorial(5) # !

sin(0) # Sinus
cos(pi) # Cosinus
tan(pi / 4) # Tangens

exp(1) # e ^ 1
log(1) # Naturliga logaritmen med e som bas
log(100, base = 10) # Logaritmen med basen 10 


# Speciella tal/värden -------------------------------------------------------
# Irrationella tal
pi
exp(1) # talet e

# "Oändlighet"
Inf # Positiv oändlighet
-Inf # Negativ oändlighet

# "Saknade värden"
NaN # Not a number, ex. 0 / 0
NULL # Värdet "ingenting"
NA # Not available, Saknade värden 
3 + NaN
3 + NA
3 + NULL


# Skapa vektorer ----------------------------------------------------------------
# För att skapa en vektor används funktionen c() (Combine)
min_vektor <- c(1, 4, 10)
min_vektor

min_andra_vektor <- c(1, 2, 3, 4, 5)
min_andra_vektor

# Vektorer kan också kombineras med c()
min_stora_vektor <- c(min_vektor, min_andra_vektor)
min_stora_vektor

# Det finns också metoder för att skapa olika typer av vektorer
min_sekvens <- 3:11
min_sekvens
# Eller baklänges
min_bak_sekvens <- 11:3
min_bak_sekvens

min_andra_sekvens <- seq(from = 0, to = 4.6, by = 0.2)
min_andra_sekvens
min_tredje_sekvens <- seq(from = 4.6, to = 0, by = -0.2)
min_tredje_sekvens

# Det går också att använda variabler för att skapa sekvenser
x <- 2
y <- 10
x:y

# En vektor kan också "vändas" med rev()
min_andra_sekvens
rev(min_andra_sekvens)

# Det går också att skapa repeterade vektorer
min_rep_vektor <- rep(x = 4, times = 5)
min_rep_vektor

min_andra_rep_vektor <- rep(x = c(1, 2, 3), times = 5)
min_andra_rep_vektor

# Det går också att ha en vektor med character values
min_text_vektor <- c("Måns", "Magnusson", "Hornsbruksgatan 5A")
min_text_vektor

# Ta reda på dimensionen (längden) av en vektor
length(min_andra_rep_vektor)
length(min_text_vektor)


# "Slicea" vektorer ----
# Vi kan vilja ta ut enskilda element ur en vektor, för detta används []
# Index börjar med 1
ny_vektor <- 10:20
ny_vektor
ny_vektor[1]
ny_vektor[9]

# Det går också att ta bort element med minus 
ny_vektor[-2]

# För att välja flera element används en annan vektor som index 
ny_vektor[c(1, 2, 3)]
ny_vektor[1:3]
ny_vektor[rep(4, 3)] # Samma element kan tas ut flera gånger
ny_vektor[-3:-1]

# Elementen kan "möbleras om" på detta sätt (används senare av order() )
ny_vektor[11:1]


# Att räkna med vektorer ----------------------------------------------------------------
# All beräkning sker elementvis
en_till_vektor <- c(4, 2.1, -3, 1 / 4)
en_till_vektor

en_till_vektor + 3
en_till_vektor * 2
en_till_vektor ^ 2
en_till_vektor %/% 2

# Beräkningar med två olika vektorer sker också elementvis 
en_kort_vektor <- c(2, 7)
en_kort_vektor
# Vektorerna "upprepas" för att möjliggöra beräkningen
en_kort_vektor + en_till_vektor
en_till_vektor ^ en_kort_vektor

# Obs, är vektorerna inte multiplar av varandra så varnar R
en_udda_vektor <- 2:4
en_udda_vektor + en_till_vektor


# Funktioner för vektorer ----------------------------------------------------------------
vektor_a <- c(1, 6, 3, 1, -3)
vektor_a

# minimum, maximum
min(vektor_a)
max(vektor_a)
# arg minimum, arg maximum
which.min(vektor_a)
which.max(vektor_a)

# Lite statistiska funktioner för vektorer 
# (enskilda tal är egentligen vektorer av längd 1)
mean(vektor_a)
median(vektor_a)
var(vektor_a)
sd(vektor_a)
sum(vektor_a)
prod(vektor_a)

min(vektor_a)
max(vekto_a)

# Print och cat ----------------------------------------------------------------
# Om man vill skriva ut resultat till skärmen används print()
print("Hej") 
# Samma sak som att "titta" på en character
"Hej"
# Det går också att skriva ut till skärmen med cat()
cat("Hej")

# Skillnaden blir med textvektorer
min_text_vektor <- c("Måns", "Magnusson", "Hornsbruksgatan 5A")
min_text_vektor
cat(min_text_vektor)

# Med cat går det att välja vad som ska separera elementen
cat(min_text_vektor, sep=" + ")
cat(min_text_vektor, sep="\n") # \n betyder ny rad 


# Hjälpen i R ----------------------------------------------------------------
# Använd hjälpfönstret (sök på funktionen)
# Markera en funktion och tryck "F1"
# Skriv första bokstaven och klicka "tabb"



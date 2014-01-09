#### Demo 05: Filhantering, Input och Output (I/O)  ####
#### Författare: Måns Magnusson

# Skapa sökvägar ----
# Sökvägar är ett textvärde och kan sparas som en textvektor
# Exempel:
minSokvag <- "/Users/manma97/Dropbox/" # Mac / Linux
# OBS! Windowsanvändare ska använda / istället för \
minSokvag <- "C:/Skrivbord"

# Det är enklare att använda file.choose() för att skapa sökvägar
minSokvag <- file.choose()


# R Working directory ----
# Detta är katalogen R arbetar i som stardard
# För att ta reda på var working direktory är:
min_wd <- getwd()
min_wd

# För att ändra working directory
setwd(dir="/Users/manma97/")
getwd()

setwd(dir=min_wd)

# För att titta på vilka filer som finns i working directory används dir()
dir()

# Läsa och skriva .csv-filer ----
# Först skapar vi sökvägen till filen
minCSV <- file.choose()
minCSV

# Olika csv-format
appleData <- read.csv2(file = minCSV)
# Detta är en amerikans csv-fil
appleData <- read.csv(file = minCSV)

# I bakgrunden används read.table() för inställningar
?read.table

# Skriva .csv
# Först anges objektet som ska skrivas ut (ska vara en data.frame), sedan filnamnet
# Om bara ett filnamn anges hamnar filen i working directory
dir()
write.csv2(appleData, file = "appleData.csv")
dir()

# I bakgrunden används write.table() för inställningar
?write.table


# Läsa och skriva .Rdata - filer ----
# Läsa .Rdata
minRdata <- file.choose()
minRdata

load(file=minRdata)

# Spara R-objekt 
dir()
# Om bara ett filnamn anges (utan sökväg) hamnar filen i working directory
save(apple, file = "apple.Rdata")

# R filer kan spara flera objekt (mycket användbart)
save(apple, minRdata, file = "applemm.Rdata")

# Det går också att spara alla objekt i Global enviroment som en fil
save.image(file = "mittGlobalaEnv.Rdata")
# Samma sak:
save(list=ls(), file = "mittGlobalaEnv.Rdata")

# Och här kan vi se att filerna sparats
dir()


# Om vi rensar hela vårt globala eniviroment kan vi läsa in filerna en efter en
rm(list = ls()) # Vad gör de olika delarna här?

load("apple.Rdata")
rm(list = ls())

load("applemm.Rdata")
rm(list = ls())

load("mittGlobalaEnv.Rdata")


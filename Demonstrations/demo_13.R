#### Demo 13: Föreläsning 7 ####
#### Författare: Josef Wilzén
# test, strinr och linjär algebra

#----------------------------------------------------------
# Del 1: regular expressions:
#----------------------------------------------------------

# ladda in data:
setwd("/home/joswi05/Dropbox/RCourse2014/KursRprgm/Labs/DataFiles")
dir()

# encoding="latin1" gör att jag kan läsa in data med "åäö"
poem<-readLines("transtrom2.txt",encoding="latin1")

?regexp



grep(pattern="staden",poem)

grep(pattern="han",poem)

grep(pattern="v.r",poem)

# Börja med små bokstäver:
grep(pattern="^[a-ö]",poem)

grep(pattern="\\.$",poem)

grep(pattern="\\.+",poem)

grep(pattern="\\.{2,}$",poem)

grep(pattern="vara?",poem)

grep(pattern="tt|ll",poem)

grep(pattern="a(tt|ll)a?",poem) 





#----------------------------------------------------------
# Del 2: paketet stringr
#----------------------------------------------------------

# om du behöver installera paketet:
install.packages("stringr")

# ladda in i R:
library(stringr)

# ladda in data:
setwd("/home/joswi05/Dropbox/RCourse2014/KursRprgm/Labs/DataFiles")
dir()

# encoding="latin1" gör att jag kan läsa in data med "åäö"
poem<-readLines("transtrom2.txt",encoding="latin1")



# Anvand Thomas Transtrommers dikt.

# String concatenate

poem.cat<-str_c(poem,collapse="\n")

cat(poem.cat)

# Dela upp en string

str_split(string=poem.cat,pattern="\\\n") 

# String count 

str_count(poem,pattern="tt|ll") 

# String detect 

str_detect(poem,pattern="tt|ll") 

# Extract substrings 
str_extract(string=poem,pattern="[a-ö]{1,5}")
str_extract_all(string=poem,pattern="[a-ö]{1,5}")

# Get length of characters 

str_length(string=poem) 

# Get positions of the pattern 
str_locate(string=poem,pattern="[Hh]an") 
str_locate_all(string=poem,pattern="[Hh]an") 

# Identify a "pattern" 
str_match(string=poem,pattern="[Hh]an") 
str_match_all(string=poem,pattern="[Hh]an") 

# Replace a "pattern" with a string 

str_replace_all(string=poem,pattern="[Hh]an",replacement="hon") 


# använda backreferences:
# vi kan ge alternativ med \\1\\2...
str_replace_all(string=poem,pattern="(^[a-ö])([a-ö])([a-ö]+)",replacement="\\1-\\3")

str_replace_all(string=poem,pattern="([A-Öa-ö])([a-ö])([a-ö]+)",replacement="\\1?\\3") 

str_replace_all(string=poem,pattern="(^)([A-Ö])([a-ö]+)",replacement="\\1---\\3") 

str_replace_all(string=poem,pattern="(^)([A-Ö])([a-ö]+)",replacement="\\1\\2\\?") 

# Del av sträng 

#  Från example(str_sub())
hw <- "Hadley Wickham"

str_sub(hw, 1, 6)
str_sub(hw, end = 6)
str_sub(hw, 8, 14)
str_sub(hw, 8)
str_sub(hw, c(1, 8), c(6, 14))

str_sub(hw, -1)
str_sub(hw, -7)
str_sub(hw, end = -7)

str_sub(hw, seq_len(str_length(hw)))
str_sub(hw, end = seq_len(str_length(hw)))



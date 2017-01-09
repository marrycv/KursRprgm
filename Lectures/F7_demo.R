

# demo baserat på artiklen nedan och exempel från dok för stringr:
# "stringr: modern, consistent string processing" av Hadley Wickham
# https://journal.r-project.org/archive/2010-2/RJournal_2010-2_Wickham.pdf



library(stringr)

#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# from doc:
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------


# str_c

str_c("a","b","c")
paste("a","b","c")
str_c("a","b","c",sep = "--")

str_c(c("a","b","c"),c("d","e","f"),sep = "--")


a<-str_c("a","b","c",sep = "\n")
a
cat(a)
print(a)

# str_length
my_letters<-str_c(letters,collapse = "")
str_length(my_letters)

# str_sub
str_sub(string = my_letters,start = 3,end = 6)
my_letters
str_sub(string = my_letters,start = 3,end = 6)<-" hej! "
my_letters

# str_split
str_split(string = c("hej, hur är det?"),pattern = "[:space:]")
str_split(string = c("hej, hur är det?"),pattern = ",")

b<-c("hej, hur är det?","saidjf aslfk w ajfd asdj")
x<-str_split(string = b,pattern = "[:space:]")
x[[1]][1]

# str_trim

str_trim(string = c("   hej!", "    abc  ","test   "),side = "left")
str_trim(string = c("   hej!", "    abc  ","test   "),side = "right")
str_trim(string = c("   hej!", "    abc  ","test   "),side = "both")


# str_pad
str_pad(string = "HEJ!",width = 10,side ="left")

str_pad(string = "HEJ!",width = 10,side ="both")


#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

# pattern matching-funktioner:
?regex


str_detect(string = my_letters,pattern = "ab")
str_detect(string = my_letters,pattern = "cd")
str_locate(string = my_letters,pattern = "ab")


x<-" [a-z]{3} "
x<-"(^| )[a-z]{3} "
str_locate(string ="hud hej hejhej",pattern = x)


# str_replace

str_replace(string =" hej hejhej",pattern = x,replacement = "X")


# str_extract_all

y<-" hej"

str_extract
str_extract_all


#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

# str_extract {stringr}
shopping_list <- c("apples x4", "bag of flour", "bag of sugar", "milk x2")
str_extract(shopping_list, "\\d")
str_extract(shopping_list, "[a-z]+")
str_extract(shopping_list, "[a-z]{1,4}")
str_extract(shopping_list, "\\b[a-z]{1,4}\\b")

# Extract all matches
str_extract_all(shopping_list, "[a-z]+")
str_extract_all(shopping_list, "\\b[a-z]+\\b")
str_extract_all(shopping_list, "\\d")

# Simplify results into character matrix
str_extract_all(shopping_list, "\\b[a-z]+\\b", simplify = TRUE)
str_extract_all(shopping_list, "\\d", simplify = TRUE)




# from article:

strings <- c(" 219 733 8965", "329-293-8753 ", "banana", "595 794 7569",
             "387 287 6718", "apple", "233.398.9187  ", "482 952 3315", "239 923 8115",
             "842 566 4692", "Work: 579-499-7527", "$1000", "Home: 543.355.3679")

strings
phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"
phone
# Which strings contain phone numbers?
str_detect(strings, phone)
strings[str_detect(strings, phone)]
# Where in the string is the phone number located?
loc <- str_locate(strings, phone)
loc
# Extract just the phone numbers
str_sub(strings, loc[, "start"], loc[, "end"])
# Or more conveniently:
str_extract(strings, phone)
# Pull out the three components of the match
str_match(strings, phone)
# Anonymise the data
str_replace(strings, phone, "XXX-XXX-XXXX")



#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

# regression:

?lm

data("trees")
class(trees)
plot(trees)
cov(trees)
cor(trees)
cor.test(trees$Girth,trees$Volume)



x<-lm(formula = Volume~Girth,data = trees)
class(x)
print(x)
x
summary(x)
anova(x)
plot(x)

str(x)

coef(x)
predict(x)
plot(trees$Girth,predict(x))

x<-lm(formula = Volume~.,data = trees)
x<-lm(formula = Volume~Girth+Height,data = trees)
print(x)
x
summary(x)
anova(x)
plot(x)

coef(x)
predict(x)
str(x)




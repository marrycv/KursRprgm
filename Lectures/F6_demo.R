library(pxweb)
my_data<-interactive_pxweb()

index<-!is.na(my_data$values)
data2<-my_data[index,]
temp<-as.character(data2$år)
my_years<-as.numeric(temp)

plot(x = my_years,y = data2$values,xlab="år",ylab="hästar",type="o")


myDataSetName <- 
  get_pxweb_data(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/JO/JO0103/HusdjurL",
                 dims = list(Region = c('00'),
                             Djurslag = c('70'),
                             ContentsCode = c('JO0103L1'),
                             Tid = c('*')),
                 clean = TRUE)


my_data2<-interactive_pxweb(api = 'api.scb.se', version = 'v1', lang = 'sv')


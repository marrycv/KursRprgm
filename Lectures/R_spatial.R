

getwd()
dir()

library(downloader)
library(rgdal)
library(maptools)
library(rgeos)
library(pxweb)
library(ggmap)
library(sp)
library(stringr)


# Download and read data
kommuner_remote <- "https://raw.github.com/MansMeg/KursSvyMeth/master/Labs/DataFiles/Kommun_SCB.zip"
kommuner_local <- "Kommun_SCB.zip"
download(kommuner_remote, destfile = kommuner_local)
unzip(kommuner_local)



swe_municip <- readShapePoly("Kommun_SCB/Kommun_SCB_07.shp")
summary(swe_municip)
class(swe_municip)
plot(swe_municip)
my_data<-get_pxweb_data()

my_data <-
  get_pxweb_data(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/JO/JO0103/HusdjurK",
                 dims = list(Region = c('*'),
                             Djurslag = c('05'),
                             ContentsCode = c('JO0103K2'),
                             Tid = c('2007')),
                 clean = TRUE)
my_data <- my_data[, c(1,5)]
my_data[, 1] <- substr(as.character(my_data$region),1,4)
my_data[is.na(my_data[, 2]), 2] <- 0


head(swe_municip@data)

str(swe_municip@data)
swe_municip@data <- merge(swe_municip@data, my_data, by.x="KNKOD", by.y="region")
spplot(swe_municip, "values")

temp<-as.character(swe_municip@data$KNKOD)
temp<-str_sub(temp,start = 1,end = 2)
temp<-as.numeric(temp)

swe_municip@data$LN<-temp
swe_county <- unionSpatialPolygons(SpP = swe_municip,IDs = swe_municip@data$LN)
plot(swe_county)
summary(swe_county)

aggr_data <- aggregate(x=swe_municip@data$values, by=list(swe_municip@data$LN),FUN=sum)
names(aggr_data) <- c("LN", "kossor")

rownames(aggr_data) <- aggr_data$LN
swe_county <- SpatialPolygonsDataFrame(Sr=swe_county, data=aggr_data)

spplot(swe_county, "kossor")

# 2.2.3:

spatial_sthlm <- swe_municip[swe_municip@data[['LN']]==01,]
spatial_sthlm@data
plot(spatial_sthlm)
spplot(spatial_sthlm,"values")


aggr_data_sthlm <- aggregate(x=spatial_sthlm@data$values, by=list(spatial_sthlm@data$LN),FUN=sum)
names(aggr_data_sthlm) <- c("LN", "kossor")

rownames(aggr_data_sthlm) <- aggr_data_sthlm$LN
cow_sthlm <- SpatialPolygonsDataFrame(Sr=spatial_sthlm, data=aggr_data_sthlm)



names(swe_municip@data)
swe_municip@data$LN
str(swe_municip)
swe_municip@polygons
str(swe_municip@polygons)
length(swe_municip@polygons)



library(ggmap)
qmap("Linkoping",zoom=14)
linkpg_uni <- unlist(geocode("Linkopings Universitet"))
linkpg_uni

qmap(location=linkpg_uni, zoom=14, maptype="roadmap")
karta <- qmap(linkpg_uni, zoom = 14, maptype="satellite", color="bw")
karta

qmap(linkpg_uni, zoom = 12, source = "stamen", maptype = "toner")
qmap(linkpg_uni, extent = "normal", zoom=12)

set.seed(1984)
linkpg_map <- qmap("Linkoping", color="bw", zoom =12)
df <-
  data.frame(
    lon = jitter(rep(15.6, 50), amount = .15/4),
    lat = jitter(rep(58.4, 50), amount = .152/4),
    event = sample(c("Kometnedslag", "Olycka", "Polis"), size = 50, replace = TRUE)
  )

linkpg_map +geom_point(aes(x = lon, y = lat), data = df)


linkpg_map +geom_point(aes(x = lon, y = lat, colour = event, size = event),data = df)


linkpg_map +  stat_bin2d(aes(x = lon, y = lat),size = .5, bins = 20, alpha = 0.4, data = df)

linkpg_map +stat_density2d(aes(x = lon, y = lat),alpha = 0.2, size = 1,data = df, geom = "polygon")


proj4string(swe_municip) <- CRS("+init=epsg:3006")
library(rgdal)
swe_municip_4326 <- spTransform(swe_municip, CRS("+init=epsg:4326"))
data <- fortify(swe_municip_4326)
linkpg_large <- qmap("Linkoping", zoom = 6, maptype = "terrain")
linkpg_large



linkpg_large +geom_polygon(aes(x = long, y = lat, group = group), data = data,colour = "white", fill = "blue", alpha = .2, size = .3)




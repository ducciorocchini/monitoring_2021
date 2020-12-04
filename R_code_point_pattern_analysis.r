# Point pattern analysis

install.packages("spatstat")
library(spatstat)

######### IMPORT DATA FROM AN EXTERNAL SOURCE

# setwd("path/lab")

# setwd for Windows
# setwd("C:/lab/")

# setwd Mac
# setwd("/Users/yourname/lab/")

# Linux
setwd("~/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
covid

# Now, let's see the density of the covid data!
# let's make a planar point pattern in spatstat
attach(covid)
# x, y, ranges
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

density_map <- density(covid_planar)

plot(density_map)
points(covid_planar)

cl <- colorRampPalette(c('yellow','orange','red'))(100) # 
plot(density_map, col = cl)
points(covid_planar)

# Exercise: change the colour of the map
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar)

# Putting the coutnries ontop of the map

# for Linux: 
# sudo apt-get update
# sudo apt-get install libgdal-dev libproj-dev

install.packages("rgdal")

library(rgdal)

coastlines <- readOGR("ne_10m_coastline.shp")

cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)

png("figure1.png")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

pdf("figure1.pdf")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

###### interpolate case data

marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)

plot(cases_map, col = cl)
points(covid_planar)
plot(coastlines, add = T)

##### 
install.packages("sf")
library(sf)

Spoints <- st_as_sf(covid, coords = c("lon", "lat"))

cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T)

library(rgdal)
# put a smoother to the coastlines by resampling
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)

####### Leonardo Zabotti data

# setwd for Windows
# setwd("C:/lab/")

# setwd Mac
# setwd("/Users/yourname/lab/")

# Linux
setwd("~/lab/")

leo <- read.table("dati_zabotti.csv", header=T, sep=",")

head(leo)

attach(leo)

library(spatstat)
summary(leo)

leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))

plot(leo_ppp)

density_map <- density(leo_ppp)
plot(density_map)
points(leo_ppp)

# save the workspace:

# windows and Mac: File | save workspace 

# for linux
q()
# click yes

############ Interpolation of students' data

# setwd("path/lab")

# setwd for Windows
# setwd("C:/lab/")

# setwd Mac
# setwd("/Users/yourname/lab/")

# Linux
setwd("~/lab/")

load("point_pattern_analysis.RData")

ls()
head(leo)

library(spatstat)
attach(leo)
marks(leo_ppp) <- chlh
chlh_map <- Smooth(leo_ppp)

cl <- colorRampPalette(c('yellow','orange','red','green'))(100)  
plot(chlh_map, col=cl)
points(leo_ppp)

# Exercise: do the same for chls in the sediment
marks(leo_ppp) <- chls
chls_map <- Smooth(leo_ppp)

plot(chls_map, col=cl)
points(leo_ppp)

# multipanel
par(mfrow=c(1,3))

# first graph: density map
plot(density_map, col=cl)
points(leo_ppp)

# second graph
plot(chlh_map, col=cl)
points(leo_ppp)

# third graph
plot(chls_map, col=cl)
points(leo_ppp)

# Exercise: build a multipanel with 3 rows and 1 column
# multipanel
par(mfrow=c(3,1))

# first graph: density map
plot(density_map, col=cl)
points(leo_ppp)

# second graph
plot(chlh_map, col=cl)
points(leo_ppp)

# third graph
plot(chls_map, col=cl)
points(leo_ppp)






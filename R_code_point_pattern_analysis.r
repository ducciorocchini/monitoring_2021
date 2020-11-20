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




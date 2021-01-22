# R_code_sdm.r

library(sdm)
# if any errors come out: install.packages("sdm")
library(raster)
library(rgdal) # if not installed: install.packages("rgdal")

# import the species data
file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file) # readOGR

species

plot(species, pch=17)

species$Occurrence

plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17)







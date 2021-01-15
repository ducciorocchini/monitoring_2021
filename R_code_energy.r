# R_code_energy.r

# install.packages("rasterdiv")
# iinstall.packages("rasterVis")
library(rasterdiv)
library(raster)
library(rasterVis)

data(copNDVI)
plot(copNDVI)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

levelplot(copNDVI)


clymin <- colorRampPalette(c('yellow','red','blue'))(100) # 
plot(copNDVI, col=clymin)

clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)

clymax <- colorRampPalette(c('blue','red','yellow'))(100) # 
plot(copNDVI, col=clymax)

par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) # 
plot(copNDVI, col=clymax)

# crop
ext <- c(0,20,35,55)  # xmin xmax ymin ymax
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)




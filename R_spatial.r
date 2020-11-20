# R spatial 

install.packages("sp")
library(sp)

data(meuse)

head(meuse)

coordinates(meuse) = ~x+y

plot(meuse)

# spplot is used to plot elements like zinc, lead etc. spread in space
spplot(meuse, "zinc", main="Concentration of zinc")

# Exercise: plot the concentration of Copper
spplot(meuse, "copper", main="Concentration of copper")

# Exercise: see copper and zinc
spplot(meuse, c("copper","zinc"))

# this is the same solution we used for te first lecture
# primates <- c(1,5,10)

# Rather than using colours, let's make us of bubbles
bubble(meuse, "zinc")

# do the same for lead
bubble(meuse, "lead")
bubble(meuse, "lead", col="red")

###### Installing the ggplot2 library / package

install.packages("ggplot2")

library(ggplot2)

# ecological dataframe
# biofuels
biofuels <- c(120, 200, 350, 570, 750) # array of values: c
biofuels
# oxydative enzimes
oxydative <- c(1200, 1300, 21000, 34000, 50000) 

# dataframe
d <- data.frame(biofuels, oxydative)
d

# Is it the same to do data.frame(biofuels,oxydative)? yes!
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point()

ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(size = 5, col = "red")

# lines
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line() 

# points + lines
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(size = 5, col = "red")  +  geom_line() 

# polygons
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_polygon()

############## IMPORT DATA FROM AN EXTERNAL SOURCE

# Create a lab folder (also called directory) under the main disc and then set the working directory by:

# setwd("path/lab")

# setwd for Windows
setwd("C:/lab/")

# in case you could not create a lab folder:
setwed("C:/")

# setwd Mac
setwd("/Users/yourname/lab/")

# Linux
setwd("~/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
covid
head(covid)

summary(covid)

# ggplot2
library(ggplot2)
ggplot(covid, aes(x = lon, y = lat)) + geom_point()

# changing the size of the data...
ggplot(covid, aes(x = lon, y = lat, size = cases)) + geom_point()



















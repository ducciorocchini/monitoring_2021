# R_code_multivar.r

# install.packages("vegan")
library(vegan)

# setwd("path/lab")

# setwd for Windows
# setwd("C:/lab/")

# setwd Mac
# setwd("/Users/yourname/lab/")

# Linux
setwd("~/lab/")

load("biomes_multivar.RData")
ls()

# plot per species matrix
head(biomes)

multivar <- decorana(biomes)
multivar

plot(multivar)

# biomes names in the graph:
attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T) 

pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T) 
dev.off()

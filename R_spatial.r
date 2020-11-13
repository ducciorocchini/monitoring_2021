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







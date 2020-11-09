# Here you can write everything! This is a comment!

# R code for plotting the relationship among ecological variables

# install.packages is used to install packages
install.packages("sp")
library(sp) 

# data is used to recall datasets
data(meuse)

# llok inside the set!
meuse

View(meuse) # it might not work for mac
# solve using: https://www.xquartz.org

head(meuse)


# Exercise: mean of all of the variables?
# cadmium crazy mean extraction
# (11.7+8.6+6.5....)/N
summary(meuse)

# Exercise: plot zinc (y) against cadmium (x)
# error
plot(cadmium, zinc)
# Error in h(simpleError(msg, call)) : 
#  error in evaluating the argument 'x' in selecting a method for function 'plot': object 'cadmium' not found

# $

plot(meuse$cadmium, meuse$zinc)

# if you attach you do not need the dollar symbol!
attach(meuse)
plot(cadmium, zinc)

plot(cadmium,lead)

# how to impress your supervisor!
# Scatterplot Matrices
pairs(meuse)

# Question!!!
# pairing only the elements part of the dataset: how to do that?
# only with cadmium, copper, lead, zinc...

##############################

# Lecture #2 on ecological variables

# Exercise
# Recall the package sp, recall the dataset meuse

library(sp)
data(meuse)

pairs(meuse)

head(meuse)

# cadmium copper lead zinc
# pairs with soil variables
# from column 3 to column 6
pairs(meuse[,3:6]) # how to do quadratic parathenses: AltGr + è

# let's use the names of the columns:
pairs(~ cadmium + copper + lead + zinc, data=meuse) 
# tilde is going to be done by AltGr + ^
# in windows: Alt + 0126 or Alt + 126
# In Mac: alt + n on mac

# let's prettify the graph
# Exercise: just use cadmium, lead and zince
pairs(~ cadmium + lead + zinc, data=meuse)

# Exercise: change the color
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red") 

# for the future change colours of single panels by the par() function 

# Exercise: change the symbol to filled triangles: pch
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17) 

# nice page on pairs:
# https://statisticsglobe.com/r-pairs-plot-example/

# Exercise: increase the size of the trinagles
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17, cex=3) 



















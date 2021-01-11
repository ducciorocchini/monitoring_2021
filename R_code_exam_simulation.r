# R code for the exam!!
https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

# nc data: we need  library
# https://cran.r-project.org/web/packages/ncdf4/index.html

# install.packages("ncdf4")

  library(ncdf4)
  library(raster)

  setwd("~/lab/")

  # importing images
  tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
  plot(tjan)

  # Exercise: change the colorramppalette
  cltjan <- colorRampPalette(c('blue','yellow','red'))(100) # 
  plot(tjan, col=cltjan)

  toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
  plot(toct, col=cltjan)

  dift <- tjan - toct
  cldif <- colorRampPalette(c('blue','white','red'))(100) # 
  plot(dift, col=cldif)

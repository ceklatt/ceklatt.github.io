# Ratfish Project
# Courtney Klatt

# install.packages("adehabitatHR")

setwd("~/downloads")

df  <- read.csv("Ratfish Data.csv")

library(adehabitatHR)
library(rgdal)


telemetry.sp <- df[, c("Code", "Latitude", "Longitude")]

library(sp)

coordinates(telemetry.sp) <- c("Latitude", "Longitude")
# Set the coordinate reference system (CRS)
# More information on CRS here: 
# https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/OverviewCoordinateReferenceSystems.pdf
# The sample data are UTM points in WGS84 from zone 18N
proj4string(telemetry.sp) <- CRS( "+proj=utm +zone=18 +datum=WGS84 +units=m +no_defs" )

library(adehabitatHR)
kernel.ref <- kernelUD(telemetry.sp, h = "href")  # href = the reference bandwidth
image(kernel.ref) # plot


install.packages("ade4")

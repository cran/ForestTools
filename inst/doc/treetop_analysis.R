## ----global_options, include=FALSE, dpi =  300--------------------------------
knitr::opts_knit$set(global.par = TRUE)
options(rmarkdown.html_vignette.check_title = FALSE)

## ----setup--------------------------------------------------------------------
library(ForestTools)

## ---- eval = FALSE------------------------------------------------------------
#  install.packages("ForestTools")

## ---- message = FALSE, warning = FALSE----------------------------------------
# Attach the 'ForestTools' and 'terra' libraries
library(ForestTools)
library(terra)
library(sf)

# Load sample canopy height model
chm <- terra::rast(kootenayCHM)

## ---- fig.width = 4, fig.height = 2.51----------------------------------------
# Remove plot margins (optional)
par(mar = rep(0.5, 4))

# Plot CHM (extra optional arguments remove labels and tick marks from the plot)
plot(chm, xlab = "", ylab = "", xaxt='n', yaxt = 'n')

## -----------------------------------------------------------------------------
# Function for defining dynamic window size
lin <- function(x){x * 0.05 + 0.6}

# Detect treetops
ttops <- vwf(chm, winFun = lin, minHeight = 2)

## ---- fig.width = 4, fig.height = 2.51----------------------------------------
# Plot CHM
plot(chm, xlab = "", ylab = "", xaxt='n', yaxt = 'n')

# Add dominant treetops to the plot
plot(ttops$geometry, col = "blue", pch = 20, cex = 0.5, add = TRUE)


## -----------------------------------------------------------------------------
# Get the mean treetop height
mean(ttops$height)

## ---- fig.width = 4, fig.height = 2.51----------------------------------------
# Create crown map
crowns_ras <- mcws(treetops = ttops, CHM = chm, minHeight = 1.5)

# Plot crowns
plot(crowns_ras, col = sample(rainbow(50), nrow(unique(chm)), replace = TRUE), legend = FALSE, xlab = "", ylab = "", xaxt='n', yaxt = 'n')

## ---- fig.width = 4, fig.height = 2.51----------------------------------------
# Create polygon crown map
crowns_poly <- mcws(treetops = ttops, CHM = chm, format = "polygons", minHeight = 1.5)

# Plot CHM
plot(chm, xlab = "", ylab = "", xaxt='n', yaxt = 'n')

# Add crown outlines to the plot
plot(crowns_poly$geometry, border = "blue", lwd = 0.5, add = TRUE)

## -----------------------------------------------------------------------------
# Compute area and diameter
crowns_poly[["area"]] <- st_area(crowns_poly)
crowns_poly[["diameter"]] <- sqrt(crowns_poly[["area"]]/ pi) * 2

# Mean crown diameter
mean(crowns_poly$diameter)


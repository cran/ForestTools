## ----global_options, include=FALSE, dpi =  300--------------------------------
knitr::opts_knit$set(global.par = TRUE)
options(rmarkdown.html_vignette.check_title = FALSE)

## ----setup, include=FALSE-----------------------------------------------------
library(ForestTools)

## ---- eval = FALSE------------------------------------------------------------
#  update.packages()
#  
#  packageVersion("APfun")

## ---- eval = FALSE------------------------------------------------------------
#  library(ForestTools)
#  
#  data("kootenayCHM")
#  data("kootenayTrees")
#  
#  kootenayCrowns <- mcws(kootenayTrees, kootenayCHM, minHeight = 1.5, format = "polygons", OSGeoPath = "C:\\OSGeo4W64")


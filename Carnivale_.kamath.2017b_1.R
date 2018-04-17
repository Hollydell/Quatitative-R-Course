# NATDB collaboration function
# data pulled from Dryad data repository

rm(list = ls())

library(reshape)
source("/Users/christophercarnivale/Desktop/TempleRcourse/Colaboration_assignment/natdb/R/utility.R")

.kamath.2017b <- function(...) {
  dl_data <- read.csv(
    suppdata(
      x = "10.5061/dryad.9vk07",
      si = "KamathLososEvol_AnolissagreiSVL.csv"),
      as.is = TRUE
    )
  #metadata is column 1 - ID: identifying label for individual lizards (matched across datasets)
  meta_data <- dl_data[, 1, drop = FALSE]
  
  
  # data is columns 2 and 3
  my_data <-  dl_data[, c(2:3)]
  colnames(my_data) <- c("Sex", "snout_vent_length")
  my_data$species <- "anolis_sangrei" #species name
  #set the units for snout vent length
  my_units <- c("mm","mm")
  
  final_data <-  .df.melt(
    x = my_data,
    spp = "species",
    units = my_units,
    metadata = meta_data
  )
  return(final_data)
}

.kamath.2017b()


.df.melt


#my_data$species <- "anolis_sangrei" #species name
#set the units for snout vent length
#my_units <- "mm"

#final_data <- .df.melt(
 # x = my_data,
 # spp = "species",
 # units = my_units,
 # metadata = meta_data

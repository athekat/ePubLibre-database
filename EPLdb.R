library(tidyverse)
options(timeout=300)

tempdl <- tempfile()
download.file("https://rss.epublibre.org/csv",tempdl, mode="wb") 
unzip(tempdl, "epublibre.csv") 
epl <- read.csv("epublibre.csv", sep=",")
epl <- select(epl, 2, 3, 16)

epl$Enlace.s. <- paste("magnet:?xt=urn:btih:", epl$Enlace.s., sep="")
names(epl)[1] <- 'Titulo'
names(epl)[2] <- 'Autor'
names(epl)[3] <- 'Torrent'

write.csv (epl, "C:/Users/userName/Desktop/epldb.csv", row.names=FALSE) #Output dir
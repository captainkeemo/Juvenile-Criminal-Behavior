# Install necessary packages
install.packages("tidyverse")
install.packages("ggfortify")

library(tidyverse)
library(ggfortify)

# Download the dataset from the Federal Bureau of Investigation Crime Data Explorer and upload it onto Github
# Load the dataset from Github onto R
fileurl <- "https://raw.github.com/captainkeemo/Juvenile-Criminal-Behavior/main/arrests_national_juvenile.csv"
arrestdata <- read_csv(url(fileurl))

arrestdata_female <- data.frame(arrestdata[,4:5], arrestdata[,16:21])
arrestdata_male <- data.frame(arrestdata[,4:5], arrestdata[,10:15])
arrestdata_race <- data.frame(arrestdata[,4:5], arrestdata[,24:27])

# Finding optimal K (Female)
arrestdata_female[is.na(arrestdata_female)] <- 0
totalWSS <- c()
for (i in 1:10) {
  female_km <- kmeans(arrestdata_female[,3:8], i)
  totalWSS <- append(totalWSS, female_km$tot.withinss)
}
plot(1:10, totalWSS, xlab = "Number of clusters", ylab = "Total WSS", main = "Elbow Method (Female)")
lines(1:10, totalWSS)
abline(v = 3, col = "red")

# Finding optimal K (Male)
arrestdata_male[is.na(arrestdata_male)] <- 0
totalWSS <- c()
for (i in 1:10) {
  male_km <- kmeans(arrestdata_male[,3:8], i)
  totalWSS <- append(totalWSS, male_km$tot.withinss)
}
plot(1:10, totalWSS, xlab = "Number of clusters", ylab = "Total WSS", main = "Elbow Method (Male)")
lines(1:10, totalWSS)
abline(v = 3, col = "red")

# Finding optimal K (Race)
arrestdata_race[is.na(arrestdata_race)] <- 0
totalWSS <- c()
for (i in 1:10) {
  race_km <- kmeans(arrestdata_race[,3:6], i)
  totalWSS <- append(totalWSS, race_km$tot.withinss)
}
plot(1:10, totalWSS, xlab = "Number of clusters", ylab = "Total WSS", main = "Elbow Method (Race)")
lines(1:10, totalWSS)
abline(v = 3, col = "red")

# Install necessary packages
install.packages("tidyverse")
install.packages("ggfortify")
install.packages("readxl")

library(tidyverse)
library(ggfortify)
library(readxl)
# Download the dataset from the Federal Bureau of Investigation Crime Data Explorer and upload it onto Github
# Downloaded the dataset from Github onto R
path <- "E:\GitHub\Juvenile-Criminal-Behavior\arrests_national_juvenile.xlsx"
download.file(path, destfile = "arrests_national_juvenile.xlsx")
data <- read_excel("arrests_national_juvenile.xlsx")
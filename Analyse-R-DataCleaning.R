# analysis skript

library(tidyverse)

raw <- read_csv("~/TeleworkWS1920/data/Omnibusbefragung_A.csv")

source("data/qualtricshelpers.R")

filename <- "data/Omnibusbefragung_A.csv"

raw <- load_qualtrics_csv(filename)

raw_short <- raw[, c(-25, -38:-41, -50:-79, -96:-104)]

names(raw_short)

generate_codebook(raw_short, filename, "data/codebook.csv")



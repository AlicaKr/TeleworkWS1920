# analysis skript

library(tidyverse)

raw <- read_csv("~/Downloads/RProject/TeleworkWS1920/data/Omnibusbefragung_A.csv")

source("data/qualtricshelpers.R")

filename <- "data/Omnibusbefragung_A.csv"

raw <- load_qualtrics_csv(filename)
names(raw)
raw_short <- raw[, c(-1:-17,-25, -38:-41, -50:-79, -96:-104)]

names(raw_short)

generate_codebook(raw_short, filename, "data/codebook.csv")

codebook <- read_codebook("data/codebook_final.csv")

names(raw_short) <- codebook$variable

raw_short$q8 <- as.factor(raw_short$q8)

raw_short$q16 <- ordered(raw_short$q16, levels = c("kein Schulabschluss",
                                                     "Hauptschulabschluss",
                                                     "Realschulabschluss",
                                                     "Fachabitur",
                                                      "Allg. Hochschulreife",
                                                    "Abgeschlossene Ausbildung",
                                                      "Bachelor",
                                                      "Master",
                                                    "Diplom",
                                                      "Promotion"
                                                    ))

raw_short$q12 <- ordered(raw_short$q12, levels = c("Schueler",
                    "Student",
"Werksstudent",
"Praktikant",
"Arbeitssuchend",
"Auszubildender",
"Angestellt (Teilzeit)",
"Angestellt (Vollzeit)",
"Angestellt in Führungsposition (Teilzeit)",
"Angestellt in Führungsposition (Vollzeit)",
"Geschäftsführung (Teilzeit)",
"Geschäftsführung (Vollzeit)",
"Freiberuflich (Freelancer)",
"Selbstständig",
"Rentner" ))

raw_short$q14 <- ordered(raw_short$q14, levels = c("Ich war noch nie berufstätig.",
                                          "Bauwesen, Architektur, Vermessung",
"Dienstleistung",
"Elektro",
"Gesundheit & Pflege",
"IT, Computer",
"Kunst, Kultur und Gestaltung",
"Landwirtschaft, Natur, Umwelt",
"Medien",
"Metall, Maschinenbau",
"Naturwissenschaften",
"Produktion, Fertigung",
"Soziales, Pädagogik",
"Technik, Technologiefelder",
"Verkehr, Logistik",
"Wirtschaft, Verwaltung",
"Sonstiges (bitte angeben)"))

raw_short$q27 <- ordered(raw_short$q27, levels = c("unter 20 Std.",
                                                   "20 Std. bis 29 Std.",
                                                   "30 Std. bis 39 Std.",
                                                   "40 Std. bis 50 Std.",
                                                   "über 50 Std."))
  
raw_short$q41 <- ordered(raw_short$q41, levels = c("ja",
                                                   "nein"))

raw_short$q53 <- ordered(raw_short$q53, levels = c("Ich habe noch nie IKTs genutzt.",
                                                   "Ich nutze seit meinem Berufseinstieg dieselben IKTs.",
                                                   "Ich habe schon unterschiedliche IKTs genutzt."))

raw_short$q44 <- ordered(raw_short$q44, levels = c("ja",
                                                   "nein"))
scale.haeufigkeit <- c("Gar nicht",
                       "Weniger als einen Tag",
                       "Einen Tag",
                       "Zwei Tage",
                       "Drei Tage",
                       "Vier Tage",
                       "Mehr als vier Tage")

raw_short$q42 <- ordered(raw_short$q42, levels = scale.haeufigkeit)

scale.haeufigkeit1 <- c("Nie",
                        "Weniger als einmal im Monat",
                        "Weniger als einmal pro Woche",
                        "Ein- bis zweimal pro Woche",
                        "Täglich",
                        "Mehrmals täglich")

raw_short$q51_1 <- ordered(raw_short$q51_1, levels = scale.haeufigkeit1)
raw_short$q51_2 <- ordered(raw_short$q51_2, levels = scale.haeufigkeit1)

scale.zustimmung <- c("Stimme gar nicht zu", 
                     "Stimme nicht zu", 
                     "Stimme eher nicht zu", 
                     "Stimme eher zu", 
                     "Stimme zu", 
                     "Stimme völlig zu")

raw_short$q43_1 <- ordered(raw_short$q43_1, levels = scale.zustimmung)
raw_short$q43_2 <- ordered(raw_short$q43_2, levels = scale.zustimmung)
raw_short$q43_3 <- ordered(raw_short$q43_3, levels = scale.zustimmung)
raw_short$q43_4 <- ordered(raw_short$q43_4, levels = scale.zustimmung)
raw_short$q43_5 <- ordered(raw_short$q43_5, levels = scale.zustimmung)
raw_short$q43_6 <- ordered(raw_short$q43_6, levels = scale.zustimmung)

raw_short$q57_1 <- ordered(raw_short$q57_1, levels = scale.zustimmung)
raw_short$q57_2 <- ordered(raw_short$q57_2, levels = scale.zustimmung)
raw_short$q57_3 <- ordered(raw_short$q57_3, levels = scale.zustimmung)
raw_short$q57_4 <- ordered(raw_short$q57_4, levels = scale.zustimmung)
raw_short$q57_5 <- ordered(raw_short$q57_5, levels = scale.zustimmung)

raw_short$q38_1 <- ordered(raw_short$q38_1, levels = scale.zustimmung)
raw_short$q38_2 <- ordered(raw_short$q38_2, levels = scale.zustimmung)
raw_short$q38_3 <- ordered(raw_short$q38_3, levels = scale.zustimmung)
raw_short$q38_4 <- ordered(raw_short$q38_4, levels = scale.zustimmung)
raw_short$q38_5 <- ordered(raw_short$q38_5, levels = scale.zustimmung)
raw_short$q38_6 <- ordered(raw_short$q38_6, levels = scale.zustimmung)
raw_short$q38_7 <- ordered(raw_short$q38_7, levels = scale.zustimmung)
raw_short$q38_8 <- ordered(raw_short$q38_8, levels = scale.zustimmung)
raw_short$q38_9 <- ordered(raw_short$q38_9, levels = scale.zustimmung)
raw_short$q38_10 <- ordered(raw_short$q38_10, levels = scale.zustimmung)
raw_short$q38_11 <- ordered(raw_short$q38_11, levels = scale.zustimmung)

raw_short$q46_1 <- ordered(raw_short$q46_1, levels = scale.zustimmung)
raw_short$q46_2 <- ordered(raw_short$q46_2, levels = scale.zustimmung)
raw_short$q46_3 <- ordered(raw_short$q46_3, levels = scale.zustimmung)
raw_short$q46_4 <- ordered(raw_short$q46_4, levels = scale.zustimmung)

raw_short$q48_1 <- ordered(raw_short$q48_1, levels = scale.zustimmung)
raw_short$q48_2 <- ordered(raw_short$q48_2, levels = scale.zustimmung)
raw_short$q48_3 <- ordered(raw_short$q48_3, levels = scale.zustimmung)
raw_short$q48_4 <- ordered(raw_short$q48_4, levels = scale.zustimmung)
raw_short$q48_5 <- ordered(raw_short$q48_5, levels = scale.zustimmung)

raw_short$q50_1 <- ordered(raw_short$q50_1, levels = scale.zustimmung)
raw_short$q50_2 <- ordered(raw_short$q50_2, levels = scale.zustimmung)
raw_short$q50_3 <- ordered(raw_short$q50_3, levels = scale.zustimmung)
raw_short$q50_4 <- ordered(raw_short$q50_4, levels = scale.zustimmung)
raw_short$q50_5 <- ordered(raw_short$q50_5, levels = scale.zustimmung)

library(psych)

schluesselliste <- list(Q38 = c("-q38_1", "q38_2", "q38_3", "q38_4", "-q38_5", "-q38_6", "q38_7", "q38_8", "-q38_9", "q38_10", "q38_11", "q38_12"),
                        Q50 = c("q50_1", "q50_2", "-q50_3", "q50_4", "q50_5"))

scores <- scoreItems(schluesselliste, raw_short, missing = TRUE, min = 1, max = 6)

data <- bind_cols(raw_short, as_tibble(scores$scores))

saveRDS(data, "data/data.rds")

# analysis skript

library(tidyverse)


raw <- read_csv("~/Downloads/RProject/TeleworkWS1920/data/OmnibusbefragungA_NEU.csv")


source("data/qualtricshelpers.R")

filename <- "data/OmnibusbefragungA_NEU.csv"

raw <- load_qualtrics_csv(filename)
names(raw)


raw_short <- raw[c(-1:-1110), c(-1:-17,-40:-41, -54:-83, -100:-108)]
names(raw_short)

generate_codebook(raw_short, filename, "data/codebook.csv")

codebook <- read_codebook("data/codebook_NEU.csv")

names(raw_short) <- codebook$variable

raw_short$geschlecht <- as.factor(raw_short$geschlecht)

raw_short$abschluss <- ordered(raw_short$abschluss, levels = c("kein Schulabschluss",
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

raw_short$taetigkeit <- ordered(raw_short$taetigkeit, levels = c("Schueler",
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

raw_short$branche <- ordered(raw_short$branche, levels = c("Ich war noch nie berufstätig.",
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
"Wirtschaft, Verwaltung"))


raw_short$af_2 <- ordered(raw_short$af_2, levels = c("unter 20 Std.",
                                                   "20 Std. bis 29 Std.",
                                                   "30 Std. bis 39 Std.",
                                                   "40 Std. bis 50 Std.",
                                                   "über 50 Std."))
  
raw_short$af_4 <- ordered(raw_short$af_4, levels = c("ja",
                                                   "nein"))

raw_short$ikt_1 <- ordered(raw_short$ikt_1, levels = c("Ich habe noch nie IKTs genutzt.",
                                                   "Ich nutze seit meinem Berufseinstieg dieselben IKTs.",
                                                   "Ich habe schon unterschiedliche IKTs genutzt."))

raw_short$az_3 <- ordered(raw_short$az_3, levels = c("ja",
                                                   "nein"))
scale.haeufigkeit <- c("Gar nicht",
                       "Weniger als einen Tag",
                       "Einen Tag",
                       "Zwei Tage",
                       "Drei Tage",
                       "Vier Tage",
                       "Mehr als vier Tage")

raw_short$af_5 <- ordered(raw_short$af_5, levels = scale.haeufigkeit)

scale.haeufigkeit1 <- c("Nie",
                        "Weniger als einmal im Monat",
                        "Weniger als einmal pro Woche",
                        "Ein- bis zweimal pro Woche",
                        "Täglich",
                        "Mehrmals täglich")

raw_short$ikt_2a <- ordered(raw_short$ikt_2a, levels = scale.haeufigkeit1)
raw_short$ikt_2b <- ordered(raw_short$ikt_2b, levels = scale.haeufigkeit1)

scale.zustimmung <- c("Stimme gar nicht zu", 
                     "Stimme nicht zu", 
                     "Stimme eher nicht zu", 
                     "Stimme eher zu", 
                     "Stimme zu", 
                     "Stimme völlig zu")

raw_short$kut_1a <- ordered(raw_short$kut_1a, levels = scale.zustimmung)
raw_short$kut_1b <- ordered(raw_short$kut_1b, levels = scale.zustimmung)
raw_short$kut_1c <- ordered(raw_short$kut_1c, levels = scale.zustimmung)
raw_short$kut_1d <- ordered(raw_short$kut_1d, levels = scale.zustimmung)

raw_short$af_6a <- ordered(raw_short$af_6a, levels = scale.zustimmung)
raw_short$af_6b <- ordered(raw_short$af_6b, levels = scale.zustimmung)
raw_short$af_6c <- ordered(raw_short$af_6c, levels = scale.zustimmung)
raw_short$af_6d <- ordered(raw_short$af_6d, levels = scale.zustimmung)
raw_short$af_6e <- ordered(raw_short$af_6e, levels = scale.zustimmung)
raw_short$af_6f <- ordered(raw_short$af_6f, levels = scale.zustimmung)


raw_short$ikt_3a <- ordered(raw_short$ikt_3a, levels = scale.zustimmung)
raw_short$ikt_3b <- ordered(raw_short$ikt_3b, levels = scale.zustimmung)
raw_short$ikt_3c <- ordered(raw_short$ikt_3c, levels = scale.zustimmung)
raw_short$ikt_3d <- ordered(raw_short$ikt_3d, levels = scale.zustimmung)
raw_short$ikt_3e <- ordered(raw_short$ikt_3e, levels = scale.zustimmung)


raw_short$az_1a <- ordered(raw_short$az_1a, levels = scale.zustimmung)
raw_short$az_1b <- ordered(raw_short$az_1b, levels = scale.zustimmung)
raw_short$az_1c <- ordered(raw_short$az_1c, levels = scale.zustimmung)
raw_short$az_1d <- ordered(raw_short$az_1d, levels = scale.zustimmung)
raw_short$az_1e <- ordered(raw_short$az_1e, levels = scale.zustimmung)
raw_short$az_1f <- ordered(raw_short$az_1f, levels = scale.zustimmung)
raw_short$az_1g <- ordered(raw_short$az_1g, levels = scale.zustimmung)
raw_short$az_1h <- ordered(raw_short$az_1h, levels = scale.zustimmung)
raw_short$az_1i <- ordered(raw_short$az_1i, levels = scale.zustimmung)
raw_short$az_1j <- ordered(raw_short$az_1j, levels = scale.zustimmung)
raw_short$az_1k <- ordered(raw_short$az_1k, levels = scale.zustimmung)
raw_short$az_1l <- ordered(raw_short$az_1l, levels = scale.zustimmung)

raw_short$az_4a <- ordered(raw_short$az_4a, levels = scale.zustimmung)
raw_short$az_4b <- ordered(raw_short$az_4b, levels = scale.zustimmung)
raw_short$az_4c <- ordered(raw_short$az_4c, levels = scale.zustimmung)
raw_short$az_4d <- ordered(raw_short$az_4d, levels = scale.zustimmung)

raw_short$az_5a <- ordered(raw_short$az_5a, levels = scale.zustimmung)
raw_short$az_5b <- ordered(raw_short$az_5b, levels = scale.zustimmung)
raw_short$az_5c <- ordered(raw_short$az_5c, levels = scale.zustimmung)
raw_short$az_5d <- ordered(raw_short$az_5d, levels = scale.zustimmung)
raw_short$az_5e <- ordered(raw_short$az_5e, levels = scale.zustimmung)

raw_short$az_6a <- ordered(raw_short$az_6a, levels = scale.zustimmung)
raw_short$az_6b <- ordered(raw_short$az_6b, levels = scale.zustimmung)
raw_short$az_6c <- ordered(raw_short$az_6c, levels = scale.zustimmung)
raw_short$az_6d <- ordered(raw_short$az_6d, levels = scale.zustimmung)
raw_short$az_6e <- ordered(raw_short$az_6e, levels = scale.zustimmung)

library(psych)

schluesselliste <- list(KUT_1 = c("kut_1a", "kut_1b", "kut_1c", "-kut_1d"),
                        AZ_1 = c("-az_1a", "az_1b", "az_1c", "az_1d", "-az_1e", "-az_1f", "az_1g", "az_1h", "-az_1i", "az_1j", "az_1k", "az_1l"),
                        AZ_6 = c("az_6a", "az_6b", "-az_6c", "az_6d", "az_6e"),
                        AZ_4 = c("az_4a", "az_4b", "-az_4c", "-az_4d"))

scores <- scoreItems(schluesselliste, raw_short, missing = TRUE, min = 1, max = 6)

data <- bind_cols(raw_short, as_tibble(scores$scores))

saveRDS(data, "data/data.rds")


# Test dieser Kommentar sollte einen Change in Git auslösen

## JRH: Sieht schonmal gut aus!
# Todo:
# 1. Codebook
# 2. .csv als numerisch oder als text?
# 3. Was ist mit den Skalen? Haben Sie wirklich nur zwei?



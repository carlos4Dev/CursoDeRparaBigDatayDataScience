# Usos horarios

library(tidyverse)
library(lubridate)
library(datos)

Sys.timezone()
# [1] "Europe/Paris"

length(OlsonNames())
# [1] 593

head(OlsonNames())
# [1] "Africa/Abidjan"     "Africa/Accra"       "Africa/Addis_Ababa"
# [4] "Africa/Algiers"     "Africa/Asmara"      "Africa/Asmera" 

(x1 <- ymd_hms("2015-06-01 12:00:00", tz = "America/New_York"))
(x2 <- ymd_hms("2015-06-01 18:00:00", tz = "Europe/Copenhagen"))
(x3 <- ymd_hms("2015-06-02 04:00:00", tz = "Pacific/Auckland"))

x1 - x2
# Time difference of 0 secs

x1 - x3
# Time difference of 0 secs

x4 <- c(x1, x2, x3)
x4
# [1] "2015-06-01 12:00:00 EDT" "2015-06-01 12:00:00 EDT"
# [3] "2015-06-01 12:00:00 EDT"



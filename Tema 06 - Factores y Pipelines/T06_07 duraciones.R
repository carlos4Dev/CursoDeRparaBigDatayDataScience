# Duración

library(tidyverse)
library(lubridate)
library(datos)

edad_h <- today() - ymd(19950125)
edad_h
# Time difference of 9659 days
as.duration(edad_h)
# [1] "834537600s (~26.44 years)"

dseconds(15)
# [1] "15s"

dminutes(23)
# [1] "1380s (~23 minutes)"

2 * dyears(1)
# [1] "63115200s (~2 years)"

# Hoy es 2021-07-06
ayer <- today() - ddays(1)
ayer
# [1] "2021-07-05"

anio_pasado <- today() - dyears(1)
anio_pasado
# [1] "2020-07-05 18:00:00 UTC"

una_pm <- ymd_hms("2019-03-12 13:00:00")
una_pm
# [1] "2019-03-12 13:00:00 UTC"

una_pm + ddays(1)
# [1] "2019-03-13 13:00:00 UTC"

# 2016 es año bisiesto
una_pm2 <- ymd_hms("2016-03-12 13:00:00", tz = "America/New_York")

una_pm2 + ddays(1)
# [1] "2016-03-13 14:00:00 EDT"
# Hay una diferencia de una hora por los usos horarios
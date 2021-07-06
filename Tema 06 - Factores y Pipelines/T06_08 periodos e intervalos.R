# Periodos e intervalos

library(tidyverse)
library(lubridate)
library(datos)

dos_pm <- ymd_hms("2016-03-12 13:00:00", tz = "America/New_York")

dos_pm + ddays(1)
# [1] "2016-03-13 14:00:00 EDT"

seconds(15)
# [1] "15S"

minutes(10)
# [1] "10M 0S"

10 * (months(6) + days(1))
# [1] "60m 10d 0H 0M 0S"

days(50) + hours(25) + minutes(2)
# [1] "50d 25H 2M 0S"


# 2016 es año bisiesto al sumar un año (365), no nos el 01/01 si no el 31/12
ymd("2016-01-01") + dyears(1)
# [1] "2016-12-31 06:00:00 UTC"

ymd("2016-01-01") + years(1)
# [1] "2017-01-01"    aquí devuelve un año, pues solo ha sumado el año

vuelos_dt <- vuelos

vuelos_dt %>%
  filter(horario_llegada < horario_salida)
# A tibble: 10,633 x 19
#     anio   mes   dia horario_salida salida_programada atraso_salida
#    <int> <int> <int>          <int>             <int>         <dbl>
# 1  2013     1     1           1929              1920             9
# 2  2013     1     1           1939              1840            59
# 3  2013     1     1           2058              2100            -2
# 4  2013     1     1           2102              2108            -6
# 5  2013     1     1           2108              2057            11
# 6  2013     1     1           2120              2130           -10
# 7  2013     1     1           2121              2040            41
# 8  2013     1     1           2128              2135            -7
# 9  2013     1     1           2134              2045            49
# 10  2013     1     1           2136              2145            -9
# ... with 10,623 more rows, and 13 more variables: horario_llegada <int>,
#   llegada_programada <int>, atraso_llegada <dbl>, aerolinea <chr>,
#   vuelo <int>, codigo_cola <chr>, origen <chr>, destino <chr>,
#   tiempo_vuelo <dbl>, distancia <dbl>, hora <dbl>, minuto <dbl>,
#   fecha_hora <dttm>



siguiente_anio <- today() + years(1)
(today() %--% siguiente_anio) / ddays(1)
# [1] 365

(today() %--% siguiente_anio) %/% days(1)
#[1] 365


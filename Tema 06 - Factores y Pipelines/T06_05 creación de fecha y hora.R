# Creación de fecha y hora

library(tidyverse)
library(lubridate)
library(datos)

today()
# [1] "2021-07-03"

now()
# [1] "2021-07-03 06:02:26 CEST"

ymd("2021-07-03")
# [1] "2021-07-03"

mdy("Julio 3, 2021")
# [1] "2021-07-03"

dmy("3-Jul-2021")
# [1] "2021-07-03"

ymd(20210703)
# [1] "2021-07-03"

ymd_hms("2021-07-03 06:32:15")
# [1] "2021-07-03 06:32:15 UTC"

mdy_hm("07/03/2021 06:33")
# [1] "2021-07-03 06:33:00 UTC"


# componentes individuales

vuelos %>%
  select(anio, mes, dia, hora, minuto)
# A tibble: 336,776 x 5
#   anio   mes   dia  hora minuto
#   <int> <int> <int> <dbl>  <dbl>
# 1  2013     1     1     5     15
# 2  2013     1     1     5     29
# 3  2013     1     1     5     40
# 4  2013     1     1     5     45
# 5  2013     1     1     6      0
# 6  2013     1     1     5     58
# 7  2013     1     1     6      0
# 8  2013     1     1     6      0
# 9  2013     1     1     6      0
# 10  2013     1     1     6      0
# # ... with 336,766 more rows

vuelos %>%
  select(anio, mes, dia, hora, minuto) %>%
  mutate(salida = make_datetime(anio, mes, dia, hora, minuto))
# A tibble: 336,776 x 6
#   anio   mes   dia  hora minuto salida             
#   <int> <int> <int> <dbl>  <dbl> <dttm>             
# 1  2013     1     1     5     15 2013-01-01 05:15:00
# 2  2013     1     1     5     29 2013-01-01 05:29:00
# 3  2013     1     1     5     40 2013-01-01 05:40:00
# 4  2013     1     1     5     45 2013-01-01 05:45:00
# 5  2013     1     1     6      0 2013-01-01 06:00:00
# 6  2013     1     1     5     58 2013-01-01 05:58:00
# 7  2013     1     1     6      0 2013-01-01 06:00:00
# 8  2013     1     1     6      0 2013-01-01 06:00:00
# 9  2013     1     1     6      0 2013-01-01 06:00:00
# 10  2013     1     1     6      0 2013-01-01 06:00:00
# # ... with 336,766 more rows


# Aquí me da error, no me reconoce anio

hacer_fechahora_100 <- function(anio, mes, dia, tiempo) {
  make_datetime(anio, mes, dia, tiempo %/% 100, tiempo %% 100)
}

# No puedo ejecutar esto porque la función no me funciona

vuelos_dt <- vuelos %>%
  filter(!is.na(horario_salida), !is.na(horario_llegada)) %>%
  mutate(
    horario_salida = hacer_fechahora_100(anio, mes, dia, horario_salida),
    horario_llegada = hacer_fechahora_100(anio, mes, dia, horario_llegada),
    salida_programada = hacer_fechahora_100(anio, mes, dia, salida_programada),
    llegada_programada = hacer_fechahora_100(anio, mes, dia, llegada_programada)
  ) %>%
  select(origen, destino, starts_with("atraso"), starts_with("horario"), ends_with("horario"), ends_with("programada"), tiempo_vuelo)


vuelos_dt

# Debería mostrar un tibble con 9 columnas
# origen, destino, atraso_salida, atraso_llegada, salida_programada, llegada_programada y tiempo_vuelo
# En un princio no funciona, pero después de reiniciar el ordenador si funciona

vuelos_dt %>%
  ggplot(aes(horario_salida)) + 
  geom_freqpoly(binwidth = 86400)


vuelos_dt %>%
  filter(horario_salida < ymd(20130102)) %>%
  ggplot(aes(horario_salida)) +
  geom_freqpoly(binwidth = 600)

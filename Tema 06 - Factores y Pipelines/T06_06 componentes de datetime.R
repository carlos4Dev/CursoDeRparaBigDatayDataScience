# Componentes de datetime

library(tidyverse)
library(lubridate)
library(datos)

fechahora <- ymd_hms("2016-07-08 12:34:56")

year(fechahora)
# [1] 2016

month(fechahora)
# [1] 7

mday(fechahora)
# [8]

month(fechahora, label = TRUE)
# [1] jul
# 12 Levels: ene < feb < mar < abr < may < jun < jul < ago < sep < ... < dic

wday(fechahora, label = TRUE, abbr = FALSE)
# [1] viernes
# 7 Levels: domingo < lunes < martes < miércoles < jueves < ... < sábado

hacer_fechahora_100 <- function(anio, mes, dia, tiempo) {
  make_datetime(anio, mes, dia, tiempo %/% 100, tiempo %% 100)
}

vuelos_dt <- vuelos %>%
  filter(!is.na(horario_salida), !is.na(horario_llegada)) %>%
  mutate(
    horario_salida = hacer_fechahora_100(anio, mes, dia, horario_salida),
    horario_llegada = hacer_fechahora_100(anio, mes, dia, horario_llegada),
    salida_programada = hacer_fechahora_100(anio, mes, dia, salida_programada),
    llegada_programada = hacer_fechahora_100(anio, mes, dia, llegada_programada)
  ) %>%
  select(origen, destino, starts_with("atraso"), starts_with("horario"), ends_with("horario"), ends_with("programada"), tiempo_vuelo)

vuelos_dt %>%
  mutate(dia_semana = wday(horario_salida, label = TRUE)) %>%
  ggplot(aes(x = dia_semana)) + 
  geom_bar()


# redondeo con floor_date
vuelos_dt %>%
  count(semana = floor_date(horario_salida, "week")) %>%
  ggplot(aes(semana, n)) + 
  geom_line()

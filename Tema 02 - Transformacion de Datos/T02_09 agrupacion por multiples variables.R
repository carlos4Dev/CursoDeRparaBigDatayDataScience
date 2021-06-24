# agrupación por múltiples variables

library(tidyverse)
library(datos)

diario <- group_by(vuelos, anio, mes, dia)

(por_dia <- summarise(diario, vuelos = n()))

(por_mes <- summarise(por_dia, vuelos = sum(vuelos)))

(por_anio <- summarise(por_mes, vuelos = sum(vuelos)))

# desagrupando

diario %>%
  ungroup() %>%
  summarise(vuelos = n())
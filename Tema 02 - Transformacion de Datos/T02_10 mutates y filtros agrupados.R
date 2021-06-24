library(tidyverse)
library(datos)

# Mutates y filters agrupados

vuelos_sml <- select(vuelos,
                     anio:dia,
                     starts_with("atraso"),
                     distancia,
                     tiempo_vuelo
                     )

vuelos_sml %>%
  group_by(anio, mes, dia) %>%
  filter(rank(desc(atraso_llegada)) < 10)

popular_destinos <- vuelos %>%
  group_by(destino) %>%
  filter(n() > 365)

popular_destinos

popular_destinos <- vuelos
popular_destinos %>%
  filter(atraso_llegada > 0) %>%
  mutate(prop_atraso = atraso_llegada / sum(atraso_llegada)) %>%
  select(anio:dia, destino, atraso_llegada, prop_atraso)


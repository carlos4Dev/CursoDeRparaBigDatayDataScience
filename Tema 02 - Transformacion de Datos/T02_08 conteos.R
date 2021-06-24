# Valores faltantes pdf, el video no corresponde
library(tidyverse)
library(datos)

# aquí se obtienen muchos valores faltantes

vuelos %>%
  group_by(anio, mes, dia) %>%
  summarise(mean = mean(atraso_salida))

# na.rm elimina los valores faltantes antes del cálculo

vuelos %>%
  group_by(anio, mes, dia) %>%
  summarise(mean = mean(atraso_salida, na.rm = TRUE))

# almacenamos en la variable no_cancelados, todos los vuelos cancelados

no_cancelados <- vuelos %>%
  filter(!is.na(atraso_salida), !is.na(atraso_llegada))

no_cancelados %>%
  group_by(anio, mes, dia) %>%
  summarise(mean = mean(atraso_salida))

# n()

atrasos <- no_cancelados %>%
  group_by(codigo_cola) %>%
  summarise(
    atraso = mean(atraso_llegada, na.rm = TRUE),
    n = n()
  )

ggplot(data = atrasos, mapping = aes(x = n, y = atraso)) + 
  geom_point(alpha = 1/10)

atrasos %>%
  filter(n>25) %>%
  ggplot(mapping = aes(x = n, y = atraso)) + 
  geom_point(alpha = 1/10)


# utilizamos el dataset bateadores con datos de beisbolistas de las grandes ligas

bateo <- as_tibble(datos::bateadores)

rendimiento <- bateo %>%
  group_by(id_jugador) %>%
  summarise(
    pb = sum(golpes, na.rm = TRUE) / sum(al_bate, na.rm = TRUE),
    ab = sum(al_bate, na.rm = TRUE)
  )

rendimiento %>%
  ggplot(mapping = aes(x = ab, y = pb)) +
  geom_point() +
  geom_smooth(se = FALSE)

rendimiento %>%
  filter(ab > 100) %>%
  ggplot(mapping = aes(x = ab, y = pb)) +
  geom_point() +
  geom_smooth(se = FALSE)

rendimiento %>%
  arrange(desc(pb))

## Funciones útiles de summarise

no_cancelados %>%
  group_by(anio, mes, dia) %>%
  summarise(
    prom_atraso1 = mean(atraso_llegada),
    prom_atraso2 = mean(atraso_llegada[atraso_llegada > 0])
    #el promedio de atrasos positivos
  )

# ¿Por qué la distancia de algunos destinos es más variable que la de otros?

no_cancelados %>%
  group_by(destino) %>%
  summarise(distancia_sd = sd(distancia)) %>%
    arrange(desc(distancia_sd)
  )

# ¿cuándo salen los primeros y los últimos vuelos cada día?

no_cancelados %>%
  group_by(anio, mes, dia) %>%
  summarise(
    primero = min(horario_salida),
    ultimo = max(horario_salida)
  )

no_cancelados %>%
  group_by(anio, mes, dia) %>%
  summarise(
    primera_salida = first(horario_salida),
    ultima_salida = last(horario_salida)
  )

no_cancelados %>%
  group_by(anio, mes, dia) %>%
  mutate(r = min_rank(desc(horario_salida))) %>%
  filter(r %in% range (r))

# ¿Qué destinos tienen la mayoría de las aerolíneas?
no_cancelados %>%
  group_by(destino) %>%
  summarise(aerolineas = n_distinct(aerolinea)) %>%
  arrange(desc(aerolineas))


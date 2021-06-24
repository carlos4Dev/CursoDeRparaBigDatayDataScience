# función arrange()

library(tidyverse)
library(datos)

vuelos

ejemplo1 <- arrange(vuelos, anio, mes, dia)

ejemplo1

ejemplo2 <- arrange(vuelos, horario_salida, salida_programada)

ejemplo2

arrange(vuelos, desc(atraso_salida))

arrange(vuelos, desc(salida_programada))

dat <- tibble(x = c(5, 2, NA))

arrange(dat, x)

arrange(dat, desc(x))

## Ejercicios de arrange()

# 1) Uso de arrange() para ordenar valores faltantes

arrange(vuelos, atraso_salida) %>%
  tail() # tail nos muestra la parte trasera de los datos ordenados, los últimos valores

arrange(vuelos, desc(is.na(atraso_salida)), atraso_salida)
  # de esta forma mostramos primero los valores faltantes

# 2) Uso de arrange() para encontrar los vuelos más retrasados.
  # Encuentra los vuelos que salideron más temprano.

arrange(vuelos, desc(atraso_salida))

# 3) Ordenar los vuelos que fueron a mayor velocidad
library(nycflights13)

# 4) Ordenar los vuelos por mayor distancia

x1 <- arrange(flights, desc(distance))

# 5) Ordenar los vuelos por el de menor distancia
x2 <- arrange(flights, distance)
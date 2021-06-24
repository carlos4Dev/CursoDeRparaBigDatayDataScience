library(tidyverse)
library(nycflights13)

# Ejercicios

# 1 Tuvieron un reteraso de llegada de dos o más horas

atraso <- filter(flights, arr_delay >= 120)

atraso # Muestra por consola un tribble con los valores filtrados

# 2 Volaron a Houston (IAH o HOU)

houston <- filter(flights, dest == "IAH" | dest == "HOU")

houston

# 3 Fueron operados por United, American o Delta

airlines # muesrra un trible con los datos de las compañías
# Se muestran el código  y el nombre de las compañías

filter(flights, carrier %in% c("UA", "AA", "DL"))



# 4 Partieron en verano (julio, agosto y septiembre)

verano <- filter(flights, month >= 7, month <= 9)

show(verano)

# 5 Llegaron más de dos horas tarde, pero no salieron tarde

filter(flights, arr_delay >= 120, dep_delay <= 0)

# 6 Se retrasaron en la salida por lo menos una hora, pero repusieron más de 30 minutos en vuelo

filter(flights, dep_delay >= 60, (dep_delay - arr_delay > 30))

# 7 Partieron entre la medianoche y las 6 a.m. (incluyente)

summary(flights$dep_time) # mostramos un resumen de las horas de salida

filter(flights, dep_time <= 600 | dep_time == 2400)
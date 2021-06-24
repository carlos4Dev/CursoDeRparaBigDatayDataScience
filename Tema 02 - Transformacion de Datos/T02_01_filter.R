# Tema 2 - Transformación de datos

# Vamos a trabajar con un dataset de vuelos de aviones en USA año 2013
# En la consola:
# install.packages("nycflights13")

library(tidyverse)
library(nycflights13)

# Mostramos por consola los vuelos
nycflights13::flights

# Mostramos en un formato de tabla (aquí se mostrarían todos los datos del dataset)
view(nycflights13::flights)

# Para mostrar la ayuda de flights
?flights

# Tipos de datos en R

# int >>> números enteros
# dbl >>> double, de coma flotante, números reales
# chr >>> vector de carácteres o String
# dtte >>> Date + Time
# lgl >>> Logical son tipos de datos booleanos
# fctr >>> Factor, variable categórica
# date >>> Fecha (año, mes, dia)

# Funciones:

# filter()   >>> filtrar según los parámetros especificados
# arrange()  >>> reordena las filas de un dataset
# select()   >>> selección de columunas especificadas dentro de un dataset
# mutate()   >>> crear nuevas variables a partir de otras ya existentes
# sumarise() >>> contrae muchos valores en un solo resumen

## filter()

jan1 <- filter(flights, month == 1, day == 1)

may25 <- filter(flights, month == 5, day == 25)

dec24 <- filter(flights, month == 12, day == 24)

(march5 <- filter(flights, month == 3, day == 5))

jun <- filter(flights, month == 6)

# operadores lógicos >>>       >, >=, <, <=, ==, !=

near(sqrt(2) ^2 ,2)

(1/49) * 49 == 1

near((1/49) * 49, 1)

# operadores booleanos

oct_nov <- filter(flights, month == 10 | month == 11) # operador or >>>   |

oct_nov <- filter(flights, month == 10 | 11) # código incorrecto, no devuelve resultado esperado

oct_nov <- filter(flights, month %in% c(10,11)) # equivale al operador or

sept_dec <- filter(flights, month >= 9, month <= 12) # filtrando vuelos entre setiembre y diciembre

arrD <- filter(flights, arr_delay >= 60) # filtrando regraso de llegada mayor a 1 hora

airtime <- filter(flights, air_time == 60)

# Valores faltantes NA (Not Avalaible)

NA < 5 # Devuelve por consola [1] NA

NA >= 10 # Devuelve [1] NA

NA + 10 # Devuelve [1] NA

NA != 10 # Devuelve [1] NA

NA == NA # Suponemos que será verdadero, pero devuelve [1] NA

is.na(NA==NA) # Devuelve [1] TRUE

view(nycflights13::planes) # En este caso la variable spedd devuelve en todas las filas NA

filter(planes, speed != NA) # Devuelve un tibble de 0 x 9 porque no hay datos de speed

filter(planes, is.na(speed != NA)) # Devuelve un trible de 3322 x 9

speed <- filter(planes, is.na(speed) | speed > 90)
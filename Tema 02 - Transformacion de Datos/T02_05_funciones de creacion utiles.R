# Funciones de creación útiles

library(tidyverse)
library(datos)

# transmute()

transmute(vuelos,
            horario_salida,
            hora = horario_salida %/% 100,   # el signo de división entre % %
            minuto = horario_salida %% 100)  # el signo % resto se omite entre %%

(x <- 1:10) # x tiene los valores del 1 al 10

lag(x) # el primer valor será NA y tiene los valores del 1 al 9

lead(x)# se pierde el primer valor, el último valor será Na y los valores del 2 al 10

# cumsum() sumatoria cumatoria acumulativa

x # muestra los valores del 1 al 10

cumsum(x) # muestra los valores siendo cada uno, la suma de él mismo más el anterior

cummean(x) # cummean() media acumulativa

cummax(x) # máximo acumulativo, en este caso al estar ordenados, el máximo es el mismo

cummin(x) # mínimo acumulativo, en este caso todos 1 

# ranking

y <- c(1, 2, 2, NA, 3, 4)

min_rank(y) # [1]  1  2  2 NA  4  5

min_rank(desc(y)) # [1]  5  3  3 NA  2  1

row_number(y) # muestra las seis posiciones, NA está en la cuarta posición
              # [1]  1  2  3 NA  4  5

dense_rank(y) # [1]  1  2  2 NA  3  4



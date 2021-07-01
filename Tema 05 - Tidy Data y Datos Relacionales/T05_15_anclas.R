# Anclas
library(htmlwidgets)
library(tidyverse)

x <- c("arándano", "banana", "pera")
x
#[1] "arándano" "banana"   "pera"  

# con $ encuentra la coincidencia al final de la cadena
str_view(x, "a$")

# con ^ encuentra la coincidencia al final de la cadena
str_view(x, "^a")


y <- c("pie de manzana", "manzana", "queque de manzana")
str_view(y, "manzana")
str_view(y, "^manzana$") # que empieza y termina por manzana, sólo devuelve manzana


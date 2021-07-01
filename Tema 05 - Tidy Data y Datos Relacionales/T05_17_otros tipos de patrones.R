# Otros tipos de patrones

library(tidyverse)

frutas <- c("banana", "papaya", "uva", "arándano", "frutilla", "mora", 
            "plátano", "ananá", "piña", "manzana", "pera", "sandía",
            "melocotón", "melón")

str_view(frutas, "nana")

str_view(frutas, regex("nana")) # se obtiene lo mismo

bananas <- c("banana", "Banana", "BANANA")

str_view(bananas, "banana") # en este caso sólo coincide la primera, tiene que ser exacto

str_view(bananas, regex("banana", ignore_case = TRUE)) # aquí muestra las 3 seleccionadas



x <- "Linea 1\nLinea 2\nLinea3"

str_extract_all(x, "^Linea")[[1]]
# [1] "Linea"

str_extract_all(x, regex("^Linea", multiline = TRUE))[[1]]
# [1] "Linea" "Linea" "Linea"


telefono <- regex("
    \\(?      # paréntesis inicial opcional
    (\\d{3})  # código de área
    [) -]?    # paréntesis, espacio o guión al final
    (\\d{3})  # otros tres números
    [ -]?     # espacio o guión opcional
    (\\d{3})  # otros tres números
    ", comments = TRUE)


str_match("514-791-8141", telefono)
# [,1]          [,2]  [,3]  [,4] 
# [1,] "514-791-814" "514" "791" "814"


# Ejemplos de lectura de archivos csv

library(tidyverse)

# Con read.csv se carga el archivo que se encuentra el ruta que pasamos como parámetro
# genera un data frame

ejemplo <- read.csv("C:/Users/carlo/OneDrive/Documentos/01 Dev/04_Curso R para Big Data y Data Science INTECSSA/Datos/Data.csv")

# con read_csv, se crea un tibble mostrando en consola el nombre de las columnas y el tipo de dato

ejemplo <- read_csv("C:/Users/carlo/OneDrive/Documentos/01 Dev/04_Curso R para Big Data y Data Science INTECSSA/Datos/Data.csv")

# mostramos por consola el tibble que hemos creado a partir del archivo

ejemplo

# Crear archivo csv

# este ejemplo crea un tibble de 2 filas por 3 columnas
# los nombre de las columnas serían a, b, y c
# y las dos filas serían los número de tipo double

read_csv("a,b,c
         1,2,3
         4,5,6")

# Con skip = n se pueden obviar n línas de metadatos al principio del archivo csv
# con comment = n se pueden obviar los comentarios del archivo
# En el siguiente ejemplo se omite las dos primeras líneas. x, y, z son nombres de columnas
# En este caso el tibble que conseguimos es de una fila por 3 columnas (x y z)

read_csv("La primera línea de metadata
         La segunda línea de metadata
         x,y,z
         1,2,3", skip = 2)

# Obviando el nombre de las columnas
# en este ejemplo \n es un salto de línea
# al indicar que col_names es false, genera 3 columnas como X1, X2, X3
# y un tribe de dos filas por 3 columnas

read_csv("1,2,3\n4, 5, 6", col_names = TRUE)

# si no hubisemos puesta nada, por defecto el valor sería true
# y el tibble sería de una fila por 3 columnas como `1` `2` `3`

read_csv("1,2,3\n4, 5, 6")

# con col_names, podemos indicar en un vector de caracteres c(" ", " ")
# los valores que queremos que tengan las columnas

read_csv("1,2,3\n4, 5, 6", col_names = c("pepe", "juan", "pipo"))

# tratando los NA
# en este ejemplo indicamos que trata el punto como una valor NA

read_csv("a, b, c \n1, 2,.", na = ".")

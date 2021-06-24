# Función select()

library (tidyverse)

# head() muestra sólo 6 filas del dataset resultante

head(select(mtcars, 1, 4)) # Muestra del dataset mtcars, las columunas 1 y 4

head(select(mtcars, mpg, disp))

?select

# con el signo "-" podemos dejar de mostrar las columnas que indiquemos

head(select(mtcars, -c(mpg, disp))) # muestra todas menos mpg y disp

# con el signo ":" podemos seleccionar un rango de columnas

head(select(mtcars, 2:5)) # muestra desde la columna 2 hasta la columna 5

# starts_with selecciona todas las columnas que empiezan con el patrón indicado

head(select(iris, starts_with("Petal")))

# ends_with selecciona todas las columnas que terminan con el patrón indicado

head(select(iris, ends_with("Length")))

# contains selecciona las columnas que contengan un patrón indicado

head(select(mtcars, contains("cy")))

# matches selecciona las columnas que contenga una expresión regular

head(select(mtcars, matches("t")))

# everything selecciona todas las columnas

head(select(iris, Species, everything()))

# one_of selecciona las variables pasadas de un vector

vars <- c("Petal.Length", "Petal.Width")
head(select(iris, one_of(vars)))

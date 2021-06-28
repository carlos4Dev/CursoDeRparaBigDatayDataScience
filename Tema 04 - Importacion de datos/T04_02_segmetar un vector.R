# Segmentar un vector

library(tidyverse)

# Convierte un vector de string a booleano

str(parse_logical(c("TRUE", "FALSE", NA)))

# Convierte un vector de string a integer

str(parse_integer(c("4", "5", "6")))

# Aquí la segmentación  devuelve extraño, pero ya lo entendí

parse_integer(c("1", "345", ".", "345"), na = "345")
# devuelve [1] 1, NA, NA, NA
# attr(, "problems")
# A tibble de 1 x 4
# <int>     <int> <chr>     <chr>
#   3      NA an intenger       .
# Quiere decir que en la posición 3 hay un NA an integer, el punto (.)
# que no se puede pasar a integer


# Aquí da advertencia de error al intentar convertir a int, un double y un str

x <- parse_integer(c("123", "345", "abc", "123.345"))

# Nos muestra el tibble con los problems que tiene la variable x
problems(x)


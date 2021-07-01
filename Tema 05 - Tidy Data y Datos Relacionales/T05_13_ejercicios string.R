# Ejercicios con string

library(tidyverse)
library(datos)

string1 <- "Esta es una cadena de caracteres"

string1
#[1] "Esta es una cadena de caracteres"

# A propósito dejamos sin poner la comilla de cierre
# nos aparecerá un signo + en la consola
string2 <- "HOLA MUNDO"

x <- c("\"", "\\")
writeLines(x)
# "
# \

str_length(c("a", "Ejercicio práctico"))
# [1] 1 18

str_c("x", "y", "z")
# [1] "xyz"

str_c("x", "y", "z", sep = "/")
# [1] "x/y/z"


x <- c("abc", NA)
str_c("|-", x, "-|")
# [1] "|-abc-|" NA

str_c("|-", str_replace_na(x), "-|")
# [1] "|-abc-|" "|-NA-|" 


str_c("prefijo-", c("a", "b", "c"), "-sujijo")
# [1] "prefijo-a-sujijo" "prefijo-b-sujijo" "prefijo-c-sujijo"


nombre <- "Hadley"
hora_del_dia <- "mañana"
cumpleanios <- FALSE

str_c(
  "Que tengas una buena ", hora_del_dia, ", ", nombre,
  if(cumpleanios) " y ¡FELIZ CUMPLEAÑOS!",
  "."
)
# [1] "Que tengas una buena mañana, Hadley."


str_c(c("x", "y", "z"), collapse = ", ")
# [1] "x, y, z"

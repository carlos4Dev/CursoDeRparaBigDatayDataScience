# Repeticiones y referencias previas

# cuántas veces queremos que se encuentre un patrón
# símbolo ? 0 o 1 vez, símbolo + equivale 1 o más veces
# símbolo * 0 o más veces

r <- "1888 es el año más largo en número romanos: MDCCCLXXXVIII"

str_view(r, "CC?")

str_view(r, "CC+")

str_view(r, "C[LX]+")

str_view(r, "C{2}") # queremos saber si C se repite en dos ocasiones

str_view(r, "C{2,}") # queremos saber si C se repite en dos ocasiones o más ocasiones


str_view(r, "C{4,6}") # si se repite entre 4 y 6 veces, en este caso no encuentra, está fuera de rango

t <- c("arándano", "espinaca", "banana")

str_view(t, "(..)\\1", match = TRUE) # devuelve banana, remarcado anan

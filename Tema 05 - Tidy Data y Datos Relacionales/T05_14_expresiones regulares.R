x <- c("manzana", "banana", "pera")

x
# [1] "manzana" "banana"  "pera" 

# para utilzar str_view he tenido que instalar el package "htmlwidgets"
str_view(x, "an")
# se muestra en la pestaña Viewer
# se muestra una lista con los tres elementos y en las palabras manzana y banana
# se muestran con un marco de color diferente las coincidencias con "an"


str_view(x, ".a.")
# muestra las coincidencias de que tenga un primer cualquier caracter
# el segundo carácter sea "a"
# el resto de caracteres sea cualquiera


# la primera barra invertida hace de modo de escape para caracteres especiales
punto <- "\\."

writeLines(punto)
# \.

# aquí es necesario dos barras invertidas para que reconozca el punto como carácter especial
str_view(c("abc", "a.c", "bef"), "a\\.c")

x <- "a\\b"


writeLines(x)
# a\b

# para encontrar una barra invertida habrá que utilizar 4 barras invertidas
str_view(x, "\\\\")
# muestra en el viewer la coincidencia en a\b
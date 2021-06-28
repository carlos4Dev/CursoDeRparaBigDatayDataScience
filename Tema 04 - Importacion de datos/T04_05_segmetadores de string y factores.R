# Segmentar string y factores

library(tidyverse)

# Esto pasa la cadena código ASCII

charToRaw("Hola")
# devuelve [1] 48 6f 6c 61

z1 <- "El niño was particularly bad this year"

# Si no está codificado en UTF-8, para que guarde el valor ñ, \xf1
x1 <- "el ni\xf1o was particularly bad this year"
# [1] "el niño was particularly bad this year"

# Para pasar a caracteres latinos

parse_character(x1, locale = locale(encoding = "Latin1"))
# [1] "el niño was particularly bad this year"

# para saber el tipo de codificación

guess_encoding(charToRaw(x1))

# A tibble: 2 x 2
# encoding   confidence
# <chr>           <dbl>
# 1 ISO-8859-1       0.46
# 2 ISO-8859-9       0.23

paises <- c("Argentina", "Brasil", "Chile")


# Al pasar un factor si un elemento no está en el vector, da una advertencia

parse_factor(c("Argentina", "Brasil", "Pera"), levels = paises)

# Warning: 1 parsing failure.
# row col           expected actual
# 3  -- value in level set   Pera
# 
# [1] Argentina Brasil    <NA>     
#   attr(,"problems")
# # A tibble: 1 x 4
# row   col expected           actual
# <int> <int> <chr>              <chr> 
#   1     3    NA value in level set Pera  
# Levels: Argentina Brasil Chile


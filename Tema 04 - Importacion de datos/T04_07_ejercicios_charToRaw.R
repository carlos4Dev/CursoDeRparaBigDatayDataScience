library(tidyverse)

# Ejemplo 1

x <- charToRaw("a")
x
# [1] 61

y <- charToRaw("b")
y
# [1] 62

z <- charToRaw(" ")
z
# [1] 20


# Ejemplo 2

a <- charToRaw("Curso de R")
a
# [1] 43 75 72 73 6f 20 64 65 20 52

b <- charToRaw("para inteligencia artificial")
b
# [1] 70 61 72 61 20 69 6e 74 65 6c 69 67 65 6e 63 69 61 20 61 72 74 69 66 69 63 69
# [27] 61 6c
# Otros tipos de patrones, segunda parte

library(tidyverse)
library(datos)

# hay que instalar el package microbenchmark

microbenchmark::microbenchmark(
  fixed = str_detect(oraciones, fixed("la")),
  regex = str_detect(oraciones, "la"),
  times = 20
)
# Unit: microseconds
# expr  min    lq  mean median   uq   max neval
# fixed 30.5 32.05 40.06  33.05 42.1 106.4    20
# regex 38.8 39.80 49.15  41.20 43.7 163.1    20


a1 <- "\u00e1"
a2 <- "a\u0301"
c(a1, a2)
# [1] "á" "á"    se muestra igual, pero no son iguales
a1 == a2
# [1] FALSE

str_detect(a1, fixed(a2))
# [1] FALSE

str_detect(a1, coll(a2))
# [1] TRUE


i <- c("I", "Í", "i", "ı")

str_subset(i, coll("i", ignore_case = TRUE))
# [1] "I" "i" "i"

str_subset(i, coll("i", ignore_case = TRUE, locale = "tr"))
# [1] "i" "i"

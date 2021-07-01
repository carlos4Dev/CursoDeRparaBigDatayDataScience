# Subsetting string y locale

library(tidyverse)
library(datos)

x <- c("Manzana", "Plátano", "Pera")

str_sub(x, 4, 6)
# [1] "Man" "Plá" "Per"

str_sub(x, -3, -1)
# [1] "ana" "ano" "era"

str_sub("a", 1, 5)
# [1] "a"

str_sub(x, 1, 1) <- str_to_lower(str_sub(x, 1, 1))

x
# [1] "manzana" "plátano" "pera" 


# locale (i sin punto (i turca) se saca con alt + 213)
# código de los locale, ISO 639

str_to_upper(c("i", "ı"))
# [1] "I" "I"

str_to_upper(c("i", "ı"), locale = "tr")
# [1] "İ" "İ"

y <- c("arándano", "espinaca", "banana")

str_sort(y, locale = "es")
# [1] "arándano" "banana"   "espinaca"

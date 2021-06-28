library(tidyverse)

# Al guardar en csv se pierde el tipo de la columnas
write_csv(desafio, "desafio.csv")

desafio

write_csv(desafio2, "desafio.csv")

desafio2

# El formato rds permite listas en las columnas
write_rds(desafio, "desafio.rds")
read_rds("desafio.rds")

library(feather)

write_feather(desafio, "desafio.feather")
read_feather("desafio.feather")

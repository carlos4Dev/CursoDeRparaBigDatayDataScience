# Función summarise() 
# resume el dataset en una fila, no es muy útil por si mismo
# si es útil al utilizarlo junto group_by

library(tidyverse)

por_cil <- group_by(mtcars, cyl)
summarise(por_cil, mean(mpg), mean(hp))

por_cil2 <- group_by(mtcars, cyl)
summarise(por_cil2, sum(mpg), sum(hp))

por_cil3 <- group_by(mtcars, cyl)
summarise(por_cil3, sd(mpg), sd(hp))


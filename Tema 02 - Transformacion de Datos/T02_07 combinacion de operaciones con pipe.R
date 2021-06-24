# Combinación de operaciones con pipe

library(tidyverse)

mtcars_aux <- select(mtcars, mpg, hp, cyl, wt)

mtcars_aux <- filter(mtcars_aux, cyl != 4 & wt > 3000)

mtcars_aux <- group_by(mtcars_aux, cyl)

mtcars_aux <- summarise(mtcars_aux, mean(hp), mean(mpg))

# Las anteriores 4 lineas no mostrarían bien los datos

# Utilizando %>% pipe estaría bien

mtcars %>%
  select(mpg, hp, cyl, wt) %>%
  filter(cyl != 4 & wt > 3.000) %>%
  group_by(cyl) %>%
  summarise(mean(hp), mean(mpg))

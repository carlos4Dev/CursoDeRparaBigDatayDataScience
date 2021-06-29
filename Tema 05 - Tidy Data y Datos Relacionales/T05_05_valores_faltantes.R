# Valores faltantes

library(tidyverse)

# En el siguiente ejemplo hay dos valores faltantes, 
# ímplicito el cuarto trimestre de 2015 con NA,
# no implicito el primer trimestre de 2016 que no hay datos de él

stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)

stocks %>%
  spread(year, return) # Muestra en columnas los años, y return en las filas
# A tibble: 4 x 3
#      qtr `2015` `2016`
#     <dbl>  <dbl>  <dbl>
# 1     1   1.88  NA   
# 2     2   0.59   0.92
# 3     3   0.35   0.17
# 4     4  NA      2.66

# Podemos eliminar los faltantes con values_drop_na = TRUE
stocks %>%
  pivot_wider(names_from = year, values_from = return) %>%
  pivot_longer(
    cols = c(`2015`, `2016`),
    names_to = "year",
    values_to = "return",
    values_drop_na = TRUE
  )

# A tibble: 6 x 3
#      qtr year  return
#     <dbl> <chr>  <dbl>
# 1     1 2015    1.88
# 2     2 2015    0.59
# 3     2 2016    0.92
# 4     3 2015    0.35
# 5     3 2016    0.17
# 6     4 2016    2.66

# función complete
# toma un conjunto de columnas y encuentra las conbinaciones únicas

stocks %>%
  complete(year, qtr)
# A tibble: 8 x 3
#    year   qtr return
#    <dbl> <dbl>  <dbl>
# 1  2015     1   1.88
# 2  2015     2   0.59
# 3  2015     3   0.35
# 4  2015     4  NA   
# 5  2016     1  NA   
# 6  2016     2   0.92
# 7  2016     3   0.17
# 8  2016     4   2.66


treatment <- tribble(
  ~person,             ~treatment, ~response,
  "Derrick Whitmore",   1,          7,
  NA,                   2,         10,
  NA,                   3,          9,
  "Katherine Burke",    1,          4
)

# La función fill() rellena los NA con el valor más cercano que se haya reportado
treatment %>%
  fill(person)
# A tibble: 4 x 3
#     person           treatment response
#    <chr>                <dbl>    <dbl>
# 1 Derrick Whitmore         1        7
# 2 Derrick Whitmore         2       10
# 3 Derrick Whitmore         3        9
# 4 Katherine Burke          1        4
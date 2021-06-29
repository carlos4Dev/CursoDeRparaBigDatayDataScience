# Pivot longer

library(tidyverse)
library(datos)

# Aquí los años están como nombre de columna
table4a
# A tibble: 3 x 3
# country       `1999` `2000`
#    <chr>       <int>  <int>
# 1 Afganistán    745   2666
# 2 Brasil      37737  80488
# 3 China      212258 213766


# Aqui transformamos los nombres de las columnas a year
# y los valores de los casos a cases
table4a %>%
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")
# A tibble: 6 x 3
#   country     year   cases
#   <chr>       <chr>  <int>
# 1 Afghanistan 1999     745
# 2 Afghanistan 2000    2666
# 3 Brazil      1999   37737
# 4 Brazil      2000   80488
# 5 China       1999  212258
# 6 China       2000  213766

# Ordenamos los datos
table4b %>%
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")
# A tibble: 6 x 3
#    country     year  population
#  <chr>       <chr>      <int>
# 1 Afghanistan 1999    19987071
# 2 Afghanistan 2000    20595360
# 3 Brazil      1999   172006362
# 4 Brazil      2000   174504898
# 5 China       1999  1272915272
# 6 China       2000  1280428583


# leftjoin

tidy4a <- table4a %>%
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")

tidy4b <- table4a %>%
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")


# Unimoa los dos
left_join(tidy4a, tidy4b)
# Joining, by = c("country", "year")
# # A tibble: 6 x 4
#   country     year   cases population
#   <chr>       <chr>  <int>      <int>
# 1 Afghanistan 1999     745        745
# 2 Afghanistan 2000    2666       2666
# 3 Brazil      1999   37737      37737
# 4 Brazil      2000   80488      80488
# 5 China       1999  212258     212258
# 6 China       2000  213766     213766
# Operador Pipe

library(tidyverse)
library(lubridate)
library(datos)

install.packages("devtools")

devtools::install_github("rstudio/EDAWR")


storms %>% select(name, pressure)
# A tibble: 10,010 x 2
#   name  pressure
#   <chr>    <int>
# 1 Amy       1013
# 2 Amy       1013
# 3 Amy       1013
# 4 Amy       1013
# 5 Amy       1012
# 6 Amy       1012
# 7 Amy       1011
# 8 Amy       1006
# 9 Amy       1004
# 10 Amy       1002
# # ... with 10,000 more rows

storms %>% filter(wind >= 50)
# A tibble: 4,861 x 13
#   name   year month   day  hour   lat  long status     category  wind pressure
#   <chr> <dbl> <dbl> <int> <dbl> <dbl> <dbl> <chr>      <ord>    <int>    <int>
# 1 Amy    1975     6    29    18  33.8 -72.8 tropical ~ 0           50      998
# 2 Amy    1975     6    30     0  34.3 -71.6 tropical ~ 0           50      998
# 3 Amy    1975     6    30     6  35.6 -70.8 tropical ~ 0           55      998
# 4 Amy    1975     6    30    12  35.9 -70.5 tropical ~ 0           60      987
# 5 Amy    1975     6    30    18  36.2 -70.2 tropical ~ 0           60      987
# 6 Amy    1975     7     1     0  36.2 -69.8 tropical ~ 0           60      984
# 7 Amy    1975     7     1     6  36.2 -69.4 tropical ~ 0           60      984
# 8 Amy    1975     7     1    12  36.2 -68.3 tropical ~ 0           60      984
# 9 Amy    1975     7     1    18  36.7 -67.2 tropical ~ 0           60      984
# 10 Amy    1975     7     2     0  37.4 -66.7 tropical ~ 0           60      984
# # ... with 4,851 more rows, and 2 more variables: ts_diameter <dbl>,
# #   hu_diameter <dbl>

storms %>%
  filter(wind >= 50) %>%
  select(name, pressure)

# Atajo de teclado para pipe Ctrl + Mayus + M    %>%


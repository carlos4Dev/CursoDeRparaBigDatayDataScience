# pivot_wider se utiliza cuando una observación aparece en múltiples filas
# pivot_longer y pivot_wider son complementarias
# pivot_longer genera tablas angostas y largas
# pivot_wider genera tablas anchas y cortas


library(tidyverse)
library(datos)

tabla2
# A tibble: 12 x 4
#    pais        anio tipo          cuenta
#    <chr>       <int> <chr>          <int>
# 1 Afganistán   1999 casos            745
# 2 Afganistán   1999 población   19987071
# 3 Afganistán   2000 casos           2666
# 4 Afganistán   2000 población   20595360
# 5 Brasil       1999 casos          37737
# 6 Brasil       1999 población  172006362
# 7 Brasil       2000 casos          80488
# 8 Brasil       2000 población  174504898
# 9 China        1999 casos         212258
# 10 China       1999 población 1272915272
# 11 China       2000 casos         213766
# 12 China       2000 población 1280428583

tabla2 %>%
  pivot_wider(names_from = tipo, values_from = cuenta)

# A tibble: 6 x 4
#    pais        anio  casos  población
#    <chr>      <int>  <int>      <int>
# 1 Afganistán  1999    745   19987071
# 2 Afganistán  2000   2666   20595360
# 3 Brasil      1999  37737  172006362
# 4 Brasil      2000  80488  174504898
# 5 China       1999 212258 1272915272
# 6 China       2000 213766 1280428583

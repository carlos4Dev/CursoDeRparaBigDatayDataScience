library(tidyverse)
library(datos)

tabla1
# A tibble: 6 x 4
#   pais        anio  casos  poblacion
#   <chr>      <int>  <int>      <int>
# 1 Afganistán  1999    745   19987071
# 2 Afganistán  2000   2666   20595360
# 3 Brasil      1999  37737  172006362
# 4 Brasil      2000  80488  174504898
# 5 China       1999 212258 1272915272
# 6 China       2000 213766 1280428583

tabla1 %>%
  mutate(tasa = casos / poblacion * 10000)

# A tibble: 6 x 5
#   pais        anio  casos  poblacion  tasa
#    <chr>      <int>  <int>      <int> <dbl>
# 1 Afganistán  1999    745   19987071 0.373
# 2 Afganistán  2000   2666   20595360 1.29 
# 3 Brasil      1999  37737  172006362 2.19 
# 4 Brasil      2000  80488  174504898 4.61 
# 5 China       1999 212258 1272915272 1.67 
# 6 China       2000 213766 1280428583 1.67 

tabla1 %>%
  count(anio, wt = casos)

# A tibble: 2 x 2
#    anio      n
#    <int>  <int>
# 1  1999 250740
# 2  2000 296920

ggplot(tabla1, aes(anio, casos)) +
  geom_line(aes(group = pais), colour = "grey50") +
  geom_point(aes(colour = pais))

tabla2
# A tibble: 12 x 4
#    pais        anio tipo          cuenta
#    <chr>      <int> <chr>          <int>
# 1 Afganistán  1999 casos            745
# 2 Afganistán  1999 población   19987071
# 3 Afganistán  2000 casos           2666
# 4 Afganistán  2000 población   20595360
# 5 Brasil      1999 casos          37737
# 6 Brasil      1999 población  172006362
# 7 Brasil      2000 casos          80488
# 8 Brasil      2000 población  174504898
# 9 China       1999 casos         212258
# 10 China       1999 población 1272915272
# 11 China       2000 casos         213766
# 12 China       2000 población 1280428583

tabla3
# A tibble: 6 x 3
#    pais        anio tasa             
#    <chr>      <int> <chr>            
# 1 Afganistán  1999 745/19987071     
# 2 Afganistán  2000 2666/20595360    
# 3 Brasil      1999 37737/172006362  
# 4 Brasil      2000 80488/174504898  
# 5 China       1999 212258/1272915272
# 6 China       2000 213766/1280428583

tabla4a
# A tibble: 3 x 3
#    pais       `1999` `2000`
#    <chr>       <int>  <int>
# 1 Afganistán    745   2666
# 2 Brasil      37737  80488
# 3 China      212258 213766

tabla4b
# A tibble: 3 x 3
#    pais       `1999` `2000`
#    <chr>       <int>  <int>
# 1 Afganistán    745   2666
# 2 Brasil      37737  80488
# 3 China      212258 213766
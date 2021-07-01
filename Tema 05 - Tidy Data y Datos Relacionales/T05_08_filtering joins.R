library(tidyverse)
library(datos)

# contamos los 10 primeros destinos  populares de forma ordenada
destinos_populares <- vuelos %>%
  count(destino, sort = TRUE) %>%
  head(10)

destinos_populares
# A tibble: 10 x 2
#   destino     n
#   <chr>   <int>
# 1 ORD     17283
# 2 ATL     17215
# 3 LAX     16174
# 4 BOS     15508
# 5 MCO     14082
# 6 CLT     14064
# 7 SFO     13331
# 8 FLL     12055
# 9 MIA     11728
# 10 DCA      9705

vuelos %>%
  filter(destino %in% destinos_populares$destino)
# A tibble: 141,145 x 19
#    anio   mes   dia horario_salida salida_programada atraso_salida
#    <int> <int> <int>          <int>             <int>         <dbl>
# 1  2013     1     1            542               540             2
# 2  2013     1     1            554               600            -6
# 3  2013     1     1            554               558            -4
# 4  2013     1     1            555               600            -5
# 5  2013     1     1            557               600            -3
# 6  2013     1     1            558               600            -2
# 7  2013     1     1            558               600            -2
# 8  2013     1     1            558               600            -2
# 9  2013     1     1            559               559             0
# 10  2013     1     1            600               600             0
# # ... with 141,135 more rows, and 13 more variables: horario_llegada <int>,
# #   llegada_programada <int>, atraso_llegada <dbl>, aerolinea <chr>,
# #   vuelo <int>, codigo_cola <chr>, origen <chr>, destino <chr>,
# #   tiempo_vuelo <dbl>, distancia <dbl>, hora <dbl>, minuto <dbl>,
# #   fecha_hora <dttm>

vuelos %>%
  semi_join(destinos_populares)
# Joining, by = "destino"
# # A tibble: 141,145 x 19
#    anio   mes   dia horario_salida salida_programada atraso_salida
#    <int> <int> <int>          <int>             <int>         <dbl>
# 1  2013     1     1            542               540             2
# 2  2013     1     1            554               600            -6
# 3  2013     1     1            554               558            -4
# 4  2013     1     1            555               600            -5
# 5  2013     1     1            557               600            -3
# 6  2013     1     1            558               600            -2
# 7  2013     1     1            558               600            -2
# 8  2013     1     1            558               600            -2
# 9  2013     1     1            559               559             0
# 10  2013     1     1            600               600             0
# # ... with 141,135 more rows, and 13 more variables: horario_llegada <int>,
# #   llegada_programada <int>, atraso_llegada <dbl>, aerolinea <chr>,
# #   vuelo <int>, codigo_cola <chr>, origen <chr>, destino <chr>,
# #   tiempo_vuelo <dbl>, distancia <dbl>, hora <dbl>, minuto <dbl>,
# #   fecha_hora <dttm>

vuelos %>%
  anti_join(aviones, by = "codigo_cola") %>%
  count(codigo_cola, sort = TRUE)
# A tibble: 722 x 2
#   codigo_cola     n
#   <chr>       <int>
# 1 NA           2512
# 2 N725MQ        575
# 3 N722MQ        513
# 4 N723MQ        507
# 5 N713MQ        483
# 6 N735MQ        396
# 7 N0EGMQ        371
# 8 N534MQ        364
# 9 N542MQ        363
# 10 N531MQ        349
# # ... with 712 more rows



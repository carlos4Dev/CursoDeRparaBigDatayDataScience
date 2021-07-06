# Modificar los niveles de los factores

library(tidyverse)
library(datos)

encuesta %>% count(partido)
# A tibble: 10 x 2
#    partido                        n
#    <fct>                      <int>
# 1 Sin respuesta                154
# 2 No sabe                        1
# 3 Otro partido                 393
# 4 Fuertemente republicano     2314
# 5 No fuertemente republicano  3032
# 6 Ind, pro rep                1791
# 7 Independiente               4119
# 8 Ind, pro dem                2499
# 9 No fuertemente demócrata    3690
# 10 Fuertemente demócrata       3490

encuesta %>%
  mutate(partido = fct_recode(partido,
                              "Republicano duro" = "Fuertemente republicano",
                              "Republicano moderado" = "No fuertemente republicano",
                              "Independiente pro republicano" = "Ind, pro rep",
                              "Independiente pro demócrata" = "Ind, pro dem",
                              "Demócrata moderado" = "No fuertemente demócrata",
                              "Demócrata duro" = "Fuertemente demócrata"
  )) %>%
  count(partido)
# A tibble: 10 x 2
#   partido                           n
#    <fct>                         <int>
# 1 Sin respuesta                   154
# 2 No sabe                           1
# 3 Otro partido                    393
# 4 Republicano duro               2314
# 5 Republicano moderado           3032
# 6 Independiente pro republicano  1791
# 7 Independiente                  4119
# 8 Independiente pro demócrata    2499
# 9 Demócrata moderado             3690
# 10 Demócrata duro                 3490

encuesta %>%
  mutate(partido = fct_recode(partido,
                              "Republicano duro" = "Fuertemente republicano",
                              "Republicano moderado" = "No fuertemente republicano",
                              "Independiente pro republicano" = "Ind, pro rep",
                              "Independiente pro demócrata" = "Ind, pro dem",
                              "Demócrata moderado" = "No fuertemente demócrata",
                              "Demócrata duro" = "Fuertemente demócrata",
                              "Otro" = "Sin respuesta", 
                              "Otro" = "No sabe",
                              "Otro" = "Otro partido"
  )) %>%
  count(partido)
# # A tibble: 8 x 2
#   partido                           n
#   <fct>                         <int>
# 1 Otro                            548
# 2 Republicano duro               2314
# 3 Republicano moderado           3032
# 4 Independiente pro republicano  1791
# 5 Independiente                  4119
# 6 Independiente pro demócrata    2499
# 7 Demócrata moderado             3690
# 8 Demócrata duro                 3490


encuesta %>%
  mutate(partido = fct_collapse(partido,
                              otro = c("Sin respuesta", "No sabe", "Otro partido"),
                              republicano = c("Fuertemente republicano", "No fuertemente republicano"),
                              independiente = c("Ind, pro rep", "Independiente", "Ind, pro dem"),
                              demócrata = c("No fuertemente demócrata", "Fuertemente demócrata")
  )) %>%
  count(partido)
# A tibble: 4 x 2
#   partido           n
#   <fct>         <int>
# 1 otro            548
# 2 republicano    5346
# 3 independiente  8409
# 4 demócrata      7180


encuesta %>%
  mutate(religion = fct_lump(religion, other_level = "Otra")) %>%
  count(religion)
# A tibble: 2 x 2
#   religion        n
#   <fct>       <int>
# 1 Protestante 10846
# 2 Otra        10637

encuesta %>%
  mutate(religion = fct_lump(religion, n = 10, other_level = "Otra")) %>%
  count(religion, sort = TRUE) %>%
  print(n = Inf)
# A tibble: 10 x 2
#   religion                   n
#   <fct>                  <int>
# 1 Protestante            10846
# 2 Católica                5124
# 3 Ninguna                 3523
# 4 Cristiana                689
# 5 Otra                     458
# 6 Judía                    388
# 7 Budismo                  147
# 8 Inter o no confesional   109
# 9 Musulmana/Islam          104
# 10 Cristiana ortodoxa        95


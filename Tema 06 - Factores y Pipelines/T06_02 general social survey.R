library(tidyverse)
library(datos)

encuesta
# A tibble: 21,483 x 9
#     anio estado_civil   edad raza   ingreso partido  religion denominacion horas_tv
#     <int> <fct>         <int> <fct>  <fct>   <fct>    <fct>    <fct>           <int>
# 1  2000 Nunca se ha ~    26 Blanca 8000 -~ Ind, pr~ Protest~ Bautistas d~       12
# 2  2000 Divorciado       48 Blanca 8000 -~ No fuer~ Protest~ Bautista, n~       NA
# 3  2000 Viudo            67 Blanca No apl~ Indepen~ Protest~ No denomina~        2
# 4  2000 Nunca se ha ~    39 Blanca No apl~ Ind, pr~ Cristia~ No aplica           4
# 5  2000 Divorciado       25 Blanca No apl~ No fuer~ Ninguna  No aplica           1
# 6  2000 Casado           25 Blanca 20000 ~ Fuertem~ Protest~ Bautistas d~       NA
# 7  2000 Nunca se ha ~    36 Blanca 25000 ~ No fuer~ Cristia~ No aplica           3
# 8  2000 Divorciado       44 Blanca 7000 -~ Ind, pr~ Protest~ Sínodo lute~       NA
# 9  2000 Casado           44 Blanca 25000 ~ No fuer~ Protest~ Otra                0
# 10  2000 Casado           47 Blanca 25000 ~ Fuertem~ Protest~ Bautistas d~        3
# # ... with 21,473 more rows

?encuesta

encuesta %>%
  count(raza)
# A tibble: 3 x 2
#   raza       n
#   <fct>  <int>
# 1 Otra    1959
# 2 Negra   3129
# 3 Blanca 16395

ggplot(encuesta, aes(raza)) + 
  geom_bar() # este gráfico muestra tres categorias( Otra, Negra, Blanca)

ggplot(encuesta, aes(raza)) + 
  geom_bar() +
  scale_x_discrete(drop = FALSE)
  # este gráfico muestra cuatro columnas, la última con No aplica, en esta caso sin datos


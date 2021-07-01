library(tidyverse)
library(datos)

aerolineas
# A tibble: 16 x 2
#   aerolinea nombre                     
#   <chr>     <chr>                      
# 1 9E        Endeavor Air Inc.          
# 2 AA        American Airlines Inc.     
# 3 AS        Alaska Airlines Inc.       
# 4 B6        JetBlue Airways            
# 5 DL        Delta Air Lines Inc.       
# 6 EV        ExpressJet Airlines Inc.   
# 7 F9        Frontier Airlines Inc.     
# 8 FL        AirTran Airways Corporation
# 9 HA        Hawaiian Airlines Inc.     
# 10 MQ        Envoy Air                  
# 11 OO        SkyWest Airlines Inc.      
# 12 UA        United Air Lines Inc.      
# 13 US        US Airways Inc.            
# 14 VX        Virgin America             
# 15 WN        Southwest Airlines Co.     
# 16 YV        Mesa Airlines Inc.

aeropuertos
# A tibble: 1,458 x 8
#   codigo_aeropuerto nombre latitud longitud altura zona_horaria horario_verano
#   <chr>             <chr>    <dbl>    <dbl>  <dbl>        <dbl> <chr>         
# 1 04G               Lansd~    41.1    -80.6   1044           -5 A             
# 2 06A               Moton~    32.5    -85.7    264           -6 A             
# 3 06C               Schau~    42.0    -88.1    801           -6 A             
# 4 06N               Randa~    41.4    -74.4    523           -5 A             
# 5 09J               Jekyl~    31.1    -81.4     11           -5 A             
# 6 0A9               Eliza~    36.4    -82.2   1593           -5 A             
# 7 0G6               Willi~    41.5    -84.5    730           -5 A             
# 8 0G7               Finge~    42.9    -76.8    492           -5 A             
# 9 0P2               Shoes~    39.8    -76.6   1000           -5 U             
# 10 0S9               Jeffe~    48.1   -123.     108           -8 A             
# ... with 1,448 more rows, and 1 more variable: zona_horaria_iana <chr>

aviones
# A tibble: 3,322 x 9
#    codigo_cola  anio tipo       fabricante   modelo  motores asientos velocidad
#    <chr>       <int> <chr>      <chr>        <chr>     <int>    <int>     <int>
# 1 N10156       2004 Ala fija ~ EMBRAER      EMB-14~       2       55        NA
# 2 N102UW       1998 Ala fija ~ AIRBUS INDU~ A320-2~       2      182        NA
# 3 N103US       1999 Ala fija ~ AIRBUS INDU~ A320-2~       2      182        NA
# 4 N104UW       1999 Ala fija ~ AIRBUS INDU~ A320-2~       2      182        NA
# 5 N10575       2002 Ala fija ~ EMBRAER      EMB-14~       2       55        NA
# 6 N105UW       1999 Ala fija ~ AIRBUS INDU~ A320-2~       2      182        NA
# 7 N107US       1999 Ala fija ~ AIRBUS INDU~ A320-2~       2      182        NA
# 8 N108UW       1999 Ala fija ~ AIRBUS INDU~ A320-2~       2      182        NA
# 9 N109UW       1999 Ala fija ~ AIRBUS INDU~ A320-2~       2      182        NA
# 10 N110UW       1999 Ala fija ~ AIRBUS INDU~ A320-2~       2      182        NA
# # ... with 3,312 more rows, and 1 more variable: tipo_motor <chr>

clima
# A tibble: 26,115 x 15
#    origen  anio   mes   dia  hora temperatura punto_rocio humedad
#    <chr>  <int> <int> <int> <int>       <dbl>       <dbl>   <dbl>
# 1 EWR     2013     1     1     1        39.0        26.1    59.4
# 2 EWR     2013     1     1     2        39.0        27.0    61.6
# 3 EWR     2013     1     1     3        39.0        28.0    64.4
# 4 EWR     2013     1     1     4        39.9        28.0    62.2
# 5 EWR     2013     1     1     5        39.0        28.0    64.4
# 6 EWR     2013     1     1     6        37.9        28.0    67.2
# 7 EWR     2013     1     1     7        39.0        28.0    64.4
# 8 EWR     2013     1     1     8        39.9        28.0    62.2
# 9 EWR     2013     1     1     9        39.9        28.0    62.2
# 10 EWR     2013     1     1    10        41          28.0    59.6
# # ... with 26,105 more rows, and 7 more variables: direccion_viento <dbl>,
# #   velocidad_viento <dbl>, velocidad_rafaga <dbl>, precipitacion <dbl>,
# #   presion <dbl>, visibilidad <dbl>, fecha_hora <dttm>


# keys
aviones$codigo_cola
# [1] "N10156" "N102UW" "N103US" "N104UW" "N10575" "N105UW" "N107US" "N108UW"
# [9] "N109UW" "N110UW" "N11106" "N11107" "N11109" "N11113" "N11119" "N11121"
#   borro el resto de líneas que hay en medio
# [985] "N3747D" "N3748Y" "N3749D" "N374AA" "N374DA" "N374JB" "N374NW" "N374SW"
# [993] "N3750D" "N3751B" "N3752"  "N3753"  "N3754A" "N3755D" "N3756"  "N3757D"
# [ reached getOption("max.print") -- omitted 2322 entries ]


# keys
vuelos$codigo_cola
# [1] "N14228" "N24211" "N619AA" "N804JB" "N668DN" "N39463" "N516JB" "N829AS"
# [9] "N593JB" "N3ALAA" "N793JB" "N657JB" "N29129" "N53441" "N3DUAA" "N708JB"
#   borro el resto de líneas que hay en medio
# [985] "N703JB" "N509JB" "N660DL" "N918DL" "N537UW" "N3CNAA" "N309JB" "N995DL"
# [993] "N487AA" "N837MQ" "N528UA" "N5FTAA" "N322US" "N971DL" "N656AW" "N304JB"
# [ reached getOption("max.print") -- omitted 335776 entries ]

# keys
aviones %>%
  count(codigo_cola) %>%
  filter(n > 1)
# A tibble: 0 x 2
# ... with 2 variables: codigo_cola <chr>, n <int>

# keys
clima %>%
  count(anio, mes, dia, hora, origen) %>%
  filter(n > 1)
# A tibble: 3 x 6
#    anio   mes   dia  hora origen     n
#    <int> <int> <int> <int> <chr>  <int>
# 1  2013    11     3     1 EWR        2
# 2  2013    11     3     1 JFK        2
# 3  2013    11     3     1 LGA        2

# comprobando si son llaves únicas
vuelos %>%
  count(anio, mes, dia, hora, vuelo) %>%
  filter(n > 1)
# A tibble: 2,945 x 6
#    anio   mes   dia  hora vuelo     n
#    <int> <int> <int> <dbl> <int> <int>
# 1  2013     1     1     6   303     2
# 2  2013     1     1     7    11     2
# 3  2013     1     1     7   715     2
# 4  2013     1     1     8   717     2
# 5  2013     1     1    12    32     2
# 6  2013     1     1    12  1443     2
# 7  2013     1     1    15  4105     2
# 8  2013     1     1    16   702     2
# 9  2013     1     1    19    87     2
# 10  2013     1     1    19   645     2
# # ... with 2,935 more rows

# comprobando sin son llaves únicas
vuelos %>%
  count(anio, mes, dia, codigo_cola) %>%
  filter(n > 1)
#    anio   mes   dia codigo_cola     n
#    <int> <int> <int> <chr>       <int>
# 1  2013     1     1 N0EGMQ          2
# 2  2013     1     1 N11189          2
# 3  2013     1     1 N11536          2
# 4  2013     1     1 N11544          3
# 5  2013     1     1 N11551          2
# 6  2013     1     1 N12540          2
# 7  2013     1     1 N12567          2
# 8  2013     1     1 N13123          2
# 9  2013     1     1 N13538          3
# 10  2013     1     1 N13566          3
# # ... with 64,918 more rows


# Si una tabla no tiene una llave primaria a veces puede ser útil incluirla
# con un mutate o un row_number

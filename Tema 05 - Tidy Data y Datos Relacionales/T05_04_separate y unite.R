# Separate y Unite

library(tidyverse)
library(datos)

# En la tabla3, la variante tasa contiene dos datos (casos y población)
tabla3
# A tibble: 6 x 3
#   pais        anio tasa             
#   <chr>      <int> <chr>            
# 1 Afganistán  1999 745/19987071     
# 2 Afganistán  2000 2666/20595360    
# 3 Brasil      1999 37737/172006362  
# 4 Brasil      2000 80488/174504898  
# 5 China       1999 212258/1272915272
# 6 China       2000 213766/1280428583

# Podemos separar con separate

tabla3 %>%
  separate(tasa, into = c("casos", "poblacion"))
# A tibble: 6 x 4
#    pais        anio casos  poblacion 
#    <chr>      <int> <chr>  <chr>     
# 1 Afganistán  1999 745    19987071  
# 2 Afganistán  2000 2666   20595360  
# 3 Brasil      1999 37737  172006362 
# 4 Brasil      2000 80488  174504898 
# 5 China       1999 212258 1272915272
# 6 China       2000 213766 1280428583

# También podemos separar indicando el carácter alfanumérico que hace de separación
tabla3 %>%
  separate(tasa, into = c("casos", "poblacion"), sep = "/")
# Se obtiene el mismo resultado

tabla3 %>%
  separate(tasa, into = c("casos", "poblacion"), convert = TRUE)
# Se obtiene el mismo resultado convirtiendo el tipo de las columnas
# de casos y población de tipo <char> a tipo <int>

# En este caso anio se divide en dos columnas de tipo <char> con 
# los dos primeros caracteres como siglo y los dos siguientes como anio

tabla3 %>%
  separate(anio, into = c("siglo", "anio"), sep = 2)

# A tibble: 6 x 4
#   pais       siglo anio  tasa             
#   <chr>      <chr> <chr> <chr>            
# 1 Afganistán 19    99    745/19987071     
# 2 Afganistán 20    00    2666/20595360    
# 3 Brasil     19    99    37737/172006362  
# 4 Brasil     20    00    80488/174504898  
# 5 China      19    99    212258/1272915272
# 6 China      20    00    213766/1280428583


# La función unite es el inverso de la función separate
tabla5
# A tibble: 6 x 4
#   pais       siglo anio  tasa             
#   <chr>      <chr> <chr> <chr>            
# 1 Afganistán 19    99    745/19987071     
# 2 Afganistán 20    00    2666/20595360    
# 3 Brasil     19    99    37737/172006362  
# 4 Brasil     20    00    80488/174504898  
# 5 China      19    99    212258/1272915272
# 6 China      20    00    213766/1280428583

tabla5 %>%
  unite(nueva, siglo, anio, sep="")
# A tibble: 6 x 3
#   pais       nueva tasa             
#   <chr>      <chr> <chr>            
# 1 Afganistán 1999  745/19987071     
# 2 Afganistán 2000  2666/20595360    
# 3 Brasil     1999  37737/172006362  
# 4 Brasil     2000  80488/174504898  
# 5 China      1999  212258/1272915272
# 6 China      2000  213766/1280428583


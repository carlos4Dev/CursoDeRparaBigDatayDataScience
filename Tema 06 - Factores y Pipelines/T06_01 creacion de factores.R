# Creación de factores

library(tidyverse)
library(datos)

meses <- c("Dic", "Ene", "Sep", "Mar")

# meses2 tiene a propósito la abreviatura de Enero mal puesta con una m
meses2 <- c("Dic", "Eme", "Sep", "Mar")

# Si queremos ordenar meses, al ser un conjunto de caracteres no ordenará los meses
sort(meses)
# [1] "Dic"  "Ene"  "Mar"  "Sept"

niveles_meses <- c(
  "Ene", "Feb", "Mar", "Abr", "May", "Jun",
  "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"
)

factor1 <- factor(meses, levels = niveles_meses)

sort(factor1)
# [1] Ene Mar Sep Dic
# Levels: Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic

factor2 <- factor(meses2, levels = niveles_meses)

sort(factor2)
# No muestra el error, el elemento no coinicidente, en este caso Eme
# [1] Mar Sep Dic
# Levels: Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic

factor2 <- parse_factor(meses2, levels = niveles_meses)
# Con parse_factor, si nos muestra advertencias de los no coincidentes
# Warning: 1 parsing failure.
# row col           expected actual
# 2  -- value in level set    Eme

factor(factor2)
# factor() ordena el factor alfabeticamente, mostrando los no coicidentes como NA
# [1] Dic  <NA> Sep  Mar 
# Levels: Mar Sep Dic


f2 <- factor(factor2, levels = unique(factor2))
f2
# con levels = unique(factor) muestra los niveles en orden de aparición
# [1] Dic  <NA> Sep  Mar 
# Levels: Dic Sep Mar

f3 <- factor2 %>% factor() %>% fct_inorder()
f3
# Devuelve el mismo resultado que leves = unique(factor2)
# [1] Dic  <NA> Sep  Mar 
# Levels: Dic Sep Mar

levels(factor1)
# Muestra los niveles del factor
# [1] "Ene" "Feb" "Mar" "Abr" "May" "Jun" "Jul" "Ago" "Sep" "Oct" "Nov" "Dic"

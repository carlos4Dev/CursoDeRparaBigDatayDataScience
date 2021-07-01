# Problemas con funciones join

# altura y longitud no serían buenos identificadores
aeropuertos %>% count(altura, longitud) %>% filter(n > 1)
# A tibble: 0 x 3
# ... with 3 variables: altura <dbl>, longitud <dbl>, n <int>



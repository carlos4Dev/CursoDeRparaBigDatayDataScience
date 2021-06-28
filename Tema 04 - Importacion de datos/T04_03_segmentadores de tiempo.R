library(tidyverse)

# Los segmentadores de fecha por defecto asumen ISO8601
# van de mayor a menor, año, mes, día, hora, minutos, segundos

parse_datetime("2010-10-01T2010")
# [1] "2010-10-01 20:10:00 UTC"


parse_datetime("20101001")
# [1] "2010-10-01 UTC"

parse_date("2021-06-27")
parse_date("2021/06/27")
# los dos devuelven [1] "2021-06-27", año mes y día separados por -

library(hms) # para poder utilizar especificadores am y pm

parse_time("06:00 pm")
# devuelve 18:00:00

parse_time("19:00:12")
# devuelve 19:00:12

# R no tiene incorporado una buena clase para datos temporales
# por eso cargamos library(hms)
# si por lo que sea no van bien con los datos, hay que darles un formato

# %Y año 4 dígitos, %y año 2 dígitos,
# %m mes con 2 dígitos, %b mes abreviado, %B mes completo
# %d día con 2 dígitos, %e con espacio opcional
# %H hora %I minutos






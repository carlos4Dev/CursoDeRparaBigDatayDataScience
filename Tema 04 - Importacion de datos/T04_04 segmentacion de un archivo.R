# Segmentación de un archivo

# La función guess_parser() nos devuelve el tipo de datos que hemos pasado como argumento

guess_parser("2010-10-01")
# [1] "date"

guess_parser("15:01")
# [1] "time"

guess_parser(c("TRUE", "FALSE"))
# [1] "logical"

guess_parser(c("1", "5", "9"))
# [1] "double"

guess_parser(c("1,5,9"))
# [1] "number"

guess_parser(c("1, 5, 9"))
# [1] "character"


desafio <- read_csv(readr_example("challenge.csv"))
# Esto devuelve un error de 1000 parsing failures

problems(desafio)
# Esto devuelve un tibble de 1000 x 5 en este caso con las primeras filas y sus tipos

tail(desafio)
# Aquí nos devuelve un tibble de 6 x 2 con valores dbl y lgl, estando NA los valores lgl

# Para solucionar estos problemas al convertir el archivo
# cada función parse tiene su función col_ 
# El siguiente ejemplo no soluciona complentamente, porque las primeras 1000 filas
# tienen un formato y las 1000 siguiente otro

desafio <- read_csv(
  readr_example("challenge.csv"),
  col_types = cols(
    x = col_double(),
    y = col_date()
  )
)

tail(desafio)

desafio2 <- read_csv(readr_example("challenge.csv"), guess_max = 1001)
# Esto devuelve 
# -- Column specification -------------------
# cols(
#   x = col_double(),
#   y = col_date(format = "")
# )

desafio2
# devuelve un tibble de 2000 x 2, donde las primeras 10 filas el valor de date es NA

df <- tribble(
  ~x,   ~y,
  "1",  "1.21",
  "2",  "2.32",
  "3",  "4.56"
)

df
# devuelve un tibble de 3 x 2, las columnas son de tipo chr

type_convert(df)
# devuelve un tibble de 3 x 2, las columnas son de tipo dbl

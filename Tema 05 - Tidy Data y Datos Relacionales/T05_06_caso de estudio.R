# Caso de estudio

tidyr::who
summary(who)

# Primer paso ordenador y eliminar valores NA
who1 <- who %>%
  pivot_longer(
    cols = new_sp_m014:newrel_f65,
    names_to = "key",
    values_to = "cases",
    values_drop_na = TRUE
  )

who1
# A tibble: 76,046 x 6
#   country     iso2  iso3   year key          cases
#   <chr>       <chr> <chr> <int> <chr>        <int>
# 1 Afghanistan AF    AFG    1997 new_sp_m014      0
# 2 Afghanistan AF    AFG    1997 new_sp_m1524    10
# 3 Afghanistan AF    AFG    1997 new_sp_m2534     6
# 4 Afghanistan AF    AFG    1997 new_sp_m3544     3
# 5 Afghanistan AF    AFG    1997 new_sp_m4554     5
# 6 Afghanistan AF    AFG    1997 new_sp_m5564     2
# 7 Afghanistan AF    AFG    1997 new_sp_m65       0
# 8 Afghanistan AF    AFG    1997 new_sp_f014      5
# 9 Afghanistan AF    AFG    1997 new_sp_f1524    38
# 10 Afghanistan AF    AFG    1997 new_sp_f2534    36
# # ... with 76,036 more rows



# conteo
who1 %>%
  count(key)
# A tibble: 56 x 2
#   key              n
#   <chr>        <int>
# 1 new_ep_f014   1032
# 2 new_ep_f1524  1021
# 3 new_ep_f2534  1021
# 4 new_ep_f3544  1021
# 5 new_ep_f4554  1017
# 6 new_ep_f5564  1017
# 7 new_ep_f65    1014
# 8 new_ep_m014   1038
# 9 new_ep_m1524  1026
# 10 new_ep_m2534  1020
# # ... with 46 more rows



# mutate
who2 <- who1 %>%
  mutate(key = stringr::str_replace(key, "newrel", "rew_rel"))

who2
# A tibble: 76,046 x 6
#  country     iso2  iso3   year key          cases
#  <chr>       <chr> <chr> <int> <chr>        <int>
# 1 Afghanistan AF    AFG    1997 new_sp_m014      0
# 2 Afghanistan AF    AFG    1997 new_sp_m1524    10
# 3 Afghanistan AF    AFG    1997 new_sp_m2534     6
# 4 Afghanistan AF    AFG    1997 new_sp_m3544     3
# 5 Afghanistan AF    AFG    1997 new_sp_m4554     5
# 6 Afghanistan AF    AFG    1997 new_sp_m5564     2
# 7 Afghanistan AF    AFG    1997 new_sp_m65       0
# 8 Afghanistan AF    AFG    1997 new_sp_f014      5
# 9 Afghanistan AF    AFG    1997 new_sp_f1524    38
# 10 Afghanistan AF    AFG    1997 new_sp_f2534    36
# # ... with 76,036 more rows



# separate
who3 <- who2 %>%
  separate(key, c("news", "type", "sex_age"), sep = "_")

who3
# A tibble: 76,046 x 8
#   country     iso2  iso3   year news  type  sex_age cases
#   <chr>       <chr> <chr> <int> <chr> <chr> <chr>   <int>
# 1 Afghanistan AF    AFG    1997 new   sp    m014        0
# 2 Afghanistan AF    AFG    1997 new   sp    m1524      10
# 3 Afghanistan AF    AFG    1997 new   sp    m2534       6
# 4 Afghanistan AF    AFG    1997 new   sp    m3544       3
# 5 Afghanistan AF    AFG    1997 new   sp    m4554       5
# 6 Afghanistan AF    AFG    1997 new   sp    m5564       2
# 7 Afghanistan AF    AFG    1997 new   sp    m65         0
# 8 Afghanistan AF    AFG    1997 new   sp    f014        5
# 9 Afghanistan AF    AFG    1997 new   sp    f1524      38
# 10 Afghanistan AF    AFG    1997 new   sp    f2534      36
# # ... with 76,036 more rows



# count
who3 %>%
  count(news)
# A tibble: 2 x 2
#   news      n
#   <chr> <int>
# 1 new   73466
# 2 rew    2580



# Eliminamos las columnas redundantes con select y el signo menos
who4 <- who3 %>%
  select(-news, -iso2, -iso3)

who4
# A tibble: 76,046 x 5
#   country      year type  sex_age cases
#   <chr>       <int> <chr> <chr>   <int>
# 1 Afghanistan  1997 sp    m014        0
# 2 Afghanistan  1997 sp    m1524      10
# 3 Afghanistan  1997 sp    m2534       6
# 4 Afghanistan  1997 sp    m3544       3
# 5 Afghanistan  1997 sp    m4554       5
# 6 Afghanistan  1997 sp    m5564       2
# 7 Afghanistan  1997 sp    m65         0
# 8 Afghanistan  1997 sp    f014        5
# 9 Afghanistan  1997 sp    f1524      38
# 10 Afghanistan  1997 sp    f2534      36
# # ... with 76,036 more rows


who5 <- who4 %>%
  separate(sex_age, c("sex","age"), sep = 1)

who5
# A tibble: 76,046 x 6
#   country      year type  sex   age   cases
#   <chr>       <int> <chr> <chr> <chr> <int>
# 1 Afghanistan  1997 sp    m     014       0
# 2 Afghanistan  1997 sp    m     1524     10
# 3 Afghanistan  1997 sp    m     2534      6
# 4 Afghanistan  1997 sp    m     3544      3
# 5 Afghanistan  1997 sp    m     4554      5
# 6 Afghanistan  1997 sp    m     5564      2
# 7 Afghanistan  1997 sp    m     65        0
# 8 Afghanistan  1997 sp    f     014       5
# 9 Afghanistan  1997 sp    f     1524     38
# 10 Afghanistan  1997 sp    f     2534     36
# # ... with 76,036 more rows



# Hasta aquí sería haciéndolo por pasos, asignando resultado intermedio
# a nuevas variables

# Normalmente se hace de una sola vez con un encadenamiento complejo
# utilizando pipes, así es como se debe hacer

who %>%
  pivot_longer(
    cols = new_sp_m014:newrel_f65,
    names_to = "key",
    values_to = "cases",
    values_drop_na = TRUE
  ) %>%
  mutate(
    key = stringr::str_replace(key, "newrel", "new_rel")
  ) %>%
  separate(key, c("new", "var", "sexage")) %>%
  select(-new, -iso2, -iso3) %>%
  separate(sexage, c("sex", "age"), sep = 1)

# A tibble: 76,046 x 6
#   country      year var   sex   age   cases
#    <chr>       <int> <chr> <chr> <chr> <int>
# 1 Afghanistan  1997 sp    m     014       0
# 2 Afghanistan  1997 sp    m     1524     10
# 3 Afghanistan  1997 sp    m     2534      6
# 4 Afghanistan  1997 sp    m     3544      3
# 5 Afghanistan  1997 sp    m     4554      5
# 6 Afghanistan  1997 sp    m     5564      2
# 7 Afghanistan  1997 sp    m     65        0
# 8 Afghanistan  1997 sp    f     014       5
# 9 Afghanistan  1997 sp    f     1524     38
# 10 Afghanistan  1997 sp    f     2534     36
# # ... with 76,036 more rows


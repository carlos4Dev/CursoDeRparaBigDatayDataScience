# stringi

apropos("replace")
# [1] "%+replace%"                     ".rs.registerReplaceHook"       
# [3] ".rs.replaceBinding"             ".rs.rpc.replace_comment_header"
# [5] "replace"                        "replace_na"                    
# [7] "setReplaceMethod"               "str_replace"                   
# [9] "str_replace_all"                "str_replace_na"                
# [11] "theme_replace"

head(dir(pattern = "\\.Rmd$"))
# character(0)

library(stringi)

c1 <- "a quick brown fox jumps over a lazy dog"

c2 <- "a quick brown fox jumps over a lazy dog"


stri_compare(c1, c2)
# Devuelve -1 si el segundo elemento es mayor que el primero
# Devuelve 0 si son iguales
# Develve 1 si el primer elemento es mayor que el segundo

c1 %s<=% c2
# [1] TRUE

stri_count_words(c(c1, c2))
# [1] 9 9

stri_extract_all_words(c(c1, c2))
# [[1]]
# [1] "a"     "quick" "brown" "fox"   "jumps" "over"  "a"     "lazy"  "dog"  
# 
# [[2]]
# [1] "a"     "quick" "brown" "fox"   "jumps" "over"  "a"     "lazy"  "dog"  

genius <- c("Godel", "Hilbert", "Cantor", "Gauss", "Godel", "Fermet", "Gauss")

genius[stri_duplicated(genius)]
# [1] "Godel" "Gauss"

stri_length(genius)
# [1] 5 7 6 5 5 6 5

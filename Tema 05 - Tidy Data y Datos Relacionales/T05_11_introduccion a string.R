# Introdución a String

x <- c("why", "video", "cross", "extra", "deal", "authority")

str_length(x)
# [1] 3 5 5 5 4 9

str_c(x, collapse = ", ")
# [1] "why, video, cross, extra, deal, authority"

str_sub(x, 1, 2)
# [1] "wh" "vi" "cr" "ex" "de" "au"


str_sub(x, 1, 4)
# [1] "why"  "vide" "cros" "extr" "deal" "auth"
# Tema 1 - Visualización de datos

library(tidyverse)
library(ggplot2)

# mpg es un dataset que viene de ejemplo en las librerías

mpg
view(mpg)
?mpg # Vemos la ayuda de mpg

# displ y hwy, son variables del dataset mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# Left, alpha controla la transparencia de los puntos, tono de color

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Right, shape controla la forma de los puntos

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# Asignamos color a los puntos

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# facetas, muestra una cantidad de gráficos con el número de columnas que indiquemos

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# facet_grid, muestra los gráficos en un grid (parrilla)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

# Objetos Geométricos

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# group

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv),
              show.legend = FALSE)

# multiples Geom

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
            
# Poner color en cada capa

ggplot(data= mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()

# Transformaciones estadísticas, diamonds está dentro de los ejemplos

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut)) # la variable cut se refiere al corte de los diamantes

# stat_count

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

# tribble es un tipo de dataset que viene dentro de la librería tidyverse

demo <- tribble(
  ~cut,        ~freq,
  "fair",       1610,
  "good",       4906,
  "very good", 12082,
  "premium",   13791,
  "ideal",     21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")

# barras de  proporción

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))

# stat_summary

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth), # depth = profundidad
    fun.min = min,
    fun.max = max,
    fun = median
  )

# Ajuste de Posición
# colour

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))

# fill

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

# combinación de cut y clarity

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

# position identity alpha

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
  geom_bar(alpha = 1/5, position = "identity")

# position identity fill

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) +
  geom_bar(fill = NA, position = "identity")

# position fill

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

# position dodge

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

# sistema de coordenadas

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

# coord_flip

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()

# coord_polar

bar <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut), 
           show.legend = FALSE,
           width = 1) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()


library(ggplot2)
library(palmerpenguins)

ggplot(penguins) + geom_point(aes (x= bill_length_mm,y= bill_depth_mm, colour = species))

library(ggplot2)
library(ggbeeswarm)
library(palmerpenguins)

ggplot(penguins) + geom_point(aes (x= bill_length_mm,y= bill_depth_mm, colour = species))

ggplot(penguins, aes(x = sex, y = body_mass_g, colour = sex)) +
  geom_beeswarm()

library(ggplot2)
library(palmerpenguins)

ggplot(penguins, aes(x = bill_length_mm, y = body_mass_g, colour = species)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  facet_wrap(~ island)

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, colour = species)) +
  geom_point(size = 3, alpha = 0.6) +  # size and transparency to match the visual
  scale_colour_manual(values = c(
    "Adelie" = "#F8766D",    # red-ish
    "Chinstrap" = "#00BA38", # green-ish
    "Gentoo" = "#619CFF"     # blue-ish
  )) +
  labs(
    x = "Bill Length",
    y = "Bill Depth",
    colour = "Species"
  ) +
  theme_minimal(base_size = 14) +       # clean minimal theme
  theme(
    legend.position = "top",             # legend above plot
    panel.grid.major = element_line(colour = "grey90"), 
    panel.grid.minor = element_blank()
  )
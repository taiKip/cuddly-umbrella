library(tidyverse)

# Basic arithmetic
a <- 5
b <- 6
a + b  # 11

# Create a vector
ages <- c(5, 6)
ages
sum(ages)  # 11

# Create a tibble (tidyverse version of data frame)
names <- c("John", "James")
friends <- tibble(
  names = names,
  ages = ages
)

# Inspect the tibble
friends
View(friends)
str(friends)

View(starwars)

starwars %>% 
  filter(height >150 & mass <200) %>% 
  mutate(height_in_meters = height/100) %>% 
  select(height_in_meters,mass) %>% 
  arrange(mass) %>% 
  #View()
  plot()

  
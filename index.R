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

View(msleep)
glimpse(msleep$name)
names(msleep)

unique(msleep$vore)

missing <- !complete.cases(msleep)

msleep[missing,]

# Clean

####################
# select variables

starwars %>% 
  select(name, height, mass)

starwars %>% select(1:3)

starwars %>% select(ends_with("color")) %>% View()

#changing variable name

starwars %>% 
  rename("characters" = "name") %>% head()


# changing a variable type

class(starwars$hair_color)

starwars$hair_color <- as.factor(starwars$hair_color)

class(starwars$hair_color)


starwars %>% mutate(hair_color = as.character(hair_color)) %>% 
  glimpse()

#changing factor levels
df <- starwars

df$sex <- as.factor(df$sex)

levels(df$sex)

df <- df %>% 
  mutate(sex = factor(sex,
                      levels = c("male","female","hermaphroditic","none")))

levels(df$sex)




#Install and load `tidyverse`.
install.packages("tidyverse")
library("tidyverse")

#Read the processed data from `lichess_db_puzzles_rating.ipynb
melted_theme_popularity <- read.csv('~/melted_theme_popularity.csv')

#Create the boxplot, reordering the themes by median rating.
ggplot(melted_theme_popularity, 
       aes(y = reorder(Theme, Popularity, FUN = median, na.rm = TRUE), x = Popularity))+
  labs(y = "Theme")+
  geom_boxplot()+
  theme_minimal()
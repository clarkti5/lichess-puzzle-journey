#Install and load `tidyverse`.
install.packages("tidyverse")
library("tidyverse")

#Read the processed data from `lichess_db_puzzles_rating.ipynb
melted_theme_rating_deviation <- read.csv('~/melted_theme_rating_deviation.csv')

#Create the boxplot, reordering the themes by median rating.
ggplot(melted_theme_rating_deviation, 
       aes(y = reorder(Theme, Rating_Deviation, FUN = median, na.rm = TRUE), x = Rating_Deviation))+
  labs(y = "Theme")+
  geom_boxplot()+
  theme_minimal()
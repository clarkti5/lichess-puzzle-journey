#Install and load `tidyverse`.
install.packages("tidyverse")
library("tidyverse")

#Read the processed data from `lichess_db_puzzles_rating.ipynb
melted_theme_ratings <- read.csv('~/melted_theme_ratings.csv')

#Create the boxplot, reordering the themes by median rating.
ggplot(melted_theme_ratings,
	aes(y = reorder(Theme, Rating, FUN = median, na.rm = TRUE), x = Rating))+
	labs(y = "Theme")+
	geom_boxplot()+
	theme_minimal()
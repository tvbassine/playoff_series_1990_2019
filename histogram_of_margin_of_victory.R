#Plot a histogram of playoff series margin of victory:

y <- read.csv('https://raw.githubusercontent.com/tvbassine/playoff_series_1990_2019/master/playoff_series_1990_2019.csv',
              stringsAsFactors = F)

library(ggplot2)
ggplot(y, aes(x=winner_margin))+
  geom_histogram(color="darkblue", fill="lightblue", binwidth = 2) +
  labs(x = "Series Winner Per Game Margin of Victory", title = 'Histogram of Playoff Series Winner Per Game Margin of Victory (1990-2019)') +
  annotate("text", label = "Median Margin of Victory = 5.4 Points", x = 18, y = 65, size = 5, colour = "red") +
  annotate("text", label = "In ~9% of series,\nwinner is outscored", x = -5, y = 40, size = 3.5, colour = "red") 

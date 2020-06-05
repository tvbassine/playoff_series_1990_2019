################################################
# Playoff Series Analysis
# 6/5/20
# Purpose: This code constructs a very simple model of
# a typical best-of-7 NBA playoff series, based on
# playoff data from 2003-2019
################################################

# Read data:
y <- read.csv('https://raw.githubusercontent.com/tvbassine/playoff_series_1990_2019/master/playoffs_2003_2019.csv',
              stringsAsFactors = F)

# Logistic Regression on difference in net rating.
model <- glm(home_win ~ net,
             family=binomial(link='logit'),
             data=y)

# Model summary
summary(model)

# Get and display predicted win probabilities
pred <- predict(model, 
                newdata = data.frame(net = seq(-5,10,1)),
                type = 'response')

cbind( seq(-5,10,1), pred)
# 0 point differential diff = 59%

plot(seq(-5,10,1), pred, 'b', pch = 19,
     ylab = 'Probability Home Team Wins Series',
     xlab = 'Home Team Point Differential - Away Team Point Differential',
     ylim = c(0,1),
     main = 'Simple Model of an NBA Playoff Series',
     xaxt = 'n')
axis(1, seq(-4,10,2))
text(seq(-4,10,2), pred[seq(2,16,2)],
     labels = round(pred[seq(2,16,2)], 2), pos = 3)

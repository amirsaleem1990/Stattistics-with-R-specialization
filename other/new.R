# library(dplyr)
# library(ggplot2)
# library(plotly)
# load('/home/datascince/Desktop//statistics with r/week-5/Data Analysis project/brfss2013.RData')
df <- brfss2013[,c('income2', 'seatbelt', 'exerhmm2')]
df$income_total <- NaN
a <- count(df, exerhmm2)
for (i in 1:dim(a)[1]){
  # for (z in 1:1){
  df$income_total[df$exerhmm2 == a[[i, 1]]] <- a[[i, 2]]
}
df <- na.omit(df)
gp <- df %>% 
  group_by(income2, seatbelt, exerhmm2) %>% 
  summarise(count = n(), income_total = mean(income_total), percent = count / mean(income_total)/100)
ggplot(gp, aes(x = income2, y = percent, fill=seatbelt)) + geom_bar(stat="identity")#, position = 'dodge')

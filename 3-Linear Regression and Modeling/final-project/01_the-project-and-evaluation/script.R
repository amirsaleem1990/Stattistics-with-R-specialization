library(ggplot2)
library(dplyr)
library(statsr)
load("movies.Rdata")
movies$dvd_rel_date <- as.Date(with(movies, paste(dvd_rel_year, dvd_rel_month, dvd_rel_day,sep="-")), "%Y-%m-%d")
movies$thtr_rel_date <- as.Date(with(movies, paste(thtr_rel_year, thtr_rel_month, thtr_rel_day,sep="-")), "%Y-%m-%d")
movies$days_between_dev_and_thtr_rel_dates <- (movies$dvd_rel_date - movies$thtr_rel_date)
# G – General Audiences
#   All ages admitted. Nothing that would offend parents for viewing by children.
# PG – Parental Guidance Suggested
#   Some material may not be suitable for children. Parents urged to give "parental guidance". May contain some material parents might not like for their young children.
# PG-13 – Parents Strongly Cautioned
#   Some material may be inappropriate for children under 13. Parents are urged to be cautious. Some material may be inappropriate for pre-teenagers.
# R – Restricted
#   Under 17 requires accompanying parent or adult guardian. Contains some adult material. Parents are urged to learn more about the film before taking their young children with them.
# NC-17 – Adults Only
#   No One 17 and Under Admitted. Clearly adult. Children are not admitted.


# table(movies$runtime) %>% plot()

movies %>% group_by(thtr_rel_year) %>% summarise(mean(days_between_dev_and_thtr_rel_dates)) %>% plot()

# movies %>% 
#   select(studio, imdb_rating, thtr_rel_year) %>% 
#   group_by(studio, thtr_rel_year) %>%
#   summarise(avg_imdb_rating=mean(imdb_rating), count=c()) %>% 
#   arrange(thtr_rel_year)
# 


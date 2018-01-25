library(xlsx)
library(tidyverse)

dat <- read.xlsx("age.xlsx",1) %>%
  as_data_frame()

dat$age_days <- (dat$exam - dat$dob) %>%
  as.numeric()

dat$age_month <- ((dat$exam - dat$dob)/30) %>%
  as.numeric()

dat$age_year <- ((dat$exam - dat$dob)/365) %>%
  as.numeric()


hist(dat$age_year)

dat$education <- dat$education %>%
  as.character() %>%
  as.numeric
  
hist(dat$education)

plot(dat$age_year, dat$education)
cor.test(dat$age_year, dat$education)

table(dat$education)

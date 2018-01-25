library(xlsx)
library(tidyverse)

age_data <- read_csv2("age.csv")
age_data$n <- as.numeric(age_data$n)

neuropsy_data_mel <- read_csv2("neuropsy_mela.csv") %>%
  select(`Code patient`:DS_4) %>%
  mutate(code = tolower(`Code patient`))


neuropsy_fed <- read_csv2("Federico_neuropsycho.csv") %>%
  select(1:85)

neuropsy_fed_age <- full_join(select(age_data, code:education), neuropsy_fed, by = "n")  

neuropsy_complete <- full_join(select(neuropsy_data_mel, - Age), 
                               select(neuropsy_fed_age, -`Fluence phonologique dans le DMS48`,
                                      -`Rey copie, score`, -`Rey copie Temps (sec)`,
                                      -`Fluence semantique`), by = "n")

write_delim(path = "neuropsy_complete_temp.csv", x = neuropsy_complete,delim = ";")

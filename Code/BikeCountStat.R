library(readxl)
input_file <- "Data/Hawthorne Tilikum Steel daily bike counts 073118.xlsx"
Bridge_Name <- "Hawthorne"
Hawthorne <- read_excel(input_file, Bridge_Name){
  bikecounts <- read_excel(input_file,
                           sheet = Bridge_Name,
                           skip = 1)
  bikecounts$name <- Bridge_Name
  bikecounts
}

Steel <- load_data(input_file, "Steel")
names(Steel) <- c("date", "lower", "westbound", " eastebound", "total", "name")

bikecounts <- bind_rows(Hawthorne, Tilikum, Steel %>% select(lower))

bikecounts %>%
  group_by(name) %>%
  summarise(avg_daily_counts=mean(total, na.rm = TRUE))

library(lubridate)



bind_rows(Hawthorne, Tilikum, Steel)

## great job, I could not figure this one out yesterday ##

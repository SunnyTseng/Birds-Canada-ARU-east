

# library -----------------------------------------------------------------
library(tidyverse)
library(here)


# import data  ------------------------------------------------------------
site <- "BaieVertePortElgin"
location <- "NB43-04"
aru_id <- 6

site_folder <- paste(site, location, aru_id, sep = "_")

site_data <- list.files(path = here("data", "raw", site_folder), 
                        pattern = ".csv",
                        full.names = TRUE,
                        recursive = TRUE) %>%
  .[!grepl("random", .)] %>%
  lapply(FUN = read_csv,
         col_types = cols(.default = "d", 
                          filepath = "c",
                          scientific_name = "c",
                          common_name = "c",
                          species_list = "c",
                          model = "c")) %>%
  bind_rows()


# data wrangling ----------------------------------------------------------

site_data_clean <- site_data %>%
  mutate(site = site,
         location = location,
         aru_id = aru_id,
         date = filepath %>% str_split_i("POP", i = 2) %>% str_split_i("_", i = 2), 
         hour = filepath %>% str_split_i("POP", i = 2) %>% str_split_i("_", i = 3) %>% str_sub(start = 1, end = 2)) %>%
  select(site, location, aru_id, date, hour, start, end, scientific_name, common_name, confidence, filepath)


# saving the final file ---------------------------------------------------
write_csv(site_data_clean, here("data", "cleaned", paste0(site_folder, ".csv")))
  




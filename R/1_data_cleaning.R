

# library -----------------------------------------------------------------
library(tidyverse)
library(here)

# create function ---------------------------------------------------------
raw2clean <- function(site, location, aru_id, type){
  # import data  ------------------------------------------------------------
  
  site_folder <- paste(site, location, aru_id, sep = "_")
  
  site_data <- list.files(path = here("data", "raw", type, site_folder), 
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
  write_csv(site_data_clean, here("data", "cleaned", "focal", paste0(site_folder, ".csv")))
}


# set parameters ----------------------------------------------------------
names <- list.files(here("data", "raw", "focal")) %>%
  str_split(pattern = "_")

for (i in 1:length(names)) {
  site <- names[[i]][1]
  location <- names[[i]][2]
  aru_id <- names[[i]][3]
  
  raw2clean(site = site, location = location, aru_id = aru_id, type = "focal")
}

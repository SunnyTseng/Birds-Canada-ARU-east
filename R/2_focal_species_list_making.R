
# library -----------------------------------------------------------------

library(tidyverse)
library(here)



# import data -------------------------------------------------------------

species_list <- read_csv(here("data", "focal_species_list.csv")) 
BirdNET_list <- read_delim(here("data", "BirdNET_GLOBAL_6K_V2.4_Labels_en_uk.txt"), col_names = FALSE, delim = "_")


# main code here ----------------------------------------------------------

species_list_1 <- species_list %>%
  # there are two species with different names in the Canada and in the BirdNET system
  mutate(common_name = if_else(common_name == "Bank Swallow", "Sand Martin", common_name)) %>% 
  mutate(common_name = if_else(common_name == "Common Gallinule", "American Moorhen", common_name)) %>%
  left_join(BirdNET_list, by = join_by(common_name == X2)) %>%
  relocate(X1, .before = common_name) %>%
  unite(col = combined_name)

write_csv(species_list_1, here("data", "focal_species_list_with_sci_name.txt"), col_names = FALSE)

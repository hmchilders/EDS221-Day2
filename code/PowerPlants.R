# Data Wrangling and Vis

library(tidyverse)
library(here)
library(janitor)

# import in the data from the csv using the here function; then clean names
plants <- read_csv(here("data", "power_plants.csv")) %>% 
  janitor::clean_names()
# view(plants)

# store a variable that is the plants data filtered for state name is Alabama
Alabama_plants <- plants %>% 
  filter(state_name == "Alabama")
#view(Alabama_plants)

Alabama_plants_2 <- plants %>% 
  filter(state_name == "Alabama" | state_name == "alabama")

alabama_plot <- ggplot(data=Alabama_plants, aes (x = install_mw, y = total_mw)) +
  geom_point()

ggsave(filename = here("figures", "alabama_plants.jpg"), plot = alabama_plot)
library(tidyverse)
library(dplyr)
library(readxl)

data_fr = read_xls("Table Ciqual 2020_FR_2020 07 07.xls") %>% 
  select(alim_nom_fr,
         alim_code,
         `Energie, Règlement UE N° 1169/2011 (kcal/100 g)`,
         `Protéines, N x facteur de Jones (g/100 g)`,
         `Glucides (g/100 g)`,
         `Lipides (g/100 g)`) %>%
  # Because there is one alim code apearing twice, I first group to detect it, and then filter by group that has two members
  group_by(alim_code) %>% mutate(n = n()) %>% filter(n == 1) %>% ungroup() %>% select(-n) %>%
  # We pivot data, so we can apply the same treatment to all "supposed" numeric values
  tidyr::pivot_longer(-alim_nom_fr:-alim_code,values_to = "value", names_to = "nutrient") %>%
  # When numbers are to low, the table use the formula < 0.5, we just replace with 0
  mutate(value = ifelse(grepl(pattern = "<", x = value), 0, value)) %>%
  # Same occures with "traces", we set 0 instead
  mutate(value = ifelse(grepl(pattern = "traces", x = value), 0, value)) %>%
  # We convert the field to numeric
  mutate(value = as.numeric(sub(",", ".", value, fixed = TRUE))) %>%
  # Replacing all na with 0
  mutate(value = ifelse(is.na(value), 0, value)) %>%
  # And we pivot back to a wider (more readable) format.
  tidyr::pivot_wider(names_from = "nutrient", values_from = "value")

select_eng = read_xls("Table Ciqual 2020_ENG_2020 07 07.xls") %>%
  select(alim_nom_eng, alim_code)

data_fr %>% full_join(select_eng) %>%
  mutate(alim_nom_eng = str_replace_all(alim_nom_eng, ",", ";")) %>%
  mutate(alim_nom_fr = str_replace_all(alim_nom_fr,",", ";")) %>%
  rename(kcal = "Energie, Règlement UE N° 1169/2011 (kcal/100 g)",
         proteins = "Protéines, N x facteur de Jones (g/100 g)",
         carbohydrates = "Glucides (g/100 g)",
         lipids = "Lipides (g/100 g)") %>%
  write_csv("ciqual_2020_fr_eng.csv")
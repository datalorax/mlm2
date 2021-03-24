library(tidyverse)
library(recipes)
link <- "https://www.oregon.gov/ode/educator-resources/assessment/Documents/KA_Media_1819.xlsx"
d <- rio::import(link,
            setclass = "tibble",
            skip = 5,
            na = "*") %>% 
  setNames(c("county", "distid", "dist_name", "instid", "inst_name", 
             "inst_type", "stu_type", "stu_group", "selfreg_score", 
             "interpersonal_score", "atl_score", "atl_n", "math_score", "math_n",
             "upperln_score", "upperln_n", "lowerln_score", "lowerln_n",
             "ls_score", "ls_n"))

ls_race <- d %>% 
  select(county:inst_type, stu_type, stu_group,
         ls_score)

ls_race %>% 
  filter(stu_type == "Race/Ethnicity") %>% 
  select(-stu_type) %>% 
  pivot_wider(names_from = stu_group,
              values_from = ls_score) %>% 
  janitor::clean_names() %>% 
  write_csv(here::here("data", "ls19.csv"))

selfreg_race <- d %>% 
  select(county:inst_type, stu_type, stu_group,
         selfreg_score) %>% 
  filter(stu_type == "Race/Ethnicity") %>% 
  select(-stu_type)

selfreg_race <- recipe(selfreg_score ~ ., selfreg_race) %>% 
  step_dummy(stu_group) %>% 
  prep() %>% 
  juice()
  
names(selfreg_race) <- gsub("stu_group_", "", names(selfreg_race))
write_csv(selfreg_race, here::here("data", "selfreg19.csv"))

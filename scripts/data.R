library(tidyverse)
library(recipes)
library(lme4)
library(MASS)
library(conflicted)
conflict_prefer("select", "dplyr")
conflict_prefer("filter", "dplyr")

popular_link <- "https://github.com/MultiLevelAnalysis/Datasets-third-edition-Multilevel-book/raw/master/chapter%202/popularity/SPSS/popular2.sav"
popular <- haven::read_sav(popular_link)
popular %>% 
  haven::as_factor() %>% 
  select(-starts_with("z"), -Cextrav:-Csex) %>% 
  write_csv(here::here("data", "popularity.csv"))


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


load("scripts/g345V2.Rda")
tmp <- d %>% 
  janitor::clean_names() %>% 
  select(sid, tid, scid = sc_id, grade, occasion, m_rit)

wave <- tibble(
  occasion = paste0("g", rep(c(3, 4, 5), each = 3), rep(c("f", "w", "s"), 3)),
  wave = 0:8
)

tmp <- left_join(tmp, wave) %>% 
  mutate(g4 = ifelse(grade == 3, 0, 1),
         g5 = ifelse(grade == 5, 1, 0)) %>% 
  as_tibble() %>% 
  drop_na() %>% 
  add_count(sid) %>% 
  filter(n == 9) %>% 
  select(sid:scid, wave:g5, m_rit) %>% 
  arrange(sid, wave)

first_teach <- tmp %>% 
  filter(wave == 0) %>% 
  select(sid, first_tch = tid)

tmp <- left_join(tmp, first_teach)  
  

m_empirical <- lmer(m_rit ~ wave + g4 + g5 +
                      (wave + g4 + g5|sid) +
                      (wave|first_tch) +
                      (wave|scid),
                    data = tmp,
                    control = lmerControl(optimizer = "nlminbwrap"))

summary(m_empirical)
# Simulated data
nsch <- 100
tch_per_school <- 9
stu_per_teach <- 25

fixed <- fixef(m_empirical)
names(fixed)[1] <- "intercept"
# fixed <- c(
#   intercept = 190.4, # intercept
#   slope = 6.13, # slope
#   g4 = -8.51, # g4 offset
#   g5 = -8.61 #g5 offset
# )

# covariance matrices
stu_vcov <- VarCorr(m_empirical)$sid
tch_vcov <- VarCorr(m_empirical)$first_tch
sch_vcov <- VarCorr(m_empirical)$scid

# residual variance
error <- sigma(m_empirical)

conduct_sim <- function(n, fixed, vcov, id_name) {
  out <- mvrnorm(n, fixed, vcov) %>% 
    as_tibble(.name_repair = "unique") %>% 
    setNames(names(fixed))
    
  out[id_name] <- seq_len(n)
  out
}


# simulate schools
set.seed(42)
sch_d <- conduct_sim(nsch, fixed[1:2], sch_vcov, "scid")

tch_d <- sch_d %>%
  group_by(scid) %>%
  nest() %>%
  mutate(
    tch_data = map(data, ~{
      conduct_sim(tch_per_school,
                  c(intercept = .x[[1]], slope = .x[[2]]),
                  tch_vcov,
                  "tid")
    })
  ) %>%
  select(-data) %>%
  unnest(tch_data)

# simulate student data
stu_d <- tch_d %>% 
  group_by(scid, tid) %>% 
  nest() %>% 
  mutate(
    stu_data = map(data, ~{
      conduct_sim(stu_per_teach, 
                  c(intercept = .x$intercept, slope = .x$slope, fixed[3:4]), 
                  stu_vcov,
                  "sid")
    })
  ) %>% 
  select(-data) %>% 
  unnest(stu_data)

create_stu_df <- function(int, slope, g4, g5, timepoints = 0:8, 
                          g4_time = c(rep(0, 3), rep(1, 6)),
                          g5_time = c(rep(0, 6), rep(1, 3)),
                          sigma = error) {
  means <- int + (slope*timepoints) + (g4*g4_time) + (g5*g5_time)
  tibble(timepoint = timepoints,
         g4 = g4_time,
         g5 = g5_time,
         score = vapply(means, function(x) rnorm(1, x, sigma),
                        FUN.VALUE = double(1))) 
}

sim_d <- stu_d %>% 
  group_by(scid, tid, sid) %>% 
  nest() %>% 
  mutate(stu_d = map(data, ~create_stu_df(.x$intercept, .x$slope, fixed[3], fixed[4])))

sim_d <- sim_d %>% 
  select(-data) %>% 
  unnest(stu_d) %>% 
  mutate(tid = paste0(scid, "-", tid),
         sid = paste0(tid, "-", sid))

m_check <- lmer(score ~ timepoint + g4 + g5 +
                  (timepoint + g4 + g5|sid) +
                  (timepoint|tid) +
                  (timepoint|scid),
                data = sim_d,
                control = lmerControl(optimizer = "bobyqa"))
summary(m_check)


sim_d <- sim_d %>% 
  mutate(grade = case_when(timepoint < 3 ~ 3,
                           timepoint > 2 & timepoint < 6 ~ 4,
                           TRUE ~ 5))

seasons <- tibble(
  timepoint = 0:8,
  season = rep(c("fall", "winter", "spring"), 3)
)

left_join(sim_d, seasons) %>% 
  mutate(timepoint = paste0("g", grade, "_", season)) %>% 
  select(-g4, -g5, -grade, -season) %>% 
  pivot_wider(names_from = "timepoint",
              values_from = "score") %>% 
  rename(distid = scid, # rename because actually need multiple teachers (one per grade)
         scid = tid) %>% 
  write_csv(here::here("data", "longitudinal-sim.csv"))


## Estrogen data
link <- "https://github.com/MultiLevelAnalysis/Datasets-third-edition-Multilevel-book/raw/master/chapter%2013/estrone/estrone.sav"
estrogen <- haven::read_sav(link)
write_csv(estrogen, here::here("data", "estrogen.csv"))

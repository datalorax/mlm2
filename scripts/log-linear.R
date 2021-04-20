library(tidyverse)

conduct_sim <- function(n, fixed, vcov, id_name) {
  out <- MASS::mvrnorm(n, fixed, vcov) %>% 
    as_tibble(.name_repair = "unique") %>% 
    setNames(names(fixed))
  
  out[id_name] <- seq_len(n)
  out
}

mat <- matrix(c(25, 5, 
                5, 9),
              byrow = TRUE, 
              ncol = 2)
cov2cor(mat)

stu <- conduct_sim(500, c(int = 22, slope = 25.5), mat, "sid")

sim_log <- stu %>% 
  rowwise() %>% 
  mutate(
    x = list(seq(0, 55, 0.1)),
    sample = list(sample(x, sample(3:8, 1))),
    score = list(
      rnorm(length(sample), int + slope*log(sample + 1), 1.2))) %>% 
  ungroup() %>% 
  unnest(c(sample, score)) %>% 
  mutate(date = lubridate::as_date(sample + 18000)) %>% 
  select(-x, -sample) %>% 
  select(sid, int, slope, date, score)

ggplot(sim_log, aes(date, score)) +
  geom_point()  +
  geom_smooth(method = "lm", se = FALSE) +
  geom_smooth(
    method = "lm", 
    se = FALSE,
    color = "magenta", 
    formula = y ~ log(x - min(x) + 1)
  )

write_csv(sim_log, here::here("data", "curvilinear-sim.csv"))

sim_log <- sim_log %>% 
  mutate(log_date = as.numeric(date),
         log_date = log(log_date - min(log_date) + 1))

ggplot(sim_log, aes(log_date, score)) +
  geom_point()  +
  geom_smooth(method = "lm", se = FALSE) 

# check
library(lme4)
m0 <- lmer(score ~ date + (date|sid), data = sim_log)
m1 <- lmer(score ~ log_date + (log_date|sid), data = sim_log)

summary(m0)
summary(m1)

anova(m0, m1)

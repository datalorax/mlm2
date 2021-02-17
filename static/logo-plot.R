library(tidyverse)
set.seed(123)

means <- list(c(11, 6), c(9, 7), c(8, 8), c(7, 9), c(6, 10))
d <- map_df(means, ~{
  MASS::mvrnorm(100, .x, matrix(c(1, 0.5, 0.5, 1), ncol = 2)) %>% 
    as_tibble() %>% 
    setNames(c("x", "y"))
  },
  .id = "school")

by_school <- d %>% 
  group_by(school) %>% 
  nest()

samps <- replicate(20, sample(seq_len(100), 10, replace = FALSE),
                   simplify = FALSE)
by_school$bootstrap <- map(by_school$data, ~{
  map_df(samps, function(row) .x[row, ], .id = "sample")
})

tmp <- by_school %>% 
  select(-data) %>% 
  unnest(bootstrap) %>% 
  group_by(school, sample) %>% 
  nest() 

pd <- map2_dfr(rep(by_school$data, each = 20), tmp$data, semi_join) %>% 
  mutate(school = rep(by_school$school, each = 20*10))

preds <- tmp %>% 
  mutate(mods = map(data, ~lm(y ~ x, .x)),
         preds = map(mods, predict),
         pred_frame = map2(data, mods, ~tibble(x = .x$x,
                                               y = predict(.y)))) %>% 
  select(school, sample, pred_frame) %>% 
  unnest(pred_frame) %>% 
  mutate(bs = paste(school, sample, sep = "_"))

ggplot(d, aes(x, y)) +
  geom_point(aes(color = school),
             size = 1.4,
             alpha = 0.3,
             stroke = 0,
             data = pd) +
  geom_line(aes(group = bs),
            size = 0.1,
            color = "gray40",  
            alpha = 0.4,
            data = preds) +
  geom_smooth(aes(color = school),
              #method = "lm",
              span = 1,
              se = FALSE) +
  geom_smooth(se = FALSE,
              span = 1,
              color = "gray10",
              #method = "lm",
              #formula = y ~ poly(x, 3)
              ) +
  paletteer::scale_color_paletteer_d("rtist::raphael") +
  theme_void() +
  guides(color = "none") +
  theme(
    panel.background = element_rect(fill = "transparent", color = NA),
    plot.background = element_rect(fill = "transparent", color = NA)
  )
ggsave(filename = "logo.png",  bg = "transparent", dpi = 700)

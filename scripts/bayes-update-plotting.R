library(tidyverse)

# First run these two functions
bayes_update <- function(true_data, prior_mean, prior_sd, grid) {
  grid <- grid %>% 
    mutate(prior = dnorm(grid$possible_mean, 
                         mean = {{prior_mean}}, 
                         sd = {{prior_sd}}),
           prior = prior / sum(prior),
           posterior = prior)
  
  posterior <- vector("list", length(true_data))
  likelihood <- vector("list", length(true_data))
  
  for(i in seq_along(true_data)) {
    grid <- grid %>% 
      mutate(likelihood = dnorm(true_data[i], possible_mean, 1),
             posterior = likelihood * posterior,
             posterior = posterior / sum(posterior))
    
    posterior[[i]] <- grid$posterior
    likelihood[[i]] <- dnorm(true_data[i], grid$possible_mean, 1)
  }
  
  for(i in 2:length(true_data)) {
    likelihood[[i]] <- (likelihood[[i]] + likelihood[[i - 1]]) / sum(likelihood[[i]] + likelihood[[i - 1]])
  }
  likelihood[[1]] <- likelihood[[1]] / sum(likelihood[[1]])
  
  tibble(data_points_observed = seq_along(true_data), 
         possible_mean = rep(list(grid$possible_mean), length(true_data)),
         prior = rep(list(grid$prior), length(true_data)),
         likelihood, 
         posterior) %>% 
    unnest(c(possible_mean, prior, likelihood, posterior))
}

plot_update <- function(bayes_update_ob, point_range) {
  bayes_update_ob %>% 
    filter(data_points_observed %in% point_range) %>%
    pivot_longer(c(prior, likelihood, posterior),
                 names_to = "Distribution",
                 values_to = "Probability density") %>% 
    ggplot(aes(x = possible_mean, `Probability density`)) +
    geom_line(aes(color = Distribution)) +
    facet_wrap(~data_points_observed)
}


# set some true data
x <- rnorm(n = 50, mean = 5, sd = 1)

# Then set a grid of values to search over for the mean estimate
search_grid <- tibble(possible_mean = seq(-3, 12, 0.1))

# Now try a few different plots
bayes_update(x, 1, 1, search_grid) %>% 
  plot_update(1:6) +
  geom_vline(xintercept = 5) # add in the true mean


bayes_update(x, 6, 0.5, search_grid) %>% 
  plot_update(1:12) +
  geom_vline(xintercept = 5) # add in the true mean


# Try a different set of arguments
# set some new true data
new_true_data <- rnorm(n = 500, mean = 50, sd = 1) # SD must be 1

# Then set a grid of values to search over for the mean estimate
new_search_grid <- tibble(possible_mean = seq(30, 60, 0.1))

bayes_update(new_true_data, 
             prior_mean = 35, 
             prior_sd = 5, 
             grid = new_search_grid) %>% 
  plot_update(1:9) +
  geom_vline(xintercept = 50)



# Make it an animation

# First run this function (must have gganimate installed)
animate_update <- function(bayes_update_ob, fps = 10) {
  anim <- bayes_update_ob %>% 
    pivot_longer(c(prior, likelihood, posterior),
                 names_to = "Distribution",
                 values_to = "Probability density") %>% 
    ggplot(aes(x = possible_mean, `Probability density`)) +
    geom_line(aes(color = Distribution)) +
    gganimate::transition_states(data_points_observed)
  
    gganimate::animate(anim, 
                       fps = fps,
                       renderer = gganimate::magick_renderer())
}

bayes_update(x, 6, 0.5, search_grid) %>% 
  animate_update()

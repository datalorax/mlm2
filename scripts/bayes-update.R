library(tidyverse)

set.seed(123)
true_data <- rnorm(50, 5, 1)

grid <- tibble(
  mean = seq(-3, 8, 0.1),
  prob = dnorm(mean, 2, 1)
) 

grid <- grid %>% 
  mutate(prob = prob / sum(prob),
         previous = prob)

plots <- vector("list", length(true_data))

for(i in seq_along(true_data)) {
  grid$likelihoods <- dnorm(true_data[i], grid$mean, 1)
  
  grid$prob <- grid$likelihoods * grid$prob
  grid$prob  <- grid$prob / sum(grid$prob)
  
  plots[[i]] <- grid %>% 
    ggplot(aes(mean, prob)) +
    geom_line() +
    geom_line(aes(y = previous), lty = "dashed") +
    geom_line(aes(y = likelihoods), color = "#90A8D0")
}
plots[[1]]
plots[[2]]
plots[[3]]
plots[[4]]
plots[[5]]
plots[[6]]
plots[[7]]
plots[[8]]
plots[[9]]
plots[[10]]
plots[[11]]
plots[[12]]
plots[[length(plots)]]












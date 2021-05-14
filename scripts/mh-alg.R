# Script adapted from: https://onlookerliu.github.io/2017/12/29/A-simple-Metropolis-Hastings-MCMC-in-R/#The-MCMC
library(tidyverse)
theme_set(theme_minimal())
library(patchwork)

set.seed(123)

true_a <- 0
true_b <- 5
true_sigma <- 10
n <- 31

# create independent x-values
x <- -15:15

# create dependent values according to ax + b + N(0,sd)
y <-  true_a + (true_b * x) + rnorm(n = n, mean = 0, sd = true_sigma)

tibble(x, y) %>% 
  ggplot(aes(x, y)) +
  geom_point()

likelihood <- function(param, x_data = x, y_data = y){
  par_a <- param[1]
  par_b <- param[2]
  par_sigma <- param[3]
  
  pred <- par_a + (par_b * x_data)
  ll <- dnorm(y_data, mean = pred, sd = par_sigma, log = TRUE)
  
  sum(ll)
}

slope_likelihoods <- vapply(seq(3, 7, by=.05), function(.x) {
    likelihood(c(true_a, .x, true_sigma))
  },
  FUN.VALUE = double(1)
)

tibble(b1_candidate = seq(3, 7, by=.05),
       likelihood = slope_likelihoods) %>% 
  ggplot(aes(b1_candidate, likelihood)) +
  geom_line()

# Prior distribution
prior <- function(param){
  prior_a <- param[1]
  prior_b <- param[2]
  prior_sigma = param[3]
  
  a_prior <- dnorm(prior_a, sd = 5, log = TRUE)
  b_prior <- dunif(prior_b, min = 0, max = 10, log = TRUE)
  sigma_prior <- dunif(prior_sigma, min = 0, max = 30, log = TRUE)
  
  a_prior + b_prior + sigma_prior
}

# summing because we're working with logarithms instead of raw data
posterior <- function(param) {
  likelihood(param) + prior(param) 
}

# Metropolis-Hastings algorithm
# Jump around the parameters, but in a way that is proportional to the posterior density
# * start at a random place
# * choose a new place from the old place, based on some probability density (the proposal function)
# * jump to the new place with probability p(new)/p(old), where values > 1 mean actually jump (rather than reject)

proposal_function <- function(param) {
  rnorm(
    n = 3, # 3 draws because 3 parameters
    mean = param, # three different means - one for each param
    sd = c(0.5,0.1,0.3) # variability in the possible candidate
  )
}

run_mh_mcmc <- function(start_vals, iter){
  chain <- matrix(nrow = iter + 1, 
                  ncol = 3)
  
  chain[1, ] <- start_vals
  
  for (i in seq_len(iter)) {
    proposal <- proposal_function(chain[i,])
    
    # Exponentiate to put on probability scale
    # p1/p2 = exp[log(p1) − log(p2)].
    prob <- exp(posterior(proposal) - posterior(chain[i, ]))
    
    # The random part of the walk, but using probabilities
    if (runif(1) < prob) {
      chain[i + 1, ] <- proposal
    } else {
      chain[i + 1, ] <- chain[i, ]
    }
  }
  chain
}

starts <- list(
  c(0, 4, 10),
  c(3, 0, 8),
  c(-3, 8, 2),
  c(5, 2, 15)
)
chains <- map(starts, run_mh_mcmc,  100000)

# how often was a proposal rejected by the MH acceptance criterion
map_dbl(chains, ~ 1 - mean(duplicated(.x)))

burn_in = 5000

chains <- map(chains, ~{
  colnames(.x) <- c("a", "b", "sigma")
  .x
})

chains <- map_df(chains, ~{
  as_tibble(.x) %>% 
    rownames_to_column("iter")
  }, 
  .id = "chain"
)

chains <- chains %>% 
  pivot_longer(-c(chain, iter),
               names_to = "parameter",
               values_to = "value")

true_vals <- tibble(
  parameter = c("a", "b", "sigma"),
  value = c(0, 5, 10)
)

chain_plots <- ggplot(chains, aes(as.numeric(iter), value)) +
  geom_rect(xmin = -Inf, xmax = burn_in, ymin = -Inf, ymax = Inf) +
  geom_line(aes(color = chain)) +
  geom_hline(aes(yintercept = value), 
             data = true_vals,
             color = "#ff00b7") +
  facet_wrap(~parameter, scale = "free") +
  scale_color_brewer(palette = "Pastel1")

# Actually remove burn-in
chains <- map(chains, ~.x[-seq_len(burn_in), ])

posterior_medians <- chains %>% 
  group_by(parameter) %>% 
  summarize(median = median(value))

hists <- ggplot(chains, aes(value)) +
  geom_histogram() +
  geom_vline(aes(xintercept = median),
             data = posterior_medians,
             color = "#00b7ff") +
  geom_vline(aes(xintercept = value),
             data = true_vals,
             color = "#ff00b7") +
  facet_wrap(~parameter, scales = "free")

summary_plot <- hists / chain_plots
ggsave(here::here("scripts", "mh-convergence.png"),
       summary_plot,
       width = 11, 
       height = 6,
       dpi = 800)

# Check results agains maximum likelihood
m <- lm(y ~ x)
c(coef(m), sigma = sigma(m))

posterior_medians

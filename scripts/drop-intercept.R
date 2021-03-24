library(equatiomatic)
library(lme4)

m0 <- lmer (math ~ -1 + (1 | sch.id), data = hsb)
m1 <- lmer (math ~ 1 + (1 | sch.id), data = hsb)

mean(ranef(m0)$sch.id[ ,1])
fixef(m1)

# double check that mean of random effects for m1 is 0
mean(ranef(m1)$sch.id[ ,1])

preds <- merge(coef(m0)$sch.id, coef(m1)$sch.id, by = 0)

plot(`(Intercept).y` ~ `(Intercept).x`, preds)

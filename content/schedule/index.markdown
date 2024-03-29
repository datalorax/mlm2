---
title: Schedule
toc: true
---




## Course Books
Each of the below links to the full book, or where you can buy the full book. 
Icons in the schedule link to specific chapters.

{{< course-books >}}


 ## Week 1 
 {{< schedule >}}

{{< week "04-02" >}}
  {{< description "Introduction" "Introductions. Weekly schedule and topics. Fitting a basic model with lme4::lmer." >}}
  {{< wrap >}}
{{< slides "w1p1" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< assigned "assignments/#final-project" "Prop" >}}
{{< assigned "assignments/#final-project" "Final" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< readings "clark" "random_intercepts.html" "" >}}
{{< readings "gh" "https://canvas.uoregon.edu/files/10667584/download?download_frd=1" "12.1-12.4" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "https://youtu.be/F-pvKQ87dcM" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 2 
 {{< schedule >}}

{{< week "04-09" >}}
  {{< description "Basic data structuring issues and fitting models" "We will begin the day discussing the format lme4 expects the data to be in for fitting models. We'll fit a few models with the data already in this format. We'll then move to "messy" data in different formats and discussion moving them to the correct format. We will focus primarily on two issues: (a) moving data from a wider format to a longer format, and (b) joining data from different levels into a single dataset. Not that it is assumed this is mostly review. If it is not, additional readings will be asigned." >}}
  {{< wrap >}}
{{< slides "w2p1" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< assigned "homework-1" "hw1" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< readings "r4ds" "tidy-data.html" "12" >}}
{{< readings "r4ds" "relational-data.html" "13" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "https://youtu.be/dlE_kpoPih0" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 3 
 {{< schedule >}}

{{< week "04-16" >}}
  {{< description "Basic models, predictions, and visualizations" "Walking through how the basic two- and three-level models make predictions and visualizing the difference between these predictions and the observed data." >}}
  {{< wrap >}}
{{< slides "w3p1" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< readings "clark" "random_intercepts.html#standard-regression" "" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "https://youtu.be/0a2lS2tfvXc" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 4 
 {{< schedule >}}

{{< week "04-23" >}}
  {{< description "Intro to Gelman & Hill notation" "We review content from the previous course, review Homework 1, and introduce the Gelman & Hill notation for multilevel models." >}}
  {{< wrap >}}
{{< slides "w4p1" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< due "homework-1" "hw1" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< readings "clark" "extensions.html#residual-structure" "" >}}
{{< readings "sw" "https://stats.idre.ucla.edu/r/examples/alda/r-applied-longitudinal-data-analysis-ch-7/" "7" >}}
{{< readings "gh" "https://canvas.uoregon.edu/files/10667756/download?download_frd=1" "12.5-12.10" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "https://youtu.be/s2bsPii_I4I" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 5 
 {{< schedule >}}

{{< week "04-30" >}}
  {{< description "Variance-covariance matrices" "We will review Gelman & Hill notation and compare and contrast different residual variance-covariance specifications. Contrasting unstructured variance-covariance matrices with alternative specifications (e.g., independent, Toeplitz)" >}}
  {{< wrap >}}
{{< slides "w5p1" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< assigned "homework-2" "hw2" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< due "assignments/#final-project" "Prop" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< readings "clark" "extensions.html#residual-structure" "" >}}
{{< readings "sw" "https://stats.idre.ucla.edu/r/examples/alda/r-applied-longitudinal-data-analysis-ch-7/" "7" >}}
{{< readings "gh" "https://canvas.uoregon.edu/files/10667756/download?download_frd=1" "12.5-12.10" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "https://youtu.be/hupvgfxISL0" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 6 
 {{< schedule >}}

{{< week "05-07" >}}
  {{< description "Modeling Growth 1" "Thinking flexibly about time and modeling non-linear trends with polynomials basis expansion. We will also discuss data transformations (e.g., log, inverse)." >}}
  {{< wrap >}}
{{< slides "w6p1" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< readings "sw" "https://stats.idre.ucla.edu/r/examples/alda/r-applied-longitudinal-data-analysis-ch-4/" "NA" >}}
{{< readings "sw" "https://stats.idre.ucla.edu/r/examples/alda/r-applied-longitudinal-data-analysis-ch-5/" "NA" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "https://youtu.be/27zk2rwlQWU" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 7 
 {{< schedule >}}

{{< week "05-14" >}}
  {{< description "Introduction to Bayesian estimation" "Basic concepts in Bayesian estimation: prior and posterior distributions, MCMC sampling, model convergence. We will fit similar models to those fit previously in the course, but using the brms package for Bayesian inference." >}}
  {{< wrap >}}
{{< slides "w7p1" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< assigned "homework-3" "hw3" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< due "homework-2" "hw2" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< readings "clark2" "intro.html" "5" >}}
{{< readings "clark2" "intro.html" "14" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "https://youtu.be/Au4KTEtt57Y" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 8 
 {{< schedule >}}

{{< week "05-21" >}}
  {{< description "Bayesian estimation 2: Multilevel logistic regression" "Extending on the models we've learned previously to deal with dichotomous outcomes. We will also continue our discussion of Bayesian estimation and use Bayes to estimate thse models." >}}
  {{< wrap >}}
{{< slides "w8p1" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< readings "gh" "https://canvas.uoregon.edu/files/10667771/download?download_frd=1" "NA" >}}
{{< readings "gh" "https://canvas.uoregon.edu/files/10667780/download?download_frd=1" "NA" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "https://youtu.be/ScT7eD2Mp4k" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 9 
 {{< schedule >}}

{{< week "05-28" >}}
  {{< description "Bayesian estimation 3: Extending models, getting samples from the posterior, and computing post-hoc comparisons" "We fit several multilevel binomial logistic regression models using Bayesian estimation. We walk through two full examples, including data exploration to analysis to interpretation. This includes post-hoc comparisons computed using samples from the posterior distribution." >}}
  {{< wrap >}}
{{< slides "w9p1" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< due "homework-3" "hw3" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< readings "sw" "https://stats.idre.ucla.edu/r/examples/alda/r-applied-longitudinal-data-analysis-ch-6/" "" >}}
{{< readings "other" "https://www.sds.pub/nonlinearity.html" "6" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "https://youtu.be/YaLS2eqoUXs" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 10 
 {{< schedule >}}

{{< week "06-04" >}}
  {{< description "Non-nested models and other complexities" "We'll discuss missing data and cross-classified and multiple membership models. If time allows, we will also discuss how the multilevel binomial logistic model can be used to fit a 1PL item response theory model." >}}
  {{< wrap >}}
{{< slides "w10p1" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< readings "clark" "extensions.html" "NA" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "https://youtu.be/ezPNfJqKT04" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 11 
 {{< schedule >}}

{{< week "06-07" >}}
  {{< description "Finals Week" "Your final project is due before midnight on the 9th" >}}
  {{< wrap >}}
{{< slides "" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< due "assignments/#final-project" "Final" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< readings "NA" "NA" "NA" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}


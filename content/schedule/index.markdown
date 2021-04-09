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
{{< lecture "" >}}
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
{{< lecture "" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 4 
 {{< schedule >}}

{{< week "04-23" >}}
  {{< description "Variance-covariance matrices & intro to Gelman & Hill notation" "Contrasting unstructured variance-covariance matrices with alternative specifications (e.g., independent, Toeplitz). We will also discuss the Gelman & Hill notation for multilevel models and practice writing and interpreting model equations." >}}
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
{{< readings "sw" "" "7" >}}
{{< readings "gh" "https://canvas.uoregon.edu/files/10667756/download?download_frd=1" "12.5-12.10" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 5 
 {{< schedule >}}

{{< week "04-30" >}}
  {{< description "Modeling Growth 1" "Thinking flexibly about time and modeling non-linear trends with polynomials basis expansion. We will also discuss data transformations (e.g., log, inverse)." >}}
  {{< wrap >}}
{{< slides "" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< assigned "assignments" "hw2" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< due "assignments/#final-project" "Prop" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< readings "sw" "NA" "4" >}}
{{< readings "sw" "NA" "5" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 6 
 {{< schedule >}}

{{< week "05-07" >}}
  {{< description "Introduction to Bayesian estimation" "Basic concepts in Bayesian estimation: prior and posterior distributions, MCMC sampling, model convergence. We will fit similar models to those fit previously in the course, but using the brms package for Bayesian inference." >}}
  {{< wrap >}}
{{< slides "" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< readings "clark2" "intro.html" "NA" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 7 
 {{< schedule >}}

{{< week "05-14" >}}
  {{< description "Multilevel logistic regression" "Extending on the models we've learned previously to deal with dichotomous outcomes. We will also continue our discussion of Bayesian estimation and use Bayes to estimate thse models." >}}
  {{< wrap >}}
{{< slides "" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< assigned "assignments" "hw3" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< due "assignments" "hw2" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< readings "gh" "https://canvas.uoregon.edu/files/10667771/download?download_frd=1" "5" >}}
{{< readings "gh" "https://canvas.uoregon.edu/files/10667780/download?download_frd=1" "14" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 8 
 {{< schedule >}}

{{< week "05-21" >}}
  {{< description "Simulating data from multilevel models" "We will gain a deeper understanding of the models we fit throughout the term by generating new data assuming they follow the distributional assumptions of the given models. We will then tweak some of the data generating models and evauate how robust the multilevel model is to violations of these assumptions" >}}
  {{< wrap >}}
{{< slides "" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< readings "other" "https://bookdown.org/marklhc/notes/simulating-multilevel-data.html" "NA" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 9 
 {{< schedule >}}

{{< week "05-28" >}}
  {{< description "Modeling Growth 2" "Dealing with common complications in growth modeling: piecewise regression models, and evaluating differences in the slope pre/post" >}}
  {{< wrap >}}
{{< slides "" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< due "assignments" "hw3" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< readings "sw" "" "" >}}
{{< readings "other" "https://www.sds.pub/nonlinearity.html" "6" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "" >}}
{{< /wrap >}}
{{< /week >}}

{{< /schedule >}}
 ## Week 10 
 {{< schedule >}}

{{< week "06-04" >}}
  {{< description "Non-nested models and other complexities" "Handling data when it is not purely nested. We will illustrate how the multilevel model can be used to estimate the Rasch model (a special-case IRT model where item discriminations are fixed at 1.0). Beyond non-nested models, we will also discuss splines as an alternative way to handle non-linearity." >}}
  {{< wrap >}}
{{< slides "" >}}
{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}

{{< /wrap >}}
  {{< wrap >}}
{{< readings "clark" "extensions.html" "NA" >}}
{{< /wrap >}}
  {{< wrap >}}
{{< lecture "" >}}
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


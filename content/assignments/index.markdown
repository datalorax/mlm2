---
title: Assignments
toc: true
---


Participation in class is expected and will be scored at one point per class,
for a total of 10 points, which is 10% of your total grade. There will also
be three homework assignments at 15 points each (45 points), a final project proposal 
(5 points), and the final project itself (40 points), for 100 total points.

#### A note on deadlines
I would like to, as much a possible, stick to the deadlines below so we can go over them together as a group *after* everyone has submitted their assignment. However, **if you need additional time for any reason** please just send me a note letting me know. You do not need to justify why. I would just ask that you not attend class during the time we are going over the assignment (but please attend the rest of the class if you are able).

## Participation
Please turn in your script from the day's work to canvas after each class 
meeting. Very regularly this will include specific "challenges", and annotating
your code to note these would be helpful. Other time, I will ask you to follow
along with me, and you can turn in your script from this time.

## Homework
Each homework assignment is worth 15 points. Please do not turn in partial work. Instead, please ask for help and, if needed, an extension on the deadline. 

{{< bootstrap-table "table table-hover" >}}

| Lab|Date Assigned |Date Due      |Topic                                                                        |
|---:|:-------------|:-------------|:----------------------------------------------------------------------------|
|   1|Fri, April 09 |Fri, April 23 |[Basic multilevel modeling with R](../homework-1)                            |
|   2|Fri, April 30 |Fri, May 14   |[Growth models and variance-covariance matrices](../homework-2)              |
|   3|Fri, May 14   |Fri, May 28   |[Bayesian estimation & multilevel logistic regression models](../homework-3) |

{{< /bootstrap-table >}}


## Final Project

A **proposal** for the final project is due Friday, April 30th, before midnight.
The proposal should have the following elements:

* Data source identified, which must be shareable with me
* Research Question(s) identified (no more than three), which must be 
  addressable through a multilevel model
* A description of any data processing that must occur before you can fit the 
  given model
* Your current status with the project (e.g., challenges you are facing,
  what steps still need to occur, feasibility of finishing, etc.)
  
The **final product** includes two parts: (a) an R script of your analysis and
all plots, and (b) a writeup of the results of your analysis which should 
largely match APA style. You will also need to submit the data you are 
analyzing so I can run your script locally.

### R Script (20 points)
The R script you submit for your final project should be a .R or .Rmd file. 
It should include any necessary data pre-processing steps needed
to complete the analysis (e.g., moving the data from wide to long). You will 
not be graded on the data preparation portion of the script, but I will give 
you feedback.

We will discuss this more in class, but please annotate your script clearly
to indicate what is happening in each section (e.g., data preparation,
exploratory plots, descriptive analyses, preliminary analyses, primary
analyses, model-based plots, etc.). I will score your R script based on the
following criteria:

* Reproducibility: 2 points
  + I should be able to run your script without errors with little effort. The
    results on the analysis I run locally should match those that you report
    in the writeup. Note, if you are using simulation or anything relating to
    random processes, it will be important to set a seed to ensure 
    reproducibility.

* Exploratory and descriptive analyses: 3 points
  + One of the most important components of analysis work generally is knowing
    your data well. The exploratory and descriptive analyses will inform you
    on whether you data meet your model assumptions and, if not, what 
    data transformations or amendments to your model should be made. Note that
    it is acceptable to identify areas where the data may not meet the model 
    assumptions, note them, and move on. In other words, you do not have to 
    address everything you find, but they should be noted in the limitations
    section of your writeup.

+ Analysis: 10 points
  + Depending on your specific situation, you may engage in a model building
    process (starting with a baseline model and adding predictors) or you may
    have a specific model in mind a priori that you can directly estimate. In
    either case, the model should map directly to the research question and be
    properly specified. There are often judgments that must be made in your 
    analysis and your decisions should be clear from the evidence. You can
    defend these judgments in your writeup, but failure to properly evaluate
    important decision points (e.g., whether a variable should randomly 
    vary or not) without theoretical justification in the writeup will result 
    in a loss of points.
    
+ Plots: 5 points
  + You are required to create one plot **from your model** that communicates
    the coefficients, model predictions, or other features. You are welcome
    to include more than one, but at least one plot should be created.

### Writeup (20 points)
You will develop *very* short APA writeup of your model results, which **should
not exceed five pages**, double-spaced, with standard 1 inch margins and 12pt
Times New Roman font. Manuscripts that exceed the five page limit will have
five points removed immediately. As indicated below, you will be required to 
include at least one figure and at least one table, which along with references,
will not count against the page limit. The manuscript should include a (very brief) 
introduction, methods, results, and a brief discussion including the 
limitations. As the points below and suggested page limits for each section 
indicate, the majority of the space should be devoted to the methods and 
results. The writeup should include the following components:

* Introduction: 2 points
  + Suggested length - one paragraph, 0.5 page max. 
  + Provide a very brief background on the purpose of the study.
* Research Question(s): 2 point
  + Suggested length - one to three sentences.
  + At least one and no more than three research questions to be addressed in
    the writeup, which should be addressable from the data and within a 
    multilevel modeling framework.
* Method: 5 points
  + Suggested length - 1.5 to 2 pages.
  + Describe where the data came from (one paragraph)
  + Describe your data preparation (e.g., handling missing data, transformations)
  + Describe your analytic sample, **complete with a table of descriptive 
    statistics**
  + Describe the model you plan to fit and/or your model building process and 
    why it is appropriate for your sample and research question(s).
  + You may optionally include and discuss any exploratory plots here as well
* Results: 5 points
  + Suggested length - 1.5 to 2 pages
  + If appropriate, discuss the results of your model building process and your
    model comparisons.
  + Include and discuss at least one table of your model results. Make sure you
    link specific coefficients or model results to your research question.
  + Include at least one plot from your model that communicates your findings
    (e.g., perhaps comparing the model predictions to the raw data, or the
    model predictions for two or more groups)
* Discussion: 3 points
  + Suggested length - 0.5 to 1 page
  + Briefly note any limitations
  + Very briefly mention how your findings link to the extant literature
* General style: 3 points
  + The manuscript should generally be free of errors and read similarly to a
    manuscript that has been submitted for peer review.
  + APA formatting should be used, with a formatted bibliography listing all 
    references to the extant literature.

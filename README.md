# PSYC 652 - Jonathan King

|Property|Value|
|----|---|
|School | University of Maryland, College Park|
|Program| MPS in IO Psychology|
|Course| PSYC 652|
|Professor| Dr. J. Peter Leeds|
|Student| Jonathan King|

This repository contains R code written for the book exercises, homework, and case studies for the UMD IO MPS.

**To execute simply run:** `./run.sh <name of script>`

Example: `./run.sh book_exercises_3`

## Repo Structure
1. Dockerfile - contains the R docker file based on the [official R dockerfile](https://hub.docker.com/_/r-base) created by Rocker
2. run.sh - a build file to rebuild the
3. data_sets - contains data sets from ELMs related to exercises or class
4. documents - contains markdown files for book exercises and homework
5. output - output from scripts including log files and graphs
6. scripts - R files with data manipulations, tests, and regressions


##  Requirements
- Linux (tested on Amazon Linux 2)
- Docker version 20.10.25, build b82b9f3
- data set filenames have spaces removed
   - script to clean data filenames `for file in *.sav; do   mv -- "$file" "${file// /_}"; done`



## Useful Documentation
### R Reference
1. [Tidyverse](https://uomresearchit.github.io/r-tidyverse-intro/04-dplyr/)
2. [Haven](https://haven.tidyverse.org/)
3. [Tidyverse #2](https://dplyr.tidyverse.org/reference/mutate.html)


### Other Links
1. [This repo](https://github.com/sigfriedjk/psyc-652-winter2023-king/tree/master)
2. [Markdown Cheatsheet](https://www.markdownguide.org/cheat-sheet/)
3. https://www.geeksforgeeks.org/how-to-create-categorical-variables-in-r/
4. https://www.r-bloggers.com/2021/06/how-to-find-z-score-in-r-easy-calculation-quick-guide/
5. https://sparkbyexamples.com/r-programming/r-count-frequency-of-all-unique-values-in-vector/
6. https://statsandr.com/blog/descriptive-statistics-in-r/
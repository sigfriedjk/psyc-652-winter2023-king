# PSYC 652 - Jonathan King

|Property|Value|
|----|---|
|School | University of Maryland, College Park|
|Program| MPS in IO Psychology|
|Course| PSYC 652|
|Professor| Dr. Jack Leeds|
|Student| Jonathan King|

This repository contains R code written for the book exercises, homework, and case studies for the UMD IO MPS.

**To execute simply run:** `./run.sh`

## Repo Structure
1. Dockerfile - contains the R docker file based on the [official R dockerfile](https://hub.docker.com/_/r-base) created by Rocker
2. run.sh - a build file to rebuild the


##  Requirements
- Linux (tested on Amazon Linux 2)
- Docker version 20.10.25, build b82b9f3


## Useful R Documentation
1. [Tidyverse](https://uomresearchit.github.io/r-tidyverse-intro/04-dplyr/)
2. [Haven](https://haven.tidyverse.org/)


## Other Useful Links
1. [Markdown Cheatsheet](https://www.markdownguide.org/cheat-sheet/)2. 

## Future Notes
1. Convert dockerfile to build from the (rocker version)[https://github.com/rocker-org/rocker-versioned2] that already contains tidyverse
2. Updated Dockerfile to mount a local directory instead of building with each run
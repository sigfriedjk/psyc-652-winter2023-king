FROM r-base
RUN R -e "install.packages('haven',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidyverse',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('car',dependencies=TRUE, repos='http://cran.rstudio.com/')"
WORKDIR /usr/local/src/myscripts
CMD ["bash", "main.sh"]
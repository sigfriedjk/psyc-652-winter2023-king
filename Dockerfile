FROM r-base
RUN R -e "install.packages('haven',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidyverse',dependencies=TRUE, repos='http://cran.rstudio.com/')"
COPY ./scripts /usr/local/src/myscripts
COPY ./data_sets /usr/local/src/myscripts/data_sets
WORKDIR /usr/local/src/myscripts
CMD ["Rscript", "main.R"]
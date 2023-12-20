FROM r-base
RUN R -e "install.packages('haven',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidyverse',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN apt-get update && apt-get -y install cmake openssl libcurl4-openssl-dev
RUN R -e "options(warn=2); install.packages('car',dependencies=TRUE, repos='http://cran.rstudio.com/')"
#RUN R -e "options(warn=2); install.packages('effsize',dependencies=TRUE, repos='http://cran.rstudio.com/')"
WORKDIR /usr/local/src/myscripts
CMD ["bash", "main.sh"]
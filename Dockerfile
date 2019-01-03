FROM r-base:latest

RUN apt-get update && apt-get install -y \
    sudo \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libxt-dev \
    libssl-dev \
    libxml2 \
    libxml2-dev

RUN wget --no-verbose https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/VERSION -O "version.txt" && \
    VERSION=$(cat version.txt)  && \
    wget --no-verbose "https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/shiny-server-$VERSION-amd64.deb" -O ss-latest.deb && \
    gdebi -n ss-latest.deb && \
    rm -f version.txt ss-latest.deb

RUN R -e "install.packages(c('shiny', 'shinydashboard'), repos='http://cran.rstudio.com/')"
RUN R -e "install.packages(c('Rcpp','dplyr', 'DT', 'shinyWidgets', 'tools', 'reshape2', 'plotly', 'tidyverse', 'dygraphs', 'highcharter','crosstalk'), repos='http://cran.rstudio.com/')"


COPY shiny-server.conf  /etc/shiny-server/shiny-server.conf
COPY  /app /srv/shiny-server/

EXPOSE 80

COPY shiny-server.sh /usr/bin/shiny-server.sh

CMD ["/usr/bin/shiny-server.sh"]
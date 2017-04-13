#FROM debian:8
FROM hadoop-spark-master:latest

# Add R list
RUN echo 'deb http://cloud.r-project.org/bin/linux/debian jessie-cran3/' | tee -a /etc/apt/sources.list && \
    apt-key adv --keyserver keys.gnupg.net --recv-key 6212B7B7931C4BB16280BA1306F90DE5381BA480
RUN apt-get update && apt-get -y install r-base r-base-dev wget gdebi-core locales net-tools vim lsof libssl-dev libcurl4-openssl-dev

RUN R -e "install.packages('sparklyr', repos='http://cran.rstudio.com/')"
RUN R -e "Sys.setenv(SPARK_HOME='/opt/spark-2.0.1')"

WORKDIR /tmp
RUN wget https://download2.rstudio.org/rstudio-server-1.0.136-amd64.deb && \ 
    gdebi -n rstudio-server-1.0.136-amd64.deb

RUN addgroup rstudio
RUN useradd -m -s /bin/bash -g rstudio rstudio -p $(openssl passwd -1 123)

# Expose port
EXPOSE 8787

ADD rstudio-server-entrypoint.sh /rstudio-server-entrypoint.sh
RUN chmod +x /rstudio-server-entrypoint.sh

ENTRYPOINT ["/rstudio-server-entrypoint.sh"]

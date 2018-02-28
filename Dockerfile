FROM tomcat:8.5-jre8

RUN apt-get -y update  && \
    apt-get -y install libreoffice imagemagick swftools liblog4j1.2-java libgnumail-java ant curl unzip sudo tar libreoffice-common

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*  && \
    rm -rf /tmp/*  && \
    rm -rf $CATALINA_HOME/webapps/*

RUN curl -L https://jaist.dl.sourceforge.net/project/openkm/6.3.4/OpenKM-6.3.4.zip -o /usr/local/openkm.zip && \
    unzip /usr/local/openkm.zip -d $CATALINA_HOME/webapps/ && \
    rm /usr/local/openkm.zip

RUN mkdir -p /OpenKM
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME $CATALINA_HOME/webapps/repository
CMD ["catalina.sh", "run"]

EXPOSE 8080 2002

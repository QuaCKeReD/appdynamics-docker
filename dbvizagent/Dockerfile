FROM ubuntu:kinetic-20220830

ARG ZIP_PKG

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y unzip openjdk-11-jre \
  && apt-get clean autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN export JAVA_HOME PATH

ENV DB_AGENT_HOME /opt/appdynamics

COPY $ZIP_PKG /tmp/$ZIP_PKG

RUN mkdir -p $DB_AGENT_HOME \
  && unzip -oq /tmp/$ZIP_PKG -d $DB_AGENT_HOME \
  && rm /tmp/$ZIP_PKG

WORKDIR $DB_AGENT_HOME

COPY startup.sh .
RUN chmod +x startup.sh

CMD "./startup.sh"

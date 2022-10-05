FROM ubuntu:22.04

ARG ZIP_PKG 

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y unzip bash gawk sed grep bc coreutils openjdk-11-jre \
  && apt-get install -y apt-utils \
  && apt-get install -y iproute2 \
  && apt-get install -y procps \
  && apt-get install -y sysstat \
  && apt-get clean autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENV JAVA_HOME /usr/lib/jvm/openjdk-11-jdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN export JAVA_HOME PATH

ENV MACHINE_AGENT_HOME /opt/appdynamics

COPY $ZIP_PKG /tmp/$ZIP_PKG

RUN mkdir -p $MACHINE_AGENT_HOME \
  && unzip -oq /tmp/$ZIP_PKG -d $MACHINE_AGENT_HOME/ \
  && rm /tmp/$ZIP_PKG

WORKDIR $MACHINE_AGENT_HOME

COPY startup.sh ./startup.sh 
RUN chmod +x ./startup.sh

CMD "./startup.sh"

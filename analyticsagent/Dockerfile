FROM ubuntu:kinetic

ARG ZIP_PKG 

RUN apt-get update \
  && apt-get install -y unzip bash gawk sed grep bc coreutils openjdk-11-jre \
  && apt-get clean autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENV JAVA_HOME /usr/lib/jvm/openjdk-11-jdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN export JAVA_HOME PATH

ENV AGENT_HOME /opt/appdynamics

COPY $ZIP_PKG /tmp/$ZIP_PKG

RUN mkdir -p $AGENT_HOME \
  && unzip -oq /tmp/$ZIP_PKG -d $AGENT_HOME \
  && rm /tmp/$ZIP_PKG

ENV ANALYTICS_AGENT_HOME /opt/appdynamics/analytics-agent

COPY updateAnalyticsAgentConfig.sh /opt/appdynamics/updateAnalyticsAgentConfig.sh
RUN  chmod +x /opt/appdynamics/updateAnalyticsAgentConfig.sh

COPY startup.sh /opt/appdynamics/startup.sh
RUN chmod +x /opt/appdynamics/startup.sh

RUN chgrp -R 0 /opt \
  && chmod -R g=u /opt

EXPOSE 9090

CMD "/opt/appdynamics/startup.sh"

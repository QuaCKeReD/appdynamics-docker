FROM ubuntu:kinetic-20220830

ARG ZIP_PKG 

RUN apt-get update \
  && apt-get install -y unzip \
  && apt-get clean autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENV APP_AGENT_HOME /opt/appdynamics

COPY $ZIP_PKG /tmp/$ZIP_PKG

RUN mkdir -p $APP_AGENT_HOME \
  && unzip -oq /tmp/$ZIP_PKG -d $APP_AGENT_HOME \
  && rm /tmp/$ZIP_PKG

WORKDIR $APP_AGENT_HOME

CMD ["echo" "Delivering the Java Agent. Copy the contents of /opt/appdynamics to the application container"]

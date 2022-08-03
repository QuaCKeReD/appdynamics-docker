FROM ubuntu:22.04

ARG ZIP_PKG

RUN groupadd -r appd-netviz \
  && useradd -r -g appd-netviz appd-netviz

RUN apt-get update \
  && apt-get install -y \
  net-tools \
  tcpdump \
  libcap2-bin \
  curl  \
  unzip   \
  ssh-client \
  binutils \
  build-essential 

ENV NETVIZ_AGENT_HOME /opt/appdynamics

WORKDIR ${NETVIZ_AGENT_HOME}

COPY $ZIP_PKG .

# run the agent install script and disable netlib
RUN unzip $ZIP_PKG -d ${NETVIZ_AGENT_HOME} \
  && ./install.sh \
  && sed -i -e "s|enable_netlib = 1|enable_netlib = 0|g" ./conf/agent_config.lua \
  && sed -i -e "s|WEBSERVICE_IP=.*|WEBSERVICE_IP=\"0.0.0.0\"|g" ./conf/agent_config.lua \
  && rm -rf $ZIP_PKG

RUN chown -R appd-netviz:appd-netviz /opt/appdynamics
RUN setcap cap_net_raw=eip /opt/appdynamics/bin/appd-netagent
USER appd-netviz

EXPOSE 3892

CMD  ./bin/appd-netagent -c ./conf -l ./logs -r ./run

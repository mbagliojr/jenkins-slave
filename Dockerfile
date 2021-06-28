FROM exoplatform/ubuntu:20.04
MAINTAINER mbagliojr

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install openjdk-14-jdk-headless && rm -rf /var/lib/apt

#Install git as well
RUN apt-get update && apt-get install -y git

RUN apt-get install -y make
RUN apt-get install -y libltdl7
RUN wget -q https://github.com/docker/fig/releases/download/1.0.1/fig-Linux-x86_64 -O /usr/local/bin/fig && chmod +x /usr/local/bin/fig
RUN wget -q https://github.com/docker/compose/releases/download/1.16.1/docker-compose-Linux-x86_64 -O /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
RUN wget -q https://github.com/harbur/captain/releases/download/v0.7.0/captain-Linux-x86_64 -O /usr/local/bin/captain && chmod +x /usr/local/bin/captain

COPY agent.jar swarm-client-3.4.jar

CMD java -jar swarm-client-3.4.jar $EXTRA_PARAMS #-jnlpUrl http://$MASTER_PORT_8080_TCP_ADDR:$MASTER_PORT_8080_TCP_PORT $EXTRA_PARAMS

FROM centos:7.2.1511

MAINTAINER skuenzli@qualimente.com

ADD https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest /usr/local/bin/ecs-cli
RUN chmod 755 /usr/local/bin/ecs-cli

VOLUME /root/.ecs/config
VOLUME /work
WORKDIR /work
ENTRYPOINT ["/usr/local/bin/ecs-cli"]

ADD Dockerfile /Dockerfile

FROM ubuntu:22.04 AS base

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Irkutsk
## ENV TZ=Europe/Moscow

RUN apt-get update && apt-get install -yq tzdata 

RUN apt-get install -yq mc systemd vim

## Install and setup postgres
FROM base 

RUN apt-get install -yq postgresql-14

RUN systemctl enable postgresql

COPY docker-services.sh /

## ENTRYPOINT [ "/etc/init.d/postgresql", "start" ]
CMD ["bash", "/docker-services.sh"]

FROM debian:12 AS base

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Irkutsk

COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -yq tzdata 

RUN apt-get install -yq mc vim

## Install and setup postgres
FROM base AS sql

RUN apt-get install -yq postgresql-15

## RUN systemctl enable postgresql

FROM sql AS initscripts

COPY mycomps.sql /

COPY createdb.sh /

COPY docker-services.sh /

FROM initscripts AS dbinit

RUN bash /createdb.sh

CMD ["bash", "/docker-services.sh"]
# CMD ["bash"]

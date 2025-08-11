FROM ubuntu:22.04 AS base

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Irkutsk
## ENV TZ=Europe/Moscow

RUN apt-get update && apt-get install -yq tzdata 

RUN apt-get install -yq mc vim

## Install and setup postgres
FROM base AS sql

RUN apt-get install -yq postgresql-14

## RUN systemctl enable postgresql

FROM sql AS initscripts

COPY create_user.sql /

COPY createuser.sh /

COPY docker-services.sh /

FROM initscripts AS dbinit

RUN bash /createuser.sh

COPY postgresql.conf pg_hba.conf /etc/postgresql/14/main/

RUN chown postgres:postgres /etc/postgresql/14/main/pg_hba.conf

RUN chown postgres:postgres /etc/postgresql/14/main/postgresql.conf

EXPOSE 5432

CMD ["bash", "/docker-services.sh"]

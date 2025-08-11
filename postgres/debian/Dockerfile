FROM debian:12 AS base

ARG DEBIAN_FRONTEND=noninteractive

# Настройка временной зоны
ENV TZ=Asia/Irkutsk

# Установка sources.list
COPY sources.list /etc/apt/sources.list

# Установка tzdata
RUN apt-get update && apt-get install -yq tzdata mc vim

## Install and setup postgres
FROM base AS sql

RUN apt-get install -yq postgresql-15

FROM sql AS initscripts

COPY create_user.sql createuser.sh docker-services.sh /

FROM initscripts AS dbinit

RUN bash /createuser.sh

COPY postgresql.conf pg_hba.conf /etc/postgresql/15/main/

RUN chown postgres:postgres /etc/postgresql/15/main/pg_hba.conf

RUN chown postgres:postgres /etc/postgresql/15/main/postgresql.conf

EXPOSE 5432
CMD ["bash", "/docker-services.sh"]
# CMD ["bash"]

service postgresql start
su postgres -c "createdb mycomps && psql mycomps < /mycomps.sql"
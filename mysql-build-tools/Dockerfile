FROM mysql/mysql-server:5.7

ENV MYSQL_DATABASE studentdb

COPY ./mysql-scripts/ /docker-entrypoint-initdb.d/

FROM debian:buster

RUN apt-get update -y && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY db_init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["/usr/bin/mysqld_safe"]

FROM mysql:8.0.33

COPY ./my.cnf /etc/mysql/conf.d/my.cnf

ENV MYSQL_DATABASE=mydatabaser
ENV MYSQL_ROOT_PASSWORD=mysecret


# ENV MYSQL_USER=myuser
# ENV MYSQL_PASSWORD=mypassword

# docker run
#     --name mysql-container
#     -e MYSQL_ROOT_PASSWORD=mysecret
#     -e MYSQL_DATABASE=mydatabase
#     -e MYSQL_USER=myuser
#     -e MYSQL_PASSWORD=mypassword
#     -p 3306:3306
#     -d idbdyoung/mysql

# docker run -p 3306:3306 -v mysql-data:/var/lib/mysql -d idbdyoung/mysql

# docker exec -it <container_id_or_name> /bin/bash

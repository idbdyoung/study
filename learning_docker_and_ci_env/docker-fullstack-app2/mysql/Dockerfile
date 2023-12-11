FROM mysql:8.0.33

COPY ./my.cnf /etc/mysql/conf.d/my.cnf

# 백업된 SQL 파일을 이미지에 추가합니다.
ADD ./backup.sql /docker-entrypoint-initdb.d/backup.sql

#환경변수 "=" 간에 띄워쓰기 하면 안됨
ENV MYSQL_DATABASE=yogacloud
ENV MYSQL_ROOT_PASSWORD=yogacloud-password

# - build
# docker build -t idbdyoung/mysql ./

# - run
# docker run -p 3306:3306 --name mysql-container -v mysql-data:/var/lib/mysql -d idbdyoung/mysql
# (도커 실행시에 환경변수를 설정하는 방법)
# docker run
#     --name mysql-container
#     -e MYSQL_ROOT_PASSWORD=mysecret
#     -e MYSQL_DATABASE=mydatabase
#     -e MYSQL_USER=myuser
#     -e MYSQL_PASSWORD=mypassword
#     -p 3306:3306
#     -d idbdyoung/mysql


# - backup
# docker exec mysql-container mysqldump -u root -pyogacloud-password yogacloud > "backup_$(date -u +%Y_%m_%d_%H%M%S).sql"
# -p (비밀번호를 적을 때에는 -p와 비밀번호를 띄워쓰지 않으며 비밀번호 자체를 명령어에서 뺴고 나중에 따로 입력하는게 보안상으로 좋다)
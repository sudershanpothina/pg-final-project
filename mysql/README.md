```
docker run --name=mysql1 -p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
-v $(pwd):/docker-entrypoint-initdb.d/  \ # script location
-d mysql/mysql-server:latest
```
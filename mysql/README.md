```
docker run --name=mysql1 -p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
-v $(pwd):/docker-entrypoint-initdb.d/  -d mysql/mysql-server:latest # script location  
```

SET ENVIRONMENT values
MYSQL_HOST
MYSQL_DB
MYSQL_USERNAME
MYSQL_PASSWORD
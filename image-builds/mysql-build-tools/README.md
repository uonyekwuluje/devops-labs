# MySQL Build Image with Data
MySQL Tags:  5.5, 5.6, 5.7, 8.0
Current: 5.7

## Build Image
Run the command below to build the image
```
docker build -t mysql57-data-image .
```

## List Image
List the images
```
docker image ls
>>
REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
mysql57-data-image   latest              36e91c2312b4        17 seconds ago      360MB
mysql/mysql-server   5.7                 a9dda627da1f        7 weeks ago         360MB
```

## Test Image
Create a container and test the image
```
docker run -d -p 3308:3306 --name uctestmysql -e MYSQL_ROOT_PASSWORD=newpassword mysql57-data-image
docker exec -it uctestmysql bash
```

In The Container, Verify
```
bash-4.2# mysql -u root -p'newpassword'
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 4
Server version: 5.7.32 MySQL Community Server (GPL)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| studentdb          |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use studentdb
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+------------------------+
| Tables_in_studentdb    |
+------------------------+
| student_attendance_tbl |
+------------------------+
1 row in set (0.00 sec)

mysql> select * from student_attendance_tbl;
+----------------+---------------+---------------+---------------+
| student_regnum | student_fname | student_lname | student_grade |
+----------------+---------------+---------------+---------------+
| stud-avng-001  | Anthony       | Stark         | Seventh Grade |
| stud-avng-002  | Natasha       | Romanov       | Second Grade  |
| stud-avng-003  | Mark          | Rafallo       | First Grade   |
| stud-avng-004  | Steven        | Strange       | Third Grade   |
| stud-avng-005  | Steve         | Rogers        | Fourth Grade  |
| stud-avng-006  | Francis       | Barton        | Nineth Grade  |
| stud-avng-007  | Paul          | Bethany       | First Grade   |
| stud-avng-008  | Christopher   | Helmsworth    | Second Grade  |
+----------------+---------------+---------------+---------------+
8 rows in set (0.00 sec)

mysql> \q
Bye
bash-4.2# exit
exit
```

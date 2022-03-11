# How to start up Docker 🐳
## Table of Contents
1. [Modules 2-3](#primarily-towards-modules-2-3)
2. [Modules 4-5](#primarily-towards-modules-4-5)
3. [Modules 6,8](#primarily-towards-modules-68)
4. [Project1](#primarily-towards-project1)

## Primarily towards Modules 2-3
1. Open terminal and type: ```open -a docker```
2. Open terminal and cd into ```cd /Users/247jblock/OneDrive\ -\ University\ of\ Missouri/SP22/INFOTC\ 3380/Docker/it-3380-dev-env``` folder
3. In terminal (Mac) run: ```docker-compose up -d```
4. Log into mysql-container in Docker: ```docker exec -it mysql-container bash```
5. Log into MySQL Server varying on usernaming and password.
6. Once finished, ```docker-compose down```

## Primarily towards Modules 4-5
1. Open terminal and type ```open -a docker```
2. Open terminal and cd into ```cd /Users/247jblock/OneDrive\ -\ University\ of\ Missouri/SP22/INFOTC\ 3380/Docker/it-3380-dev-env``` folder
3. In terminal (Mac) run: ```docker-compose up -d```
### Load the Database (First Time Setup)
3. ```docker exec -it mongo-container bash```
4. ```cd ~/mongo-files/```
5. ```ls``` to ensure needed files are present/copied
6. ```mongoimport --db module4 --collection stocks --drop --file sp500-stocks.json --jsonArray``` to create data base named module4 and load data from files.
7. ```mongoimport --db module4 --collection zips --drop --file zips.json --jsonArray``` to create data base named module4 and load data from files.
#### Log into the Mongo Server
8. ```docker exec -it mongo-container bash```
9. ```mongo```
10. ```show dbs```
11. ```use module4```
12. ```show collections```
13. ```db.zips.findOne();```
14. ```db.stocks.findOne();```

## Primarily towards Modules 6,8
1. Open terminal and type ```open -a docker```
2. Open terminal and cd into ```cd /Users/247jblock/OneDrive\ -\ University\ of\ Missouri/SP22/INFOTC\ 3380/Docker/it-3380-dev-env``` folder
3. In terminal (Mac) run: ```docker-compose up -d```
4. Close terminal, then open a new session
### Load the Database (First Time Setup)
5. Open terminal and cd into ```cd /Users/247jblock/OneDrive\ -\ University\ of\ Missouri/SP22/INFOTC\ 3380/Docker/sql``` folder
6. ```docker cp classicmodels.sql mysql-container:/root/sql-files```
7. Close terminal, then open new session and ```docker exec -it mysql-container bash```
8. ```cd ~/sql-files/```
9. ```mysql -u root -p```
10. ```source ~/sql-files/classicmodels.sql```
#### Log into the MySQL Server
11. ```docker exec -it mysql-container bash```
12. ```mysql -u root -p```
13. ```SHOW databases;```
14. ```USE classicmodels;```
15. ```SHOW tables;```
16. ```DESCRIBE orders;```

## Primarily towards Project1
1. Open terminal and type ```open -a docker```
2. Open terminal and cd into ```cd /Users/247jblock/OneDrive\ -\ University\ of\ Missouri/SP22/INFOTC\ 3380/Docker/it-3380-dev-env``` folder
3. In terminal (Mac) run: ```docker-compose up -d```
4. Close terminal, then open a new session
### Load the MySQL Database (First Time Setup)
5. Open terminal and cd into ```cd /Users/247jblock/OneDrive\ -\ University\ of\ Missouri/SP22/INFOTC\ 3380/Docker/sql``` folder
6. ```docker cp employeesDB mysql-container:/root/sql-files```
7. Close terminal, then open new session and ```docker exec -it mysql-container bash```
8. ```cd ~/sql-files/```
9. ```cd ~/sql-files/employeesDB/```
10. ```mysql -u root -p```
11. ```source ~/sql-files/employeesDB/employees.sql```
#### Log into the MySQL Server
12. ```docker exec -it mysql-container bash```
13. ```mysql -u root -p```
14. ```SHOW databases;```
15. ```USE employees;```
16. ```SHOW tables;```
17. ```DESCRIBE orders;```
### Load the Database (First Time Setup)
18. ```docker exec -it mongo-container bash```
19. ```cd ~/mongo-files/```
20. ```ls``` to ensure needed files are present/copied
21. Use the following commands to create a database named classicmodels and load the data from the json files into their respective collections. Type the following commands:
   * ```mongoimport --db classicmodels --collection customers --drop --file customers.json --jsonArray```
   * ```mongoimport --db classicmodels --collection orders --drop --file orders.json --jsonArray```
   * ```mongoimport --db classicmodels --collection products --drop --file products.json --jsonArray```
   * ```mongoimport --db classicmodels --collection employees --drop --file employees.json --jsonArray```

22. Close terminal session
#### Log into the Mongo Server
23. ```docker exec -it mongo-container bash```
24. ```mongo```
25. ```show dbs```
26. ```use classicmodels```
27. ```show collections```
28. ```db.orders.findOne();```
29. ```db.customers.findOne();```

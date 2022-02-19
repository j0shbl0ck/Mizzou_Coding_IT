# How to start up Docker 🐳

## Primarily towards Modules 2-3
1. Open terminal and type: ```open -a docker```
2. Open terminal and cd into ```cd /Users/247jblock/OneDrive\ -\ University\ of\ Missouri/SP22/INFOTC\ 3380/Docker/it-3380-dev-env``` folder
3. In terminal (Mac) run: ```docker-compose up -d```
4. Log into mysql-container in Docker: ```docker exec -it mysql-container bash```
5. Log into MySQL Server varying on usernaming and password.
6. Once finished, ```docker-compose down```

## Primarily towards Modules 4-
1. Open terminal and type ```open -a docker```
2. Open terminal and cd into ```cd /Users/247jblock/OneDrive\ -\ University\ of\ Missouri/SP22/INFOTC\ 3380/Docker/it-3380-dev-env``` folder
3. In terminal (Mac) run: ```docker-compose up -d```
### Load the Database (First Time Setup)
3. ```docker exec -it mongo-container bash```
4. ```cd ~/mongo-files/```
5. ```ls``` to ensure needed files are present/copied
6. ```mongoimport --db module4 --collection stocks --drop --file sp500-stocks.json --jsonArray``` to create data base named module4 and load data from files.
7. ```mongoimport --db module4 --collection zips --drop --file zips.json --jsonArray``` to create data base named module4 and load data from files.
### Log into the Mongo Server
8. ```docker exec -it mongo-container bash```
9. ```mongo```
10. ```show dbs```
11. ```use module4```
12. ```show collections```
13. ```db.zips.findOne();```
14. ```db.stocks.findOne();```
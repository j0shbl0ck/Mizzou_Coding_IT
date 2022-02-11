# Help in starting up Docker
## Primarily towards Modules 2-3

1. Open terminal and type: ```open -a docker```
2. Open terminal and cd into it-3380-dev-env folder
3. In terminal (Mac) run: ```docker-compose up -d```
4. Log into mysql-container in Docker: ```docker exec -it mysql-container bash```
5. Log into MySQL Server varying on usernaming and password.

## Primarily towards Modules 4-
1. Open terminal and type ```open -a docker```
2. Open terminal and cd into it-3380-dev-env folder
3. ```docker exec -it mongo-container bash```
4. ```cd ~/mongo-files/```
5. ```ls``` to ensure needed files are present/copied
6. ```mongoimport --db module4 --collection stocks --drop --file sp500-stocks.json --jsonArray```
7. ```mongoimport --db module4 --collection zips --drop --file zips.json --jsonArray```

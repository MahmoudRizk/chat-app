# README

## System Info

* Ruby version: 3.3.4
* Rails version: Rails 7.1.3.4
* Database version: MySQL 9.0.0
* Docker version: 25.0.4
* Docker compose version: 1.29.2

## Run using Docker 
1. Create .env file under the root directory with env variables mentioned in .env.example where its values can be copeid 
to the .env file
2. Run docker compose ```sudo COMPOSE_PROJECT_NAME=chat-app docker-compose -f 'docker-compose.yml' --env-file .env up```


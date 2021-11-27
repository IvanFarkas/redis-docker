# Docker Compose V2 - https://docs.docker.com/compose/cli-command/
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.2.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
docker compose version

mkdir ${HOME}/docker/redis/data -p
mkdir ${HOME}/docker/redisinsight/data -p

sudo chmod 777 ${HOME}/docker/redis/data
sudo chmod 777 ${HOME}/docker/redisinsight/data

cd ~/redis

# Redis db using Docker - https://in4.io/ready-in-a-jiffy-redis

# Docker commands to build the redis image
docker compose build
docker network create backend
docker compose -p dev up -d

# redis-cli
docker container exec -it redis redis-cli
# AUTH <username> <password>
AUTH default admin
ping
#  PONG

# Redis Commands
# List all keys
KEYS *

# Delete all the keys of the currently selected DB
FLUSHDB

# Delete all the keys of all the existing databases
FLUSHALL

# Get config settings - CONFIG GET <CONFIG_SETTING_NAME>
CONFIG GET requirepass

# set value in key
SET key value

# get value in key
GET key

# RedisInsight - http://localhost:8001
# name of the redis container
Host : redis
Port: 6379
# name of the redis database
Name: dev
Username: default
# password set for requirepass AUTH
Password: admin

# Docker Commands
# docker compose stop redis
docker container stop redis
docker container start redis

# Remove the docker container
# docker compose rm redis
docker container rm redis

# Destroy stack
docker compose -p dev down

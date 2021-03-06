#!/bin/sh

DATA=${CFP_DATA:="$PWD/data"}

# Global cleanup
if [ $(docker ps -aq | wc -l) -gt 0 ]
then
  echo "Removing old containers"
  docker rm $(docker stop $(docker ps -q -a))
fi

echo "Launching containers"
docker run -d -ti --name cfp-elasticsearch -p 9200:9200 -p 9300:9300 -h elasticsearch dockerfile/elasticsearch
docker run -d -ti --name cfp-redis -p 6379:6379 -v $DATA:/data -h redis redis
docker run -d -ti --name cfp-webapp --link cfp-elasticsearch:elasticsearch --link cfp-redis:redis -p 80:9000 lkfr/cfp-webapp

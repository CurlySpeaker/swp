#!/usr/bin/env bash

#docker-compose -f docker_config/compose-db.yml build
#docker stack deploy --compose-file docker_config/compose-db.yml swp

docker-compose -p swp -f docker_config/compose-db.yml up -d #--build #--force-recreate
docker-compose -p swp -f docker_config/compose-web.yml up -d --build --force-recreate
#echo "Wait"
#sleep 10

echo "Completed"


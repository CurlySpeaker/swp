#!/usr/bin/env bash

docker-compose -p swp -f docker_config/compose-db.yml up -d
docker-compose -p swp -f docker_config/compose-web.yml up -d --build --force-recreate

echo "Completed"


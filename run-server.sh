#!/usr/bin/env bash

sudo docker-compose -p swp -f docker_config/compose-db.yml up -d
sudo docker-compose -p swp -f docker_config/compose-web.yml up -d --build --force-recreate

echo "Completed"


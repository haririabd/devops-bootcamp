#!/bin/bash
curl -fsSL https://get.docker.com | sh
usermod -aG docker ubuntu
mkdir -p data && sudo chown 1001:1001 data
curl -fsSL https://raw.githubusercontent.com/RackulaLives/Rackula/main/deploy/docker-compose.persist.yml -o docker-compose.yml
docker compose up -d
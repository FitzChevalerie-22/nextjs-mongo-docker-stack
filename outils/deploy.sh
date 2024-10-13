#!/bin/bash

# Arrêter les environnements 
docker compose -f ../docker-compose.dev.yml down
docker compose -f ../docker-compose.prod.yml down
# Copier les modifications dans l'environnement de production
rsync -av --progress \
  --exclude node_modules \
  --exclude Dockerfile \
  --exclude package.json \
  --exclude next.config.mjs \
  ../app-next-dev/ \
  ../app-next/

# Reconstruire et redémarrer l'environnement de production
docker compose -f ../docker-compose.prod.yml up --build -d
# Démarrer l'environnement de développement
docker compose -f ../docker-compose.dev.yml up -d

echo "Les modifications ont été déployées en production."
#!/bin/bash

# Définir la variable du chemin du projet
PROJECT_PATH="./"

# Définir florent comme propriétaire de tous les fichiers et dossiers
sudo chown -R florent:florent "$PROJECT_PATH"

# Appliquer les permissions 755 aux dossiers
sudo find "$PROJECT_PATH" -type d -exec chmod 755 {} \;

# Appliquer les permissions 644 aux fichiers
sudo find "$PROJECT_PATH" -type f -exec chmod 644 {} \;

echo "Permissions appliquées avec succès sur le projet."

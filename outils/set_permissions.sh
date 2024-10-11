#!/bin/bash

# Définir la variable du chemin du projet
PROJECT_PATH="../"

# Obtenir l'utilisateur courant
current_user=$(whoami)

# Demander à l'utilisateur de spécifier le compte pour le chown, avec l'utilisateur courant par défaut
read -p "Entrez le nom de l'utilisateur pour le chown (par défaut : $current_user) : " user_name
user_name=${user_name:-$current_user}

# Définir l'utilisateur spécifié comme propriétaire de tous les fichiers et dossiers
sudo chown -R "$user_name":"$user_name" "$PROJECT_PATH"

# Appliquer les permissions 755 aux dossiers
sudo find "$PROJECT_PATH" -type d -exec chmod 755 {} \;

# Appliquer les permissions 644 aux fichiers
sudo find "$PROJECT_PATH" -type f -exec chmod 644 {} \;

echo "Permissions appliquées avec succès sur le projet."
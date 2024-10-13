#!/bin/bash

# Fonction pour vérifier la version d'un outil
check_version() {
  local tool=$1
  local current_version=$2
  local required_version=$3

  if [ "$(printf '%s\n' "$required_version" "$current_version" | sort -V | head -n1)" = "$required_version" ]; then
    echo "$tool est à jour (version $current_version)."
  else
    echo "$tool est installé (version $current_version), mais une mise à jour est disponible."
    read -p "Voulez-vous mettre à jour $tool ? (y/n) : " update_choice
    if [ "$update_choice" = "y" ]; then
      return 1
    fi
  fi
  return 0
}

# Mettre à jour la liste des paquets
sudo apt-get update

# Vérifier et installer Docker
if command -v docker &> /dev/null; then
  current_docker_version=$(docker --version | awk '{print $3}' | sed 's/,//')
  check_version "Docker" "$current_docker_version" "20.10.0" || install_docker=true
else
  install_docker=true
fi

# Vérifier et installer Docker Compose
if command -v docker compose &> /dev/null; then
  current_compose_version=$(docker compose version --short)
  check_version "Docker Compose" "$current_compose_version" "2.0.0" || install_compose=true
else
  install_compose=true
fi

# Vérifier et installer Git
if command -v git &> /dev/null; then
  current_git_version=$(git --version | awk '{print $3}')
  check_version "Git" "$current_git_version" "2.25.0" || install_git=true
else
  install_git=true
fi

# Installer Docker si nécessaire
if [ "$install_docker" = true ]; then
  echo "Installation de Docker..."
  sudo apt-get install -y \
      ca-certificates \
      curl \
      gnupg \
      lsb-release

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io
fi

# Installer Docker Compose si nécessaire
if [ "$install_compose" = true ]; then
  echo "Installation de Docker Compose..."
  sudo apt-get install -y docker-compose-plugin
fi

# Installer Git si nécessaire
if [ "$install_git" = true ]; then
  echo "Installation de Git..."
  sudo apt-get install -y git
fi

# Ajouter l'utilisateur courant au groupe docker pour éviter d'utiliser sudo
sudo usermod -aG docker $USER

# Afficher les versions installées
echo "Docker version : $(docker --version)"
echo "Docker Compose version : $(docker compose version)"
echo "Git version : $(git --version)"

echo "Veuillez vous déconnecter et vous reconnecter pour que les changements de groupe prennent effet."
`````
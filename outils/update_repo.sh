#!/bin/bash

# Définir le chemin vers le répertoire du projet Git
PROJECT_DIR="../"

# Vérifier si le répertoire du projet est un dépôt Git
if [ ! -d "$PROJECT_DIR/.git" ]; then
    echo "Erreur : Le répertoire $PROJECT_DIR n'est pas un dépôt Git."
    exit 1
fi

# Naviguer vers le répertoire du projet
cd "$PROJECT_DIR" || exit

# Vérifier si l'identité Git est configurée localement
user_name=$(git config user.name)
user_email=$(git config user.email)

if [ -z "$user_name" ] || [ -z "$user_email" ]; then
    echo "L'identité Git n'est pas configurée pour ce dépôt."
    read -p "Entrez votre nom : " user_name
    read -p "Entrez votre email : " user_email

    git config user.name "$user_name"
    git config user.email "$user_email"
fi

# Afficher le statut des fichiers
echo "Voici les fichiers modifiés et non suivis :"
git status

# Récupérer les dernières modifications du dépôt distant
echo "Récupération des dernières modifications..."
git fetch origin

# Demander la branche cible
read -p "Entrez le nom de la branche cible (par défaut : main) : " branch_name
branch_name=${branch_name:-main}

# Vérifier si la branche existe localement
if ! git show-ref --verify --quiet refs/heads/$branch_name; then
    echo "La branche '$branch_name' n'existe pas localement."
    read -p "Voulez-vous la créer à partir de la branche distante ? (y/n) : " create_branch
    if [[ $create_branch == "y" ]]; then
        git checkout -b $branch_name origin/$branch_name
    else
        echo "Opération annulée."
        exit 1
    fi
else
    git checkout $branch_name
fi

# Fusionner les modifications de la branche distante
echo "Mise à jour de la branche '$branch_name'..."
git merge origin/$branch_name

# Vérifier s'il y a des conflits
if [ $? -ne 0 ]; then
    echo "Des conflits de fusion se sont produits. Veuillez les résoudre manuellement."
    exit 1
fi

echo "Les fichiers ont été mis à jour avec succès depuis la branche '$branch_name'."

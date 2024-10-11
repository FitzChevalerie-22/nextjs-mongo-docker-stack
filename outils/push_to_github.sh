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

# Demander la validation pour ajouter les fichiers modifiés
read -p "Voulez-vous ajouter les fichiers modifiés ? (y/n) : " add_modified
if [[ $add_modified == "y" ]]; then
    git add -u
fi

# Demander la validation pour ajouter les fichiers non suivis
read -p "Voulez-vous ajouter les fichiers non suivis ? (y/n) : " add_untracked
if [[ $add_untracked == "y" ]]; then
    git add .
fi

# Vérifier s'il y a des changements à committer
if git diff-index --quiet HEAD --; then
    echo "Aucun changement à committer."
    exit 0
fi

# Demander la raison du commit
read -p "Entrez la raison du commit : " commit_message

# Vérifier si un message de commit a été fourni
if [ -z "$commit_message" ]; then
    echo "Erreur : Vous devez fournir une raison pour le commit."
    exit 1
fi

# Récupérer la liste des branches locales
branches=$(git branch --list)

# Demander la branche cible
read -p "Entrez le nom de la branche cible (par défaut : main) : " branch_name
branch_name=${branch_name:-main}

# Vérifier si la branche existe localement
if ! git show-ref --verify --quiet refs/heads/$branch_name; then
    read -p "La branche '$branch_name' n'existe pas. Voulez-vous la créer ? (y/n) : " create_branch
    if [[ $create_branch == "y" ]]; then
        git checkout -b $branch_name
    else
        echo "Opération annulée."
        exit 1
    fi
else
    git checkout $branch_name
fi

# Committer les changements
git commit -m "$commit_message"

# Pousser les changements vers le dépôt distant
git push origin $branch_name

echo "Les changements ont été poussés vers la branche '$branch_name'."
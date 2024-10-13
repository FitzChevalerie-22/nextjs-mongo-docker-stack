# Stack de développement Fullstack Next.js avec MongoDB

## 📖 Introduction

Ce projet est un stack de développement fullstack, combinant un frontend réactif avec Next.js et un backend robuste utilisant MongoDB. L'ensemble est containerisé avec Docker pour faciliter le déploiement et la gestion de l'environnement. Ce stack est conçu pour être un point de départ vierge pour développer n'importe quelle application fullstack.

## 🚀 Caractéristiques

- **Frontend** : 
  - Next.js pour un rendu côté serveur et une navigation fluide
  - Tailwind CSS pour un styling rapide et responsive
- **Backend** : 
  - MongoDB comme base de données NoSQL performante
- **Déploiement** : Containerisation avec Docker et Docker Compose pour une portabilité maximale

## 🛠️ Prérequis

Avant de commencer, assurez-vous d'avoir installé :
- Docker (version 20.10.0 ou supérieure)
- Docker Compose (version 1.29.0 ou supérieure)
- Git (pour cloner le repository)

## 🏗️ Installation et démarrage

1. Si Docker ou Git n'est pas installé sur votre serveur Linux, copiez et rendez exécutable le script `docker-git_install.sh`.
2. Clonez le repository :
   ```bash
   git clone https://github.com/FitzChevalerie-22/nextjs-mongo-docker-stack.git
   cd nextjs-mongo-docker-stack
   ```
3. Rendez le script `set_permissions.sh` exécutable et lancez-le.
4. Construisez et lancez les conteneurs Docker pour l'environnement de développement :
   ```bash
   docker compose -f docker-compose.dev.yml up -d --build
   ```
5. Construisez et lancez les conteneurs Docker pour l'environnement de production :
   ```bash
   docker compose -f docker-compose.prod.yml up -d --build
   ```
6. Une fois le processus terminé, accédez à l'application :
   - Ouvrez votre navigateur et allez à `http://localhost:3300`
7. Faites vos modifications et tests sur l'environnement de développement.
8. Lancez le script `deploy.sh` pour déployer vos modifications en production.

## 📁 Structure du projet

. ├── app-next/ # Dossier principal de l'application Next.js
│   ├── components/ # Composants React réutilisables
│   ├── Dockerfile
│   ├── package.json
│   ├── pages/ # Pages de l'application
│   │   ├── _app.js # Composant racine de l'application
│   │   └── index.js # Page d'accueil
│   ├── postcss.config.js
│   ├── public/
│   ├── styles/
│   │   └── globals.css
│   └── tailwind.config.js
├── app-next-dev/ # Dossier de l'application Next.js pour le développement
│   ├── Dockerfile
│   ├── next.config.mjs
│   ├── package.json
│   ├── pages/
│   │   ├── _app.js
│   │   └── index.js
│   ├── postcss.config.js
│   ├── public/
│   ├── styles/
│   │   └── globals.css
│   └── tailwind.config.js
├── create.sh
├── deploy.sh
├── docker-compose.dev.yml
├── docker-compose.prod.yml
├── docker-compose.yml
├── mongo-init.js
├── outils/
│   ├── docker-git_install.sh
│   ├── push_to_github.sh
│   ├── set_permissions.sh
│   └── update_repo.sh
└── README.md

## 🛠️ Outils

Le projet comprend un dossier `outils` qui contient des scripts utiles pour la gestion du projet. Ces scripts sont :

- `docker-git_install.sh` : Ce script installe Docker,  et son plugin Docker Compose aisni que Git sur votre machine. Il vérifie également si des mises à jour sont disponibles pour ces outils dans la cas ou ils sont déjà installés.
- `push_to_github.sh` : Ce script vous aide à pousser vos modifications vers GitHub. Il vous demande de fournir une raison pour le commit et le nom de la branche cible.
- `set_permissions.sh` : Ce script définit les permissions des fichiers et dossiers du projet. Il vous demande de spécifier le compte pour le chown.
- `update_repo.sh` : Ce script met à jour votre dépôt Git local avec les dernières modifications du dépôt distant.
- `deploy.sh` : Ce script déploie vos modifications de l'environnement de développement vers l'environnement de production.

## 📚 Bibliothèques et dépendances

Le projet utilise plusieurs bibliothèques et dépendances pour fournir des fonctionnalités et faciliter le développement. Parmi elles :

- `next` : Le framework Next.js.
- `react` et `react-dom` : La bibliothèque React pour la création d'interfaces utilisateur.
- `tailwindcss` : Un framework CSS pour la création rapide de designs personnalisés.
- `postcss` et `autoprefixer` : Des outils pour la transformation du CSS.
- `mongodb` : Une bibliothèque pour interagir avec MongoDB.
- `mongoose` : Une bibliothèque pour la modélisation des données MongoDB.

## 🤝 Contribution et support

Les contributions à ce projet sont les bienvenues. Si vous rencontrez des problèmes ou avez des questions, n'hésitez pas à ouvrir une issue sur GitHub.

## 📄 Licence

Jean Cérien
````

J'espère que cette version est plus précise et utile. Si vous avez d'autres commentaires ou modifications à apporter, n'hésitez pas à me le faire savoir.

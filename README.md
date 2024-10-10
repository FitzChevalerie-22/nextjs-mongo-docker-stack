# Application Fullstack Next.js avec MongoDB

## 📖 Introduction

Cette application est une solution fullstack moderne, combinant un frontend réactif avec Next.js et un backend robuste utilisant MongoDB. L'ensemble est containerisé avec Docker pour faciliter le déploiement et la gestion de l'environnement.

## 🚀 Caractéristiques

- **Frontend** : 
  - Next.js pour un rendu côté serveur et une navigation fluide
  - Tailwind CSS pour un styling rapide et responsive
  - Flowbite pour des composants UI prêts à l'emploi
  - Heroicons pour des icônes vectorielles élégantes
- **Backend** : 
  - MongoDB comme base de données NoSQL performante
- **Authentification** : Intégration de next-auth pour une gestion sécurisée des utilisateurs
- **Thème** : Utilisation de next-themes pour une gestion facile des thèmes clairs/sombres
- **Déploiement** : Containerisation avec Docker et Docker Compose pour une portabilité maximale

## 🛠️ Prérequis

Avant de commencer, assurez-vous d'avoir installé :
- Docker (version 20.10.0 ou supérieure)
- Docker Compose (version 1.29.0 ou supérieure)
- Git (pour cloner le repository)

## 🏗️ Installation et démarrage

1. Clonez le repository :
   ```bash
   git clone https://github.com/votre-username/votre-repo.git
   cd votre-repo
   ```

2. Construisez et lancez les conteneurs Docker :
   ```bash
   docker-compose up --build
   ```
   Cette commande va :
   - Construire l'image Docker pour l'application Next.js
   - Télécharger l'image MongoDB
   - Démarrer tous les services définis dans `docker-compose.yml`

3. Une fois le processus terminé, accédez à l'application :
   - Ouvrez votre navigateur et allez à `http://localhost:3300`

## 📁 Structure du projet

.
├── app-next/ # Dossier principal de l'application Next.js
│ ├── components/ # Composants React réutilisables
│ ├── pages/ # Pages de l'application
│ │ ├── app.js # Composant racine de l'application
│ │ └── index.js # Page d'accueil
│ ├── styles/
│ │ └── tailwind.css # Fichier de configuration Tailwind CSS
│ ├── Dockerfile # Instructions pour construire l'image Docker de Next.js
│ ├── package.json # Dépendances et scripts npm
│ └── tailwind.config.js # Configuration de Tailwind CSS
├── docker-compose.yml # Configuration des services Docker
└── mongo-init.js # Script d'initialisation de la base de données MongoDB


## 💻 Développement

### Frontend (Next.js)

1. Les pages de l'application se trouvent dans `app-next/pages/`
   - Modifiez `index.js` pour changer la page d'accueil
   - Ajoutez de nouveaux fichiers pour créer de nouvelles pages

2. Les composants réutilisables sont dans `app-next/components/`
   - Créez de nouveaux fichiers ici pour des composants que vous utiliserez sur plusieurs pages

3. Pour les styles :
   - Utilisez les classes Tailwind CSS directement dans vos composants
   - Pour des styles globaux, modifiez `app-next/styles/tailwind.css`

4. Configuration de Tailwind :
   - Ajustez `app-next/tailwind.config.js` pour personnaliser Tailwind

### Backend (MongoDB)

1. Le script d'initialisation de la base de données se trouve dans `mongo-init.js`
   - Modifiez ce fichier pour ajouter des collections ou des données initiales

2. Pour interagir avec la base de données depuis Next.js :
   - Utilisez une bibliothèque comme `mongodb` ou `mongoose`
   - Créez des fichiers d'API dans `app-next/pages/api/` pour définir vos endpoints

## 🚀 Déploiement

Pour déployer l'application sur un serveur de production :

1. Assurez-vous que Docker et Docker Compose sont installés sur votre serveur

2. Copiez les fichiers suivants sur votre serveur :
   - `docker-compose.yml`
   - `mongo-init.js`
   - Le dossier `app-next` complet

3. Sur le serveur, naviguez vers le dossier contenant ces fichiers et exécutez :
   ```bash
   docker-compose up -d
   ```

4. L'application sera accessible sur le port 3300 de votre serveur

## 🔧 Maintenance

- **Mises à jour des dépendances** :
  1. Modifiez les versions dans `app-next/package.json`
  2. Reconstruisez l'image Docker : `docker-compose build`
  3. Redémarrez les conteneurs : `docker-compose up -d`

- **Ajout de nouvelles fonctionnalités** :
  1. Développez la fonctionnalité localement
  2. Testez-la avec `docker-compose up --build`
  3. Une fois satisfait, déployez les changements sur votre serveur de production

- **Sauvegarde de la base de données** :
  - Utilisez les outils de sauvegarde de MongoDB comme `mongodump`

## 🐛 Dépannage

- **L'application ne démarre pas** :
  - Vérifiez les logs : `docker-compose logs`
  - Assurez-vous que tous les ports nécessaires sont libres

- **Changements non reflétés** :
  - Reconstruisez l'image : `docker-compose up --build`

- **Problèmes de base de données** :
  - Vérifiez la connexion à MongoDB dans les logs de l'application
  - Assurez-vous que les variables d'environnement dans `docker-compose.yml` sont correctes

## 🤝 Contribution

Les contributions sont les bienvenues ! Voici comment vous pouvez contribuer :

1. Forkez le repository
2. Créez une nouvelle branche (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Poussez vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 📞 Support

Si vous rencontrez des problèmes ou avez des questions, n'hésitez pas à ouvrir une issue sur GitHub.

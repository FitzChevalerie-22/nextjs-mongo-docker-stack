# Utiliser une image Node.js de base
FROM node:lts

# Définir le répertoire de travail
WORKDIR /usr/src/app

# Copier les fichiers package.json et package-lock.json pour installer les dépendances
COPY package*.json ./

# Nettoyer le cache npm et installer toutes les dépendances
RUN npm cache clean --force && npm install

# Copier le reste des fichiers de l'application
COPY . .

# Construire l'application Next.js en production
RUN npm run build

# Vérifier le contenu du répertoire après le build
RUN ls -la

# Exposer le port Next.js par défaut
EXPOSE 3000

# Démarrer l'application Next.js
CMD ["npm", "start"]
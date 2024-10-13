# nextjs/app-next-dev/Dockerfile

# Utiliser l'image officielle Node.js comme image parente
FROM node:lts

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install
RUN npx next telemetry disable

# Copier le reste des fichiers de l'application
COPY . .
COPY next.config.mjs ./next.config.mjs

# Exposer le port sur lequel l'application va tourner
EXPOSE 3301

# Commande pour démarrer l'application en mode développement
CMD ["npm", "run", "dev"]

#!/bin/bash

# Script pour créer l'arborescence de projet Next.js avec Docker

# Vérifier si on est dans le répertoire 'nextjs'
current_dir=$(basename "$PWD")
if [ "$current_dir" != "nextjs" ]; then
  echo "Erreur : Veuillez exécuter ce script depuis le répertoire 'nextjs/'."
  exit 1
fi

# Créer le répertoire 'app-next-dev'
echo "Création du répertoire 'app-next-dev'..."
mkdir -p app-next-dev

# Naviguer dans 'app-next-dev'
cd app-next-dev || { echo "Erreur : Impossible d'entrer dans 'app-next-dev'."; exit 1; }

# Créer le fichier Dockerfile avec un contenu de base
echo "Création du Dockerfile..."
cat <<EOF > Dockerfile
# Utiliser l'image officielle Node.js comme image parente
FROM node:16-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers de l'application
COPY . .

# Construire l'application Next.js
RUN npm run build

# Exposer le port sur lequel l'application va tourner
EXPOSE 3000

# Commande pour démarrer l'application
CMD ["npm", "start"]
EOF

# Créer le fichier package.json avec un contenu de base
echo "Création du package.json..."
cat <<EOF > package.json
{
  "name": "app-next-dev",
  "version": "1.0.0",
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start"
  },
  "dependencies": {
    "next": "latest",
    "react": "latest",
    "react-dom": "latest",
    "next-themes": "latest",
    "next-auth": "latest",
    "@heroicons/react": "latest",
    "flowbite": "latest",
    "flowbite-react": "latest"
  },
  "devDependencies": {
    "tailwindcss": "latest",
    "postcss": "latest",
    "autoprefixer": "latest"
  }
}
EOF

# Créer un fichier index.js de base dans le dossier 'pages' (si non existant)
mkdir -p pages
echo "Création du fichier 'pages/index.js' (si non existant)..."
if [ ! -f pages/index.js ]; then
  cat <<EOF > pages/index.js
import { useState } from 'react';
import Head from 'next/head';
import { CheckCircleIcon, XCircleIcon } from '@heroicons/react/24/solid';
import packageJson from '../package.json';

export default function Home() {
  const [showReadme, setShowReadme] = useState(false);

  const dependencies = {
    'next': packageJson.dependencies.next,
    'react': packageJson.dependencies.react,
    'react-dom': packageJson.dependencies['react-dom'],
    'next-themes': packageJson.dependencies['next-themes'],
    'next-auth': packageJson.dependencies['next-auth'],
    '@heroicons/react': packageJson.dependencies['@heroicons/react'],
    'flowbite': packageJson.dependencies.flowbite,
    'flowbite-react': packageJson.dependencies['flowbite-react'],
    'tailwindcss': packageJson.devDependencies.tailwindcss,
    'postcss': packageJson.devDependencies.postcss,
    'autoprefixer': packageJson.devDependencies.autoprefixer,
  };

  return (
    <div className="min-h-screen bg-gray-100 py-6 flex flex-col justify-center sm:py-12">
      <Head>
        <title>Next.js MongoDB Docker Stack</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <div className="relative py-3 sm:max-w-xl sm:mx-auto">
        <div className="absolute inset-0 bg-gradient-to-r from-cyan-400 to-light-blue-500 shadow-lg transform -skew-y-6 sm:skew-y-0 sm:-rotate-6 sm:rounded-3xl"></div>
        <div className="relative px-4 py-10 bg-white shadow-lg sm:rounded-3xl sm:p-20">
          <div className="max-w-md mx-auto">
            <div>
              <h1 className="text-2xl font-semibold">Next.js MongoDB Docker Stack</h1>
            </div>
            <div className="divide-y divide-gray-200">
              <div className="py-8 text-base leading-6 space-y-4 text-gray-700 sm:text-lg sm:leading-7">
                <p>Une application fullstack moderne avec Next.js, MongoDB et Docker. Inclut l'authentification, la gestion de thème et des composants UI prêts à l'emploi.</p>
                <button
                  onClick={() => setShowReadme(!showReadme)}
                  className="px-4 py-2 font-semibold text-sm bg-cyan-500 text-white rounded-full shadow-sm"
                >
                  {showReadme ? 'Masquer le README' : 'Afficher le README'}
                </button>
                {showReadme && (
                  <div className="mt-4 p-4 bg-gray-100 rounded-md">
                    <h2 className="text-xl font-semibold mb-2">README</h2>
                    {/* Insérez ici le contenu de votre README */}
                    <p>Contenu du README...</p>
                  </div>
                )}
              </div>
              <div className="pt-6 text-base leading-6 font-bold sm:text-lg sm:leading-7">
                <h2 className="text-xl mb-4">Dépendances intégrées :</h2>
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Outil</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Version</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {Object.entries(dependencies).map(([name, version]) => (
                      <tr key={name}>
                        <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{name}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{version}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                          {version ? (
                            <CheckCircleIcon className="h-6 w-6 text-green-500" />
                          ) : (
                            <XCircleIcon className="h-6 w-6 text-red-500" />
                          )}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
EOF
fi

# Créer le fichier postcss.config.js si non existant
echo "Création du fichier 'postcss.config.js' (si non existant)..."
if [ ! -f postcss.config.js ]; then
  cat <<EOF > postcss.config.js
module.exports = {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  }
EOF
fi

# Créer le fichier tailwind.config.js si non existant
echo "Création du fichier 'tailwind.config.js' (si non existant)..."
if [ ! -f tailwind.config.js ]; then
  cat <<EOF > tailwind.config.js
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
    "./node_modules/flowbite-react/**/*.js",
    "./public/**/*.html",
  ],
  theme: {
    extend: {
      transitionProperty: {
        'width': 'width'
      },
    },
  },
  plugins: [
    require('flowbite/plugin')
  ],
}
EOF
fi

# Créer le fichier index.js personnalisé (si non existant)
echo "Création du fichier 'pages/index.js' personnalisé (si non existant)..."
if [ ! -f pages/index.js ]; then
  # Ici, on suppose que l'utilisateur va remplacer le contenu par son propre index.js.
  echo "Veuillez remplacer le contenu de 'pages/index.js' par votre propre fichier."
fi

# Retourner à la racine du projet
cd ..

# Créer le fichier deploy.sh avec un contenu de base (si non existant)
if [ ! -f deploy.sh ]; then
  echo "Création de 'deploy.sh'..."
  cat <<'EOF' > deploy.sh
#!/bin/bash

# Script de déploiement pour l'application Next.js avec Docker

# Arrêter et supprimer les conteneurs existants
docker-compose -f docker-compose.prod.yml down

# Construire et lancer les conteneurs en mode production
docker-compose -f docker-compose.prod.yml up --build -d

echo "Déploiement terminé avec succès !"
EOF

  # Rendre deploy.sh exécutable
  chmod +x deploy.sh
fi

echo "Arborescence de projet créée avec succès !"

import { useState, useEffect } from 'react'; // Importation des hooks useState et useEffect de React
import Head from 'next/head'; // Importation du composant Head de Next.js pour modifier le head du document HTML
import { CheckCircleIcon, XCircleIcon } from '@heroicons/react/24/solid'; // Importation des icônes CheckCircle et XCircle de Heroicons
import packageJson from '../package.json'; // Importation du fichier package.json

export default function Home() {
  const [showReadme, setShowReadme] = useState(false); // Déclaration de l'état showReadme avec le hook useState
  const [readmeContent, setReadmeContent] = useState(''); // Déclaration de l'état readmeContent avec le hook useState

  useEffect(() => { // Utilisation du hook useEffect pour exécuter du code après le rendu du composant
    fetch('https://raw.githubusercontent.com/FitzChevalerie-22/nextjs-mongo-docker-stack/main/README.md') // Récupération du contenu du README.md depuis GitHub
      .then(response => response.text()) // Conversion de la réponse en texte
      .then(data => setReadmeContent(data)); // Mise à jour de l'état readmeContent avec les données récupérées
  }, []);

  const dependencies = packageJson.dependencies; // Récupération des dépendances du fichier package.json
  const devDependencies = packageJson.devDependencies; // Récupération des dépendances de développement du fichier package.json

  return (
    <div className="min-h-screen bg-gray-100 py-6 flex flex-col justify-center sm:py-12"> {/* Conteneur principal de la page */}
      <Head> {/* Début de la section head du document HTML */}
        <title>Next.js MongoDB Docker Stack</title> {/* Titre de la page */}
        <link rel="icon" href="/favicon.ico" /> {/* Icône de la page */}
      </Head>
      {/* Conteneur du contenu de la page */}
      <div className="relative py-3 sm:max-w-xl sm:mx-auto"> 
        {/* Arrière-plan du contenu de la page */}
        <div className="absolute inset-0 bg-gradient-to-r from-cyan-400 to-light-blue-500 shadow-lg transform -skew-y-6 sm:skew-y-0 sm:-rotate-6 sm:rounded-3xl"></div> 
        {/* Conteneur du contenu de la page */}
        <div className="relative px-4 py-10 bg-white shadow-lg sm:rounded-xl sm:p-20"> 
          {/* Conteneur du contenu de la page */}
          <div className="max-w-md mx-auto"> 
            <div>
              <h1 className="text-2xl font-semibold">Next.js MongoDB Docker Stack</h1> {/* Titre de la page */}
            </div>
            <div className="divide-y divide-gray-200"> {/* Conteneur du contenu de la page */}
              <div className="py-8 text-base leading-6 space-y-4 text-gray-700 sm:text-lg sm:leading-7"> {/* Conteneur du contenu de la page */}
                <p>Une application fullstack moderne avec Next.js, MongoDB et Docker. Inclut l'authentification, la gestion de thème et des composants UI prêts à l'emploi.</p> {/* Description de l'application */}
                <button
                  onClick={() => setShowReadme(!showReadme)} // Gestion du clic sur le bouton pour afficher ou masquer le README
                  className="px-4 py-2 font-semibold text-sm bg-cyan-500 text-white rounded-full shadow-sm" // Styles du bouton
                >
                  {showReadme ? 'Masquer le README' : 'Afficher le README'} {/* Texte du bouton en fonction de l'état showReadme */}
                </button>
                {showReadme && ( // Affichage conditionnel du contenu du README en fonction de l'état showReadme
                  <div className="mt-4 p-4 bg-gray-100 rounded-md"> {/* Conteneur du contenu du README */}
                    <h2 className="text-xl font-semibold mb-2">README</h2> {/* Titre de la section README */}
                    <p>{readmeContent}</p> {/* Contenu du README */}
                  </div>
                )}
              </div>
              <div className="pt-6 text-base leading-6 font-bold sm:text-lg sm:leading-7"> {/* Conteneur de la liste des dépendances */}
                <h2 className="text-xl mb-4">Dépendances intégrées :</h2> {/* Titre de la section des dépendances */}
                <table className="min-w-full divide-y divide-gray-200"> {/* Tableau des dépendances */}
                  <thead className="bg-gray-50"> {/* En-tête du tableau */}
                    <tr> {/* Ligne de l'en-tête du tableau */}
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Outil</th> {/* Colonne "Outil" */}
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Version</th> {/* Colonne "Version" */}
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th> {/* Colonne "Statut" */}
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200"> {/* Corps du tableau */}
                    {Object.entries(dependencies).map(([name, version]) => ( // Parcours des dépendances
                      <tr key={name}> {/* Ligne du tableau pour chaque dépendance */}
                        <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{name}</td> {/* Nom de la dépendance */}
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{version}</td> {/* Version de la dépendance */}
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500"> {/* Statut de la dépendance */}
                          {version ? ( // Affichage conditionnel de l'icône en fonction de la version de la dépendance
                            <CheckCircleIcon className="h-6 w-6 text-green-500" /> // Icône de validation si la version est définie
                          ) : (
                            <XCircleIcon className="h-6 w-6 text-red-500" /> // Icône d'erreur si la version n'est pas définie
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
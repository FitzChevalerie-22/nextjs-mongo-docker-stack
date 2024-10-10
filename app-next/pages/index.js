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
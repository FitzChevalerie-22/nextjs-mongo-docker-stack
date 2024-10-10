import Link from 'next/link';
import { HomeIcon, InformationCircleIcon, EnvelopeIcon } from '@heroicons/react/24/outline';

const Sidebar = () => {
  const menuItems = [
    { name: 'Accueil', href: '/', icon: HomeIcon },
    { name: 'À propos', href: '/about', icon: InformationCircleIcon },
    { name: 'Contact', href: '/contact', icon: EnvelopeIcon },
  ];

  return (
    <div className="fixed inset-y-0 left-0 z-30 w-64 bg-gray-900 text-white">
      <div className="flex items-center justify-center h-20 shadow-md">
        <h1 className="text-3xl font-bold text-gray-200">MonApp</h1>
      </div>
      <nav className="mt-5">
        {menuItems.map((item) => (
          <Link key={item.name} href={item.href}>
            <a className="flex items-center mt-4 py-2 px-6 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100">
              <item.icon className="h-6 w-6" />
              <span className="mx-3">{item.name}</span>
            </a>
          </Link>
        ))}
      </nav>
    </div>
  );
};

export default Sidebar;
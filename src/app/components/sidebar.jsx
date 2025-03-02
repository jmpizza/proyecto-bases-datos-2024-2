'use client';
import { useEffect, useState } from 'react';
import Link from 'next/link';

export default function Sidebar() {
  const [role, setRole] = useState(null);

  useEffect(() => {
    const fetchRole = async () => {
      try {
        // Se hace la petición a la API que devuelve el rol.
        const response = await fetch('/api/auth/role');
        const data = await response.json();
        setRole(data.role || 'cliente');
      } catch (error) {
        console.error('Error al obtener el rol:', error);
        setRole('cliente');
      }
    };
    fetchRole();
  }, []);

  if (!role) {
    return (
      <div className="bg-gray-200 w-1/6 min-w-[200px] min-h-[calc(100vh-5rem)] p-4 shadow-md">
        Cargando...
      </div>
    );
  }

  // Definir las opciones a mostrar según el rol
  let links = [];
  if (role === 'GERENTE') {
    links = [
      { href: '/dashboard/venta', label: 'Venta' },
      { href: '/dashboard/tablas', label: 'Tablas' },
      { href: '/dashboard/ventasdiarias', label: 'Ventas Diarias' },
      { href: '/dashboard/recetas', label: 'Recetas' }
    ];
  } else if (role === 'CAJERO') {
    links = [
      { href: '/dashboard/venta', label: 'Venta' },
      { href: '/dashboard/tablas', label: 'Tablas' },
      { href: '/dashboard/ventasdiarias', label: 'Ventas Diarias' }
    ];
  } else if (role === 'PANADERO' || role === 'PASTELERO') {
    links = [
      { href: '/dashboard/tablas', label: 'Tablas' },
      { href: '/dashboard/recetas', label: 'Recetas' }
    ];
  } else {
    // Otros roles
    links = [{ href: '/dashboard/tablas', label: 'Tablas' }];
  }

  return (
    <div className="bg-gray-200 w-1/6 min-w-[200px] min-h-[calc(100vh-5rem)] p-4 shadow-md">
      <ul className="divide-y divide-gray-300 space-y-2">
        {links.map(link => (
          <li key={link.href}>
            <Link
              href={link.href}
              className="block px-4 py-2 bg-gray-300 rounded hover:bg-gray-400 transition-colors"
            >
              {link.label}
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}

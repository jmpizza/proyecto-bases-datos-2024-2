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

  return (
    <div className="bg-gray-200 w-1/6 min-w-[200px] min-h-[calc(100vh-5rem)] p-4 shadow-md">
      <ul className="divide-y divide-gray-300 space-y-2">
        {(role === 'GERENTE' || role === 'CAJERO') ? (
          <>
            <li>
              <Link 
                href="/dashboard/venta"
                className="block px-4 py-2 bg-gray-300 rounded hover:bg-gray-400 transition-colors"
              >
                Venta
              </Link>
            </li>
            <li>
              <Link 
                href="/dashboard/tablas"
                className="block px-4 py-2 bg-gray-300 rounded hover:bg-gray-400 transition-colors"
              >
                Tablas
              </Link>
            </li>
            <li>
              <Link 
                href="/dashboard/ventasdiarias"
                className="block px-4 py-2 bg-gray-300 rounded hover:bg-gray-400 transition-colors"
              >
                Ventas Diarias
              </Link>
            </li>
          </>
        ) : (
          <li>
            <Link 
              href="/dashboard/tablas"
              className="block px-4 py-2 bg-gray-300 rounded hover:bg-gray-400 transition-colors"
            >
              Tablas
            </Link>
          </li>
        )}
      </ul>
    </div>
  );
}

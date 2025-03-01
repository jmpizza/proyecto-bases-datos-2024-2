'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'

export default function Login() {
  const [usuario, setUsuario] = useState('');
  const [contrasena, setContrasena] = useState('');
  const [error, setError] = useState('');
  const router = useRouter();

  const handleInicio = async () => {
    if (!usuario || !contrasena) {
      setError('Por favor, complete todos los campos.');
      return;
    }

    try {
      const response = await fetch('/api/auth', {
        method: 'POST', 
        headers: { 'Content-Type': 'application/json' }, 
        body: JSON.stringify({ documento: usuario, password: contrasena })
      });

      const data = await response.json();

      if (response.ok) {
        router.push('/dashboard');
      } else {
        setError(data.error || 'Error al iniciar sesión');
      }
    } catch (err) {
      setError('Error en la conexión con el servidor');
    }
  };

  return (
    <div className="flex justify-center items-center min-h-[calc(100vh-5rem)]">
      <div className="p-6 rounded shadow-md bg-gray-100 flex flex-col items-center w-80">
        <p className="text-lg font-bold mb-4">Inicio de sesión</p>
        {error && <p className="text-red-500 text-sm mb-2">{error}</p>}
        <div className="w-full">
          <p className="text-center">Documento</p>
          <input
            type="text"
            value={usuario}
            onChange={(e) => setUsuario(e.target.value)}
            className="px-3 py-2 border rounded w-full mb-3"
          />
          <p className="text-center">Contraseña</p>
          <input
            type="password"
            value={contrasena}
            onChange={(e) => setContrasena(e.target.value)}
            className="px-3 py-2 border rounded w-full mb-4"
          />
          <button
            className="rounded border p-2 w-full bg-sky-300 hover:bg-sky-400"
            onClick={handleInicio}
          >
            Ingresar
          </button>
        </div>
      </div>
    </div>
  );
}

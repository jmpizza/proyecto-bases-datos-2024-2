'use client'
import { useState } from 'react'

export default function Login() {
  const [usuario, setUsuario] = useState('');
  const [contrasena, setContrasena] = useState('');

  const handleInicio = async () => {
    if(!contrasena || !usuario) return;
    return;
  }

  return (
    <div className="flex justify-center items-center min-h-[calc(100vh-5rem)]">
      <div className="p-6 rounded shadow-md bg-gray-100 flex flex-col items-center w-80">
        <p className="text-lg font-bold mb-4">Inicio de sesión</p>
        <div className="w-full">
          <p className="text-center">Usuario</p>
          <input
            type="text"
            placeholder="Usuario"
            value={usuario}
            onChange={(e) => setUsuario(e.target.value)}
            className="px-3 py-2 border rounded w-full mb-3"
          />
          <p className="text-center">Contraseña</p>
          <input
            type="password"
            placeholder="Contraseña"
            value={contrasena}
            onChange={(e) => setContrasena(e.target.value)}
            className="px-3 py-2 border rounded w-full mb-4"
          />
          <button className="rounded border p-2 w-full bg-sky-300 hover:bg-sky-400" onClick={handleInicio}>
            Ingresar
          </button>
        </div>
      </div>
    </div>
  )
}

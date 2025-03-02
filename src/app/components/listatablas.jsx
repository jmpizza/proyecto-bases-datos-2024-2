'use client';
import { useState, useEffect } from 'react';

export default function ListaTablas({ onSelectTable, selectedTable }) {
  const [tablas, setTablas] = useState([]);

  useEffect(() => {
    const fetchTablas = async () => {
      try {
        const response = await fetch(`/api/dashboard/tablas`);
        const data = await response.json();
        setTablas(data.tables || []);
      } catch (error) {
        console.error("Error al obtener las tablas:", error);
      }
    };

    fetchTablas();
  }, []);

  return (
    <aside className="w-[25%] bg-gray-100 p-5 h-[80vh] overflow-y-auto">
      <h2 className="text-xl font-bold mb-2">Tablas</h2>
      <p className="text-sm mb-4">
        Tenga en consideración que solo se muestran las tablas a las cuales tiene acceso.
      </p>
      {tablas.map((tabla, index) => {
        const nombreTabla = Object.values(tabla)[0];
        return (
          <button
            key={index}
            onClick={() => onSelectTable(nombreTabla)}
            className={`block w-full p-2 mb-2 bg-sky-300 text-black rounded text-left cursor-pointer ${selectedTable === nombreTabla ? 'ring-2 ring-blue-500' : ''}`}
          >
            {nombreTabla}
          </button>
        );
      })}
    </aside>
  );
}

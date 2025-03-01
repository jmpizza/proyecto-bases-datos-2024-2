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
    <aside className="sidebar">
      <h2 className="sidebar-title">Tablas</h2>
      <p className="sidebar-info">
        Tenga en consideración que solo se muestran las tablas a las cuales tiene acceso.
      </p>
      {tablas.map((tabla, index) => {
        const nombreTabla = Object.values(tabla)[0];
        return (
          <button
            key={index}
            onClick={() => onSelectTable(nombreTabla)}
            className={`table-button ${selectedTable === nombreTabla ? 'selected' : ''}`}
          >
            {nombreTabla}
          </button>
        );
      })}
    </aside>
  );
}

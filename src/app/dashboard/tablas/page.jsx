'use client';
import { useState, useEffect } from 'react';

export default function Tablas() {
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
    <div style={{ display: 'flex' }}>
      {/* Sidebar de tablas */}
      <aside
        style={{
          width: '30%',
          maxWidth: '30%',
          minWidth: '200px',
          background: '#f5f5f5',
          padding: '20px',
          boxSizing: 'border-box',
          height: '100vh',
          overflowY: 'auto'
        }}
      >
        <h2 style={{ marginTop: 0 }}>Tablas</h2>
        <p style={{ fontSize: '0.9rem' }}>
          Tenga en consideración que solo se muestran las tablas a las cuales tiene acceso.
        </p>
        {tablas.map((tabla, index) => (
          <button
            key={index}
            style={{
              display: 'block',
              width: '100%',
              padding: '10px',
              marginBottom: '10px',
              border: 'none',
              background: '#0070f3',
              color: '#fff',
              borderRadius: '5px',
              cursor: 'pointer',
              textAlign: 'left'
            }}
          >
            {Object.values(tabla)[0]}
          </button>
        ))}
      </aside>

      {/* Contenido principal */}
      <main style={{ flexGrow: 1, padding: '20px' }}>
        <p>Aquí va el contenido principal de la página.</p>
      </main>
    </div>
  );
}

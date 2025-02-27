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
    <div>
      <p>Tablas</p>
      <p>
        Tenga en consideración que solo se muestran 
        las tablas a las cuales tiene acceso.
      </p>
      <button>
        {tablas.map((tabla, index) => (
          <li key={index}>{Object.values(tabla)[0]}</li>
        ))}
      </button>
    </div>
  );
}
'use client';
import { useState, useEffect } from 'react';

export default function DatosTabla({ tablaSeleccionada }) {
  const [datosTabla, setDatosTabla] = useState([]);
  const [columnas, setColumnas] = useState([]);

  useEffect(() => {
    const fetchDatosTabla = async () => {
      if (!tablaSeleccionada) return;
      try {
        const response = await fetch(`/api/dashboard/tablas/datos?tabla=${encodeURIComponent(tablaSeleccionada)}`);
        const data = await response.json();
        if (data.length > 0) {
          setColumnas(Object.keys(data[0]));
        } else {
          setColumnas([]);
        }
        setDatosTabla(data);
      } catch (error) {
        console.error(`Error al obtener datos de la tabla ${tablaSeleccionada}:`, error);
        setDatosTabla([]);
        setColumnas([]);
      }
    };

    fetchDatosTabla();
  }, [tablaSeleccionada]);

  if (!tablaSeleccionada) {
    return <p style={{ padding: '20px' }}>Seleccione una tabla para ver sus datos.</p>;
  }

  return (
    <main className="main-content">
      <h2>Datos de la tabla: {tablaSeleccionada}</h2>
      {datosTabla.length > 0 ? (
        <div className="table-container">
          <table className="data-table">
            <thead>
              <tr>
                {columnas.map((col, index) => (
                  <th key={index}>{col}</th>
                ))}
              </tr>
            </thead>
            <tbody>
              {datosTabla.map((fila, filaIndex) => (
                <tr key={filaIndex}>
                  {columnas.map((col, colIndex) => (
                    <td key={colIndex}>{fila[col]}</td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : (
        <p className="no-data">No hay datos disponibles para esta tabla.</p>
      )}
    </main>
  );
}

'use client';
import { useState, useEffect } from 'react';

export default function DatosTabla({ tablaSeleccionada, onColumnsLoaded, onRowSelect, refreshKey }) {
  const [datosTabla, setDatosTabla] = useState([]);
  const [localColumns, setLocalColumns] = useState([]);

  useEffect(() => {
    const fetchDatosTabla = async () => {
      if (!tablaSeleccionada) return;
      try {
        const response = await fetch(
          `/api/dashboard/tablas/datos?tabla=${encodeURIComponent(tablaSeleccionada)}`
        );
        const data = await response.json();
        if (data.length > 0) {
          const cols = Object.keys(data[0]);
          setLocalColumns(cols);
          onColumnsLoaded && onColumnsLoaded(cols);
        } else {
          setLocalColumns([]);
          onColumnsLoaded && onColumnsLoaded([]);
        }
        setDatosTabla(data);
      } catch (error) {
        console.error(`Error al obtener datos de la tabla ${tablaSeleccionada}:`, error);
        setDatosTabla([]);
        setLocalColumns([]);
        onColumnsLoaded && onColumnsLoaded([]);
      }
    };

    fetchDatosTabla();
  }, [tablaSeleccionada, onColumnsLoaded, refreshKey]);

  if (!tablaSeleccionada) {
    return <p className="p-5">Seleccione una tabla para ver sus datos.</p>;
  }

  return (
    <div className="flex flex-col p-5">
      <h2 className="text-xl font-bold mb-4">Datos de la tabla: {tablaSeleccionada}</h2>
      {datosTabla.length > 0 ? (
        <div className="overflow-scroll border border-gray-300 rounded max-h-[500px]">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-sky-300">
              <tr>
                {localColumns.map((col, index) => (
                  <th key={index} className="px-4 py-2 text-left text-sm font-medium text-gray-700">
                    {col}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200">
              {datosTabla.map((fila, filaIndex) => (
                <tr
                  key={filaIndex}
                  onClick={() => onRowSelect && onRowSelect(fila)}
                  className="cursor-pointer hover:bg-gray-100"
                >
                  {localColumns.map((col, colIndex) => (
                    <td key={colIndex} className="px-4 py-2 whitespace-nowrap text-sm text-gray-900">
                      {fila[col]}
                    </td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : (
        <p className="mt-4 text-gray-500">No hay datos disponibles para esta tabla.</p>
      )}
    </div>
  );
}

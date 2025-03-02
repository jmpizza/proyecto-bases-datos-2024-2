'use client';
import { useState } from "react";

export default function VentasDiarias() {
  const [selectedDate, setSelectedDate] = useState("");
  const [ventas, setVentas] = useState([]);

  const handleMostrar = async () => {
    try {
      // Se envía la fecha seleccionada en la query (si no se selecciona, se pasa una cadena vacía que la API tratará como NULL)
      const res = await fetch(`/api/dashboard/ventasdiarias?fecha=${selectedDate}`);
      if (!res.ok) {
        throw new Error("Error al obtener datos");
      }
      const data = await res.json();
      setVentas(data);
    } catch (error) {
      console.error(error);
      alert("Error al obtener datos");
    }
  };

  return (
    <div className="p-6">
      <h1 className="text-xl font-bold mb-4">Ventas Diarias</h1>
      <div className="flex items-center space-x-4 mb-4">
        <input 
          type="date" 
          value={selectedDate} 
          onChange={(e) => setSelectedDate(e.target.value)} 
          className="border rounded px-2 py-1"
        />
        <button 
          onClick={handleMostrar} 
          className="bg-sky-300 text-black px-4 py-2 rounded hover:bg-sky-400"
        >
          Mostrar
        </button>
      </div>
      {ventas.length > 0 ? (
        <table className="min-w-full border">
          <thead>
            <tr className="bg-gray-200">
              <th className="px-4 py-2 border">Fecha</th>
              <th className="px-4 py-2 border">Tipo de Pago</th>
              <th className="px-4 py-2 border">Total del Día</th>
              <th className="px-4 py-2 border">Transacciones</th>
            </tr>
          </thead>
          <tbody>
            {ventas.map((venta, index) => (
              <tr key={index}>
                <td className="px-4 py-2 border">{venta.fecha}</td>
                <td className="px-4 py-2 border">{venta.ven_tipo_pago}</td>
                <td className="px-4 py-2 border">{venta.total_dia}</td>
                <td className="px-4 py-2 border">{venta.transacciones}</td>
              </tr>
            ))}
          </tbody>
        </table>
      ) : (
        <p>No hay datos para mostrar.</p>
      )}
    </div>
  );
}

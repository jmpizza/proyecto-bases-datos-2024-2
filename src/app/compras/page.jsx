'use client'
import { useState } from 'react';

export default function ConsultaCompras() {
  const [documento, setDocumento] = useState('');
  const [compras, setCompras] = useState([]);
  
  const handleConsulta = async () => {
    if (!documento) return;
    const response = await fetch(`/api/compras?documento=${documento}`);
    const data = await response.json();
    setCompras(data.tables[0]);
  };

  return (
    <div className="flex flex-col items-center p-4">
      <div className="bg-gray-100 p-4 rounded shadow-md">
        <p className="text-center mb-2">Para consultar las compras que ha realizado, ingrese su número de documento</p>
        <input 
          type="text" 
          placeholder="1000000000" 
          value={documento} 
          onChange={(e) => setDocumento(e.target.value)} 
          className="border rounded px-3 py-2 w-full mb-2"
        />
        <div className="flex justify-between">
          <button className="bg-gray-400 text-white px-4 py-2 rounded" onClick={() => setDocumento('')}>Cancelar</button>
          <button className="bg-blue-500 text-white px-4 py-2 rounded" onClick={handleConsulta}>Consultar</button>
        </div>
      </div>
      {compras.length > 0 && (
        <div className="mt-6 w-full max-w-2xl border p-4 rounded shadow">
          <h2 className="text-lg font-bold mb-2">Detalles de venta</h2>
          {compras.map((compra, index) => (
            <div key={index} className="border-b py-2">
              <p><strong>Fecha de compra:</strong> {compra.ven_fecha.substring(0, 10)} | <strong>Método de pago:</strong> {compra.ven_tipo_pago}</p>
              <p><strong>Productos comprados:</strong> {compra.productos_vendidos}</p>
              <p className="text-right"><strong>{compra.ven_precio_total}</strong></p>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

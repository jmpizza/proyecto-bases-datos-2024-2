'use client';
import { useEffect, useState } from "react";

export default function Recetas() {
  const [productos, setProductos] = useState([]);
  const [selectedProduct, setSelectedProduct] = useState("");
  const [recetas, setRecetas] = useState([]);
  const [loading, setLoading] = useState(false);

  // Cargar productos desde la API de ventas
  useEffect(() => {
    const fetchProductos = async () => {
      try {
        const response = await fetch("/api/dashboard/ventas");
        const data = await response.json();
        // Asumimos que la API retorna un arreglo de productos
        setProductos(data);
      } catch (error) {
        console.error("Error al cargar productos:", error);
      }
    };
    fetchProductos();
  }, []);

  const handleConsultar = async () => {
    if (!selectedProduct) {
      alert("Seleccione un producto para consultar las recetas.");
      return;
    }
    setLoading(true);
    try {
      const res = await fetch(`/api/dashboard/recetas?nombre_producto=${encodeURIComponent(selectedProduct)}`);
      if (!res.ok) {
        throw new Error("Error al obtener recetas");
      }
      const data = await res.json();
      setRecetas(data);
    } catch (error) {
      console.error("Error al consultar recetas:", error);
      alert("Error al consultar recetas");
    }
    setLoading(false);
  };

  return (
    <div className="p-6 space-y-6">
      <h1 className="text-2xl font-bold">Recetas</h1>

      {/* Selección de producto */}
      <div className="flex flex-col space-y-2">
        <label className="font-medium">Seleccione un producto:</label>
        <select
          className="border rounded px-2 py-1"
          value={selectedProduct}
          onChange={(e) => setSelectedProduct(e.target.value)}
        >
          <option value="">-- Seleccione --</option>
          {productos.map((p) => (
            <option key={p.pro_codigo} value={p.pro_nombre}>
              {p.pro_nombre}
            </option>
          ))}
        </select>
        <button
          onClick={handleConsultar}
          className="bg-sky-300 text-black px-4 py-2 rounded hover:bg-sky-400"
        >
          {loading ? "Cargando..." : "Consultar"}
        </button>
      </div>

      {/* Mostrar resultados */}
      {recetas.length > 0 ? (
        <div className="overflow-auto border border-gray-300 rounded">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-200">
              <tr>
                <th className="px-4 py-2 text-left text-sm font-medium">Producto</th>
                <th className="px-4 py-2 text-left text-sm font-medium">Materia Prima</th>
                <th className="px-4 py-2 text-left text-sm font-medium">Stock Disponible</th>
              </tr>
            </thead>
            <tbody>
              {recetas.map((receta, index) => (
                <tr key={index} className="border-b hover:bg-gray-50">
                  <td className="px-4 py-2 text-sm">{receta.producto}</td>
                  <td className="px-4 py-2 text-sm">{receta.materia_prima}</td>
                  <td className="px-4 py-2 text-sm">{receta.stock_disponible}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : (
        <p>No hay recetas para mostrar.</p>
      )}
    </div>
  );
}

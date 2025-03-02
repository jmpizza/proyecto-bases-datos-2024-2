'use client';
import React, { useEffect, useState } from 'react';

export default function Venta() {
  // Estados para datos generales de la venta
  const [paymentMethod, setPaymentMethod] = useState("Efectivo");
  const [clientDocument, setClientDocument] = useState("");
  const [saleType, setSaleType] = useState("Contado");
  const [cashierDocument, setCashierDocument] = useState("");
  const [saleAddress, setSaleAddress] = useState("");

  // Estados para la sección de productos
  const [productos, setProductos] = useState([]);
  const [selectedProductId, setSelectedProductId] = useState("");
  const [selectedDiscount, setSelectedDiscount] = useState("Sin descuento");
  const [units, setUnits] = useState("");
  const [saleProducts, setSaleProducts] = useState([]);

  // Cargar los productos desde la API de productos al montar el componente
  useEffect(() => {
    const fetchProductos = async () => {
      try {
        const response = await fetch('/api/dashboard/ventas');
        const data = await response.json();
        setProductos(data);
      } catch (error) {
        console.error("Error al cargar productos:", error);
      }
    };
    fetchProductos();
  }, []);

  // Handler para agregar un producto a la lista de venta
  const handleAgregarProducto = () => {
    if (!selectedProductId) {
      alert("Seleccione un producto.");
      return;
    }
    if (!units || isNaN(units) || Number(units) <= 0) {
      alert("Ingrese un número válido de unidades.");
      return;
    }
    const product = productos.find(p => p.pro_codigo.toString() === selectedProductId);
    if (!product) {
      alert("Producto no encontrado.");
      return;
    }
    const numUnits = Number(units);
    const total = product.pro_precio_venta * numUnits;
    const newItem = {
      productId: product.pro_codigo,
      productName: product.pro_nombre,
      productCode: product.pro_codigo,
      productPrice: product.pro_precio_venta,
      discountType: selectedDiscount,
      units: numUnits,
      total: total
    };
    setSaleProducts(prev => [...prev, newItem]);
    // Limpiar campos de producto
    setSelectedProductId("");
    setSelectedDiscount("Sin descuento");
    setUnits("");
  };

  // Handler para eliminar producto de la lista
  const handleEliminarProducto = (index) => {
    setSaleProducts(prev => prev.filter((_, i) => i !== index));
  };

  // Handler para finalizar la venta (envía la info a la API)
  const handleFinalizar = async () => {
    // Validar que haya productos agregados
    if (saleProducts.length === 0) {
      alert("No se han agregado productos a la venta.");
      return;
    }
    // Validar datos generales de la venta
    if (!clientDocument || !saleAddress || !cashierDocument) {
      alert("Complete los campos: Documento del cliente, Dirección y Documento del cajero.");
      return;
    }

    // Calcular total a pagar
    const totalVenta = saleProducts.reduce((acc, item) => acc + item.total, 0);
    // Obtener fecha y hora actuales
    const now = new Date();
    const ven_hora = now.toTimeString().split(' ')[0]; // "HH:mm:ss"
    const ven_fecha = now.toISOString().slice(0, 19).replace('T', ' '); // "YYYY-MM-DD HH:mm:ss"

    // Construir el objeto de venta (para la tabla VENTA)
    const venta = {
      ven_precio_total: totalVenta,
      ven_hora,
      ven_fecha,
      ven_tipo_pago: paymentMethod,
      ven_tipo: saleType,
      ven_direccion: saleAddress,
      per_documento: clientDocument,
      pes_documento: cashierDocument
    };

    // Construir el arreglo de detalles (para la tabla DETALLE_VENTA)
    const detalle = saleProducts.map(item => ({
      det_cantidad_producto: item.units,
      pro_codigo: item.productId,
      prm_id: null,
      pre_codigo: null
    }));

    const payload = { venta, detalle };

    try {
      const response = await fetch('/api/dashboard/ventas/detalle', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      if (response.ok) {
        alert("Venta registrada correctamente.");
        // Limpiar todos los campos excepto el Documento del cajero
        setPaymentMethod("Efectivo");
        setClientDocument("");
        setSaleType("Contado");
        setSaleAddress("");
        setSelectedProductId("");
        setSelectedDiscount("Sin descuento");
        setUnits("");
        setSaleProducts([]);
      } else {
        const errorData = await response.json();
        alert("Error al registrar venta: " + errorData.error);
      }
    } catch (error) {
      console.error("Error al finalizar venta:", error);
      alert("Error al finalizar venta.");
    }
  };

  return (
    <div className="p-6 space-y-6">
      {/* Primera fila: Datos generales de la venta */}
      <div className="grid grid-cols-5 gap-4">
        <div className="flex flex-col">
          <label className="mb-1 font-medium text-sm">Método de pago</label>
          <select
            className="border rounded px-2 py-1"
            value={paymentMethod}
            onChange={(e) => setPaymentMethod(e.target.value)}
          >
            <option>Efectivo</option>
            <option>Tarjeta</option>
            <option>Transferencia</option>
          </select>
        </div>
        <div className="flex flex-col">
          <label className="mb-1 font-medium text-sm">Documento del cliente</label>
          <input
            type="number"
            placeholder="Número"
            className="border rounded px-2 py-1"
            value={clientDocument}
            onChange={(e) => setClientDocument(e.target.value)}
          />
        </div>
        <div className="flex flex-col">
          <label className="mb-1 font-medium text-sm">Tipo de venta</label>
          <select
            className="border rounded px-2 py-1"
            value={saleType}
            onChange={(e) => setSaleType(e.target.value)}
          >
            <option>Contado</option>
            <option>Crédito</option>
          </select>
        </div>
        <div className="flex flex-col">
          <label className="mb-1 font-medium text-sm">Documento del cajero</label>
          <input
            type="number"
            placeholder="Número"
            className="border rounded px-2 py-1"
            value={cashierDocument}
            onChange={(e) => setCashierDocument(e.target.value)}
          />
        </div>
        <div className="flex flex-col">
          <label className="mb-1 font-medium text-sm">Dirección</label>
          <input
            type="text"
            placeholder="Dirección"
            className="border rounded px-2 py-1"
            value={saleAddress}
            onChange={(e) => setSaleAddress(e.target.value)}
          />
        </div>
      </div>

      {/* Segunda fila: Selección de producto */}
      <div className="grid grid-cols-4 gap-4">
        <div className="flex flex-col">
          <label className="mb-1 font-medium text-sm">Producto nombre</label>
          <select
            className="border rounded px-2 py-1"
            value={selectedProductId}
            onChange={(e) => setSelectedProductId(e.target.value)}
          >
            <option value="">Seleccione un producto</option>
            {productos.map((p) => (
              <option key={p.pro_codigo} value={p.pro_codigo}>
                {p.pro_nombre}
              </option>
            ))}
          </select>
        </div>
        <div className="flex flex-col">
          <label className="mb-1 font-medium text-sm">Producto código</label>
          <select
            className="border rounded px-2 py-1"
            value={selectedProductId}
            onChange={(e) => setSelectedProductId(e.target.value)}
          >
            <option value="">Seleccione un producto</option>
            {productos.map((p) => (
              <option key={p.pro_codigo} value={p.pro_codigo}>
                {p.pro_codigo}
              </option>
            ))}
          </select>
        </div>
        <div className="flex flex-col">
          <label className="mb-1 font-medium text-sm">Precio venta del producto</label>
          <select className="border rounded px-2 py-1" value={selectedProductId} disabled>
            <option value="">Seleccione un producto</option>
            {productos.map((p) => (
              <option key={p.pro_codigo} value={p.pro_codigo}>
                {p.pro_precio_venta}
              </option>
            ))}
          </select>
        </div>
        <div className="flex flex-col">
          <label className="mb-1 font-medium text-sm">Tipo de descuento</label>
          <select
            className="border rounded px-2 py-1"
            value={selectedDiscount}
            onChange={(e) => setSelectedDiscount(e.target.value)}
          >
            <option>Sin descuento</option>
            <option>Promoción</option>
            <option>2x1</option>
          </select>
        </div>
      </div>

      {/* Tercera fila: Input de Unidades */}
      <div className="grid grid-cols-4 gap-4">
        <div className="flex flex-col">
          <label className="mb-1 font-medium text-sm">Unidades</label>
          <input
            type="number"
            placeholder="Cantidad"
            className="border rounded px-2 py-1"
            value={units}
            onChange={(e) => setUnits(e.target.value)}
          />
        </div>
      </div>

      {/* Botón de Agregar Producto */}
      <div className="flex justify-end">
        <button
          onClick={handleAgregarProducto}
          className="bg-sky-300 text-black px-4 py-2 rounded hover:bg-sky-400"
        >
          Agregar
        </button>
      </div>

      {/* Tabla de productos agregados */}
      <div className="border border-gray-300 rounded">
        <table className="min-w-full">
          <thead className="bg-gray-100 text-left">
            <tr>
              <th className="px-4 py-2 text-sm font-medium text-gray-700">Producto</th>
              <th className="px-4 py-2 text-sm font-medium text-gray-700">Unidades</th>
              <th className="px-4 py-2 text-sm font-medium text-gray-700">Precio unitario</th>
              <th className="px-4 py-2 text-sm font-medium text-gray-700">Precio total</th>
              <th className="px-4 py-2 text-sm font-medium text-gray-700"></th>
            </tr>
          </thead>
          <tbody>
            {saleProducts.length === 0 ? (
              <tr>
                <td colSpan="5" className="px-4 py-2 text-center text-gray-500">
                  No hay productos agregados.
                </td>
              </tr>
            ) : (
              saleProducts.map((item, index) => (
                <tr key={index} className="border-b hover:bg-gray-50">
                  <td className="px-4 py-2 text-sm">{item.productName}</td>
                  <td className="px-4 py-2 text-sm">{item.units}</td>
                  <td className="px-4 py-2 text-sm">${item.productPrice.toFixed(2)}</td>
                  <td className="px-4 py-2 text-sm">${item.total.toFixed(2)}</td>
                  <td className="px-4 py-2 text-sm">
                    <button
                      onClick={() => handleEliminarProducto(index)}
                      className="text-red-600 hover:text-red-800"
                    >
                      🗑
                    </button>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>

      {/* Total y botón de Finalizar Venta */}
      <div className="flex justify-end items-center space-x-4">
        <div className="text-lg font-semibold">
          Total a pagar:{" "}
          <span className="font-bold">
            ${saleProducts.reduce((acc, item) => acc + item.total, 0).toFixed(2)}
          </span>
        </div>
        <button
          onClick={handleFinalizar}
          className="bg-sky-300 text-black px-4 py-2 rounded hover:bg-sky-400"
        >
          Finalizar
        </button>
      </div>
    </div>
  );
}

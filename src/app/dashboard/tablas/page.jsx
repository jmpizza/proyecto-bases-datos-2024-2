'use client';
import { useState } from 'react';
import ListaTablas from '@/app/components/listatablas';
import DatosTabla from '@/app/components/datostabla';

export default function Dashboard() {
  const [tablaSeleccionada, setTablaSeleccionada] = useState(null);
  const [columns, setColumns] = useState([]);
  const [inputData, setInputData] = useState('');
  const [selectedRow, setSelectedRow] = useState(null);
  const [updateData, setUpdateData] = useState('');
  const [refreshKey, setRefreshKey] = useState(0);

  const handleSelectTable = (nombreTabla) => {
    setTablaSeleccionada(nombreTabla);
    setColumns([]);
    setSelectedRow(null);
    setInputData('');
    setUpdateData('');
  };

  const handleInsert = async () => {
    if (!tablaSeleccionada) {
      alert("Seleccione una tabla");
      return;
    }
    if (!inputData.trim()) {
      alert("Ingrese datos separados por comas");
      return;
    }
    const values = inputData.split(',').map(s => s.trim());
    if (columns.length === 0) {
      alert("No se han cargado las columnas de la tabla");
      return;
    }
    if (values.length !== columns.length) {
      alert(`El número de datos (${values.length}) no coincide con el número de columnas (${columns.length}).`);
      return;
    }
    const datosObject = {};
    columns.forEach((col, index) => {
      datosObject[col] = values[index];
    });
    const payload = { tabla: tablaSeleccionada, datos: datosObject };

    try {
      const response = await fetch('/api/dashboard/tablas/datos', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      if (response.ok) {
        alert("Datos insertados correctamente");
        setInputData('');
        setRefreshKey(prev => prev + 1);
      } else {
        await response.json();
        alert("Error: Usted no tiene los permisos para realizar esta acción");
      }
    } catch (error) {
      console.error("Error al insertar datos:", error);
      alert("Error al insertar datos");
    }
  };

  // Cuando se selecciona una fila, se autocompleta el input de actualización
  const handleRowSelect = (row) => {
    setSelectedRow(row);
    if (columns.length > 0) {
      const values = columns.map(col => row[col]);
      setUpdateData(values.join(', '));
    }
  };

  const handleUpdate = async () => {
    if (!selectedRow) {
      alert("Seleccione una fila para actualizar");
      return;
    }
    if (!updateData.trim()) {
      alert("Ingrese datos separados por comas para actualizar");
      return;
    }
    const values = updateData.split(',').map(s => s.trim());
    if (values.length !== columns.length) {
      alert(`El número de datos (${values.length}) no coincide con el número de columnas (${columns.length}).`);
      return;
    }
    const datosObject = {};
    columns.forEach((col, index) => {
      datosObject[col] = values[index];
    });
    // Usar la primera columna como primary key
    if (columns.length === 0) {
      alert("No se han cargado las columnas de la tabla");
      return;
    }
    const primaryKey = columns[0];
    const recordId = selectedRow[primaryKey];
    if (!recordId) {
      alert("No se encontró la clave primaria en el registro seleccionado");
      return;
    }
    const payload = { tabla: tablaSeleccionada, id: recordId, datos: datosObject };

    try {
      const response = await fetch('/api/dashboard/tablas/datos', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      if (response.ok) {
        alert("Datos actualizados correctamente");
        setSelectedRow(null);
        setUpdateData('');
        setRefreshKey(prev => prev + 1);
      } else {
        const errorData = await response.json();
        alert("Error al actualizar: " + errorData.error);
      }
    } catch (error) {
      console.error("Error al actualizar datos:", error);
      alert("Error al actualizar datos");
    }
  };

  const handleDelete = async () => {
    if (!selectedRow) {
      alert("Seleccione una fila para eliminar");
      return;
    }
    if (columns.length === 0) {
      alert("No se han cargado las columnas de la tabla");
      return;
    }
    const primaryKey = columns[0];
    const recordId = selectedRow[primaryKey];
    if (!recordId) {
      alert("No se encontró la clave primaria en el registro seleccionado");
      return;
    }
    try {
      const response = await fetch(
        `/api/dashboard/tablas/datos?tabla=${encodeURIComponent(tablaSeleccionada)}&id=${recordId}`,
        { method: 'DELETE' }
      );
      if (response.ok) {
        alert("Datos eliminados correctamente");
        setSelectedRow(null);
        setUpdateData('');
        setRefreshKey(prev => prev + 1);
      } else {
        const errorData = await response.json();
        alert("Error al eliminar: " + errorData.error);
      }
    } catch (error) {
      console.error("Error al eliminar datos:", error);
      alert("Error al eliminar datos");
    }
  };

  return (
    <div className="flex h-[90vh]">
      <ListaTablas onSelectTable={handleSelectTable} selectedTable={tablaSeleccionada} />
      <div className="flex flex-col flex-grow">
        <DatosTabla
          tablaSeleccionada={tablaSeleccionada}
          onColumnsLoaded={setColumns}
          onRowSelect={handleRowSelect}
          refreshKey={refreshKey}
        />
        {tablaSeleccionada && (
          <div className="pt-4 border-t border-gray-300 flex flex-col space-y-4 px-4">
            {/* Sección de Insertar */}
            <div className="flex items-center">
              <input
                type="text"
                placeholder="Ingrese datos separados por comas"
                value={inputData}
                onChange={(e) => setInputData(e.target.value)}
                className="p-2 w-2/3 mr-2 border rounded"
              />
              <button onClick={handleInsert} className="p-2 px-4 bg-blue-500 text-white rounded">
                Insertar
              </button>
            </div>
            {/* Sección de Actualizar / Eliminar */}
            {selectedRow && (
              <div className="flex items-center space-x-2">
                <input
                  type="text"
                  placeholder="Datos para actualizar"
                  value={updateData}
                  onChange={(e) => setUpdateData(e.target.value)}
                  className="p-2 w-2/3 mr-2 border rounded"
                />
                <button onClick={handleUpdate} className="p-2 px-4 bg-blue-500 text-white rounded">
                  Modificar
                </button>
                <button onClick={handleDelete} className="p-2 px-4 bg-red-500 text-white rounded">
                  Eliminar
                </button>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

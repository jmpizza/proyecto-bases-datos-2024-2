'use client';
import { useState } from 'react';
import ListaTablas from '@/app/components/listatablas';
import DatosTabla from '@/app/components/datostabla';

export default function Dashboard() {
  const [tablaSeleccionada, setTablaSeleccionada] = useState(null);

  const handleSelectTable = (nombreTabla) => {
    setTablaSeleccionada(nombreTabla);
  };

  return (
    <div style={{ display: 'flex', height: '100vh' }}>
      <ListaTablas onSelectTable={handleSelectTable} selectedTable={tablaSeleccionada} />
      <DatosTabla tablaSeleccionada={tablaSeleccionada} />
    </div>
  );
}

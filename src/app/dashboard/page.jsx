'use client';

export default function Dashboard() {
  return (
    <div
      className="h-[90vh] flex items-center justify-center"
      style={{
        backgroundImage:
          "linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.3)), url('/fondoPan2.jpg')",
        backgroundSize: "cover",
        backgroundPosition: "center",
      }}
    >
      <div className="text-center max-w-2xl px-4">
        <h1 className="text-white text-4xl font-bold mb-4">Dashboard</h1>
        <p className="text-white text-lg mb-2">
          Bienvenido al Dashboard de El Buen Gusto. Esta es tu herramienta central para gestionar y supervisar las operaciones diarias de la panadería.
        </p>
        <p className="text-white text-lg">
          Utiliza la barra lateral para navegar entre las secciones: ventas, tablas, recetas y más. Aquí encontrarás la información necesaria para optimizar el trabajo y tomar decisiones basadas en datos actualizados.
        </p>
      </div>
    </div>
  );
}

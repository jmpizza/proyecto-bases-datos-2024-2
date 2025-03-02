'use client';

export default function Inicio() {
  return (
    <div
      className="h-[94vh] flex items-center justify-center"
      style={{
        backgroundImage: "linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.2)), url('/fondoPan.jpg')",
        backgroundSize: "cover",
        backgroundPosition: "center",
      }}
    >
      <div className="text-center max-w-2xl px-4">
        <h1 className="text-white text-4xl font-bold mb-4">
          Bienvenido a El Buen Gusto
        </h1>
        <p className="text-white text-lg mb-2">
          Este sistema integral está diseñado para optimizar la gestión diaria de nuestra panadería y pastelería en Bogotá. 
        </p>
        <p className="text-white text-lg">
          Principalmente pensado para nuestros empleados, aquí también podrán encontrar información relevante sobre sus compras como cliente.
        </p>
      </div>
    </div>
  );
}

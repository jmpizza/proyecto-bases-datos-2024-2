'use client';

export default function Contacto() {
  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-4">Información del Proyecto</h1>
      <p className="mb-2 text-lg">
        Este proyecto fue desarrollado por los estudiantes de bases de datos de la Universidad Nacional de Colombia.
      </p>
      <p className="mb-1 text-lg">
        <strong>Juan Manuel Espitia Pizza</strong> -{" "}
        <a href="mailto:jespitiap@unal.edu.co" className="text-blue-500 underline">
          jespitiap@unal.edu.co
        </a>
      </p>
      <p className="mb-4 text-lg">
        <strong>Yeswah Gonzales Tapia</strong> -{" "}
        <a href="mailto:yegonzalezt@unal.edu.co" className="text-blue-500 underline">
          yegonzalezt@unal.edu.co
        </a>
      </p>
      <p className="text-lg">
        Todo el proyecto se encuentra disponible en:{" "}
        <a
          href="https://github.com/jmpizza/proyecto-bases-datos-2024-2"
          target="_blank"
          rel="noopener noreferrer"
          className="text-blue-500 underline font-medium"
        >
          https://github.com/jmpizza/proyecto-bases-datos-2024-2
        </a>
      </p>
    </div>
  );
}

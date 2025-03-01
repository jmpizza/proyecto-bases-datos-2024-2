'use client';
import Image from "next/image";
import { useRouter } from "next/navigation";

export default function Dashnavbar() {
  const router = useRouter();

  const handleLogout = async () => {
    try {
      const res = await fetch("/api/auth/logout", {
        method: "POST",
        credentials: "include", // Asegura que las cookies se envíen
      });

      if (res.ok) {
        router.refresh(); // Recarga la página para aplicar cambios en la sesión
        router.push("/");
      } else {
        console.error("Error al cerrar sesión");
      }
    } catch (error) {
      console.error("Error en logout:", error);
    }
  };

  return (
    <nav className="bg-yellow-300 text-black p-4 shadow-md">
      <div className='w-full flex items-center'>
        <Image src="/logoElBuenGusto.png" alt="Logo" width={50} height={40} priority />
        <ul className="flex ml-auto items-center space-x-4">
          <li>
            <button 
              onClick={handleLogout}
              className='bg-sky-300 hover:bg-sky-400 px-4 py-2 rounded-lg'
            >
              Cerrar sesión
            </button>
          </li>
        </ul>
      </div>
    </nav>
  );
}

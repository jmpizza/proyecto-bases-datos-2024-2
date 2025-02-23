import Link from "next/link";
import Image from "next/image";

export default function Navbar() {
  return (
    <nav className="bg-yellow-300 text-black p-4 shadow-md">
      <div className="w-full flex items-center px-4">
        {/* Logo pegado a la izquierda */}
        <Link href="/" className="text-xl font-bold">
            <Image src="/logoElBuenGusto.png" alt="Logo" width={50} height={40} priority />
        </Link>

        {/* Opciones pegadas a la derecha */}
        <ul className="flex ml-auto items-center space-x-4">
          <li>
            <Link href="/" className="hover:text-gray-600">
              Inicio
            </Link>
          </li>
          <li>
            <Link href="/compras" className="hover:text-gray-600">
              Consultar mis compras
            </Link>
          </li>
          <li>
            <Link href="/contacto" className="hover:text-gray-600">
              Contacto
            </Link>
          </li>
          <li>
            <Link
              href="/sesion"
              className="bg-sky-300 px-4 py-2 rounded-lg hover:bg-sky-400"
            >
              Iniciar Sesión
            </Link>
          </li>
        </ul>
      </div>
    </nav>
  );
}

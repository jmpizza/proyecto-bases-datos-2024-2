import Link from "next/link";
import Image from "next/image";

export default function Dashnavbar() {
  return (
    <nav className="bg-yellow-300 text-black p-4 shadow-md">
      <div className='w-full flex'>
        <Image src="/logoElBuenGusto.png" alt="Logo" width={50} height={40} priority />
        <ul className="flex ml-auto items-center space-x-4">
          <li>
            <Link href='/' className='bg-sky-300 hover:bg-sky-400 px-4 py-2 rounded-lg'>
             Cerrar sesión
            </Link>
          </li>
        </ul>
      </div>
    </nav>
  )
}
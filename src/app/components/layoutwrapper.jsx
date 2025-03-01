"use client"; 
import { usePathname } from "next/navigation";
import "../globals.css";
import Navbar from "./navbar";

export default function Layoutwrapper({ children }) {
  const pathname = usePathname();
  const isDashboard = pathname.startsWith("/dashboard"); // Verifica si está en /dashboard

  return (
    <>
      {!isDashboard && <Navbar />} {/* Solo muestra Navbar fuera de /dashboard */}
      <main>{children}</main>
    </>
  );
}

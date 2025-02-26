import Dashnavbar from "@/app/components/dashnavbar";
import Sidebar from "@/app/components/sidebar";
import { Geist, Geist_Mono } from "next/font/google";
import "../globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata = {
  title: "Dashboard | ElBuenGusto",
  description: "Panel de administración de ElBuenGusto",
};

export default function DashboardLayout({ children }) {
  return (
    <div className={`${geistSans.variable} ${geistMono.variable} antialiased`}>
      <Dashnavbar />
      <div className="flex">
        <Sidebar />
        <main className="flex-grow p-6">{children}</main>
      </div>
    </div>
  );
}


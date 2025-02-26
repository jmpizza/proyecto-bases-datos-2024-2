import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import Layoutwrapper from "./components/layoutwrapper";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata = {
  title: "ElBuenGusto",
  description: "Página para el buen gusto",
};

export default function RootLayout({ children }) {
  return (
    <html lang="es">
      <body className={`${geistSans.variable} ${geistMono.variable} antialiased`}>
        <Layoutwrapper>{children}</Layoutwrapper>
      </body>
    </html>
  );
}

import mysql from "mysql2/promise";

const rootPool = mysql.createPool({
  host: process.env.DB_HOST || "localhost",
  port: process.env.DB_PORT || 3307,
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "root",
  database: process.env.DB_NAME || "elbuengusto",
});

const credentials = {
  GERENTE: { user: "gerente", password: "Gerente123" },
  CAJERO: { user: "cajero", password: "Cajero123" },
  PANADERO: { user: "panadero", password: "Panadero123" },
  PASTELERO: { user: "pastelero", password: "Pastelero123" },
  cliente: { user: "cliente", password: "Cliente123" },
};

export async function getUserPool(req) {
  try {
    const cookieHeader = req.headers.get("cookie") || "";
    const response = await fetch("http://localhost:3000/api/auth/role", {
      headers: { cookie: cookieHeader },
    });
    
    const data = await response.json();
    const role = data.role || "cliente";
    
    return mysql.createPool({
      host: process.env.DB_HOST || "localhost",
      port: process.env.DB_PORT || 3307,
      user: credentials[role].user,
      password: credentials[role].password,
      database: process.env.DB_NAME || "elbuengusto",
    });
  } catch (error) {
    console.error("Error obteniendo el rol:", error);
    return mysql.createPool({
      host: process.env.DB_HOST || "localhost",
      port: process.env.DB_PORT || 3307,
      user: "cliente",
      password: "Cliente123",
      database: process.env.DB_NAME || "elbuengusto",
    });
  }
}

export function getRootPool() {
  return rootPool;
}

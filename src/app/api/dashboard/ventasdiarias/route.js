import { getRootPool } from "@/lib/db";

export async function GET(req) {
  try {
    const url = new URL(req.url);
    const fecha = url.searchParams.get("fecha"); // puede ser null
    const pool = await getRootPool();
    if (!pool) {
      throw new Error("No se pudo obtener la conexión a la base de datos");
    }
    // Se llama al procedimiento almacenado. Si fecha es null, se pasa NULL para que use CURDATE()
    const [rows] = await pool.query("CALL CierreCajaDiario(?)", [fecha ? fecha : null]);
    // MySQL devuelve los resultados en rows[0]
    return new Response(JSON.stringify(rows[0]), {
      status: 200,
      headers: { "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Error en ventas diarias:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
}

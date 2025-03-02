import { getRootPool, getUserPool } from "@/lib/db";

export async function GET(req) {
  try {
    const pool = await getRootPool();
    if (!pool) {
      throw new Error("No se pudo obtener la conexión a la base de datos");
    }
    const [rows] = await pool.query(
      "SELECT pro_codigo, pro_nombre, pro_precio_venta FROM `ElBuenGusto`.`PRODUCTO`"
    );

    return new Response(JSON.stringify(rows), {
      status: 200,
      headers: { "Content-Type": "application/json" },
    });
    
  } catch (error) {
    console.error("Error al obtener datos del producto:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
}


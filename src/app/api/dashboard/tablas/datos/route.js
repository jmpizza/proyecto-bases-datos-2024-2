import { getRootPool } from "@/lib/db";

export async function GET(req) {
  try {
    const url = new URL(req.url);
    const tableName = url.searchParams.get("tabla");

    if (!tableName) {
      return new Response(JSON.stringify({ error: "Debe proporcionar el nombre de la tabla" }), {
        status: 400,
        headers: { "Content-Type": "application/json" },
      });
    }

    const pool = getRootPool();
    if (!pool) {
      throw new Error("No se pudo obtener la conexión a la base de datos");
    }

    const [rows] = await pool.query(`SELECT * FROM ??`, [tableName]);

    return new Response(JSON.stringify(rows), {
      status: 200,
      headers: { "Content-Type": "application/json" },
    });

  } catch (error) {
    console.error("Error al obtener los datos de la tabla:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
}

import { getRootPool } from "@/lib/db";

export async function GET(req) {
  try {
    const url = new URL(req.url);
    const nombre_producto = url.searchParams.get("nombre_producto");

    if (!nombre_producto) {
      return new Response(
        JSON.stringify({ error: "Debe proporcionar un producto" }),
        { status: 400, headers: { "Content-Type": "application/json" } }
      );
    }

    const pool = await getRootPool();
    if (!pool) {
      throw new Error("No se pudo obtener la conexión a la base de datos");
    }

    // Llamamos al procedimiento almacenado
    const [rows] = await pool.query("CALL ConsultarRecetas(?)", [nombre_producto]);
    // Los resultados reales están en rows[0]
    return new Response(JSON.stringify(rows[0]), {
      status: 200,
      headers: { "Content-Type": "application/json" }
    });
    
  } catch (error) {
    console.error("Error al consultar recetas:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" }
    });
  }
}

import pool from '@/lib/db';

export async function GET() {
  try {
    const [rows] = await pool.query("call ObtenerVentas(101123456);");
    return Response.json({ tables: rows });
  } catch (error) {
    return Response.json({ error: error.message }, { status: 500 });
  }
}

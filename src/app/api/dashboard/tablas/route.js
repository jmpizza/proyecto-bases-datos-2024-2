import { getUserPool } from '@/lib/db';

export async function GET(req) {
  try {
    const pool = await getUserPool(req);
    const [rows] = await pool.query("SHOW TABLES");
    return Response.json({ tables: rows });
  } catch (error) {
    return Response.json({ error: "Acceso no autorizado" }, { status: 403 });
  }
}

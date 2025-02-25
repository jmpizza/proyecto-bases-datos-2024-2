import pool from '@/lib/db';

export async function GET(request) {
  try {
    const { searchParams } = new URL(request.url);
    const documento = searchParams.get('documento');

    if (!documento) {
      return Response.json({ error: 'Documento es requerido' }, { status: 400 });
    }

    const [rows] = await pool.query('CALL ObtenerVentas(?)', [documento]);
    return Response.json({ tables: rows });
  } catch (error) {
    return Response.json({ error: error.message }, { status: 500 });
  }
}

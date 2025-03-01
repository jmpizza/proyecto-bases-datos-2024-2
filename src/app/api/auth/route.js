import { getRootPool } from "@/lib/db";

export async function POST(request) {
  try {
    const { documento, password } = await request.json();
    const pool = getRootPool();

    const [rows] = await pool.query(
      "SELECT usr_rol FROM USUARIO WHERE per_documento = ? AND usr_clave = ?",
      [documento, password]
    );

    if (rows.length === 0) {
      return Response.json({ error: "Credenciales inválidas" }, { status: 401 });
    }

    const userRole = rows[0].usr_rol;

    return Response.json(
      { message: "Inicio de sesión exitoso", role: userRole },
      { status: 200, headers: { "Set-Cookie": `role=${userRole}; Path=/; HttpOnly` } }
    );
  } catch (error) {
    return Response.json({ error: error.message }, { status: 500 });
  }
}

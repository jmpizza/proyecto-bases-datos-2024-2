import { getRootPool } from "@/lib/db";
import jwt from 'jsonwebtoken';
import { serialize } from "cookie";

export async function POST(req) { 
  try {
    const { documento, password } = await req.json(); 
    const pool = getRootPool();
    
    const [rows] = await pool.query(
      "SELECT usr_rol FROM USUARIO WHERE per_documento = ? AND usr_clave = ?",
      [documento, password]
    );

    if (rows.length === 0) {
      return Response.json({ error: "Credenciales inválidas" }, { status: 401 });
    }

    const userRole = rows[0].usr_rol;
    const token = jwt.sign(
      {
        exp: Math.floor(Date.now() / 1000) + 60 * 60 * 24 * 7,
        username: documento,
        role: userRole,
      },
      'secret'
    );

    const serialized = serialize('loginToken', token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'strict',
      maxAge: 60 * 60 * 24 * 7,
      path: '/',
    });

    return new Response(JSON.stringify({ message: "Sesión iniciada correctamente" }), {
      status: 200,
      headers: { 'Set-Cookie': serialized, 'Content-Type': 'application/json' },
    });

  } catch (error) {
    return Response.json({ error: error.message }, { status: 500 });
  }
}

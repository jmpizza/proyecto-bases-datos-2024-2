import { NextResponse } from "next/server";
import { serialize } from "cookie";
import jwt from "jsonwebtoken";

export async function POST(req) {
  const loginToken = req.cookies.get("loginToken")?.value;

  if (!loginToken) {
    return NextResponse.json({ message: "No hay sesión activa" }, { status: 401 });
  }

  try {
    const decoded = jwt.verify(loginToken, "secret");

    const newToken = jwt.sign(
      {
        exp: Math.floor(Date.now() / 1000) + 60 * 60 * 8, 
        username: decoded.username,
        role: "cliente",
      },
      "secret"
    );

    const serialized = serialize("loginToken", newToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === "production",
      sameSite: "strict",
      maxAge: 1000 * 60 * 60 * 8,
      path: "/",
    });

    const response = NextResponse.json({ message: "Rol cambiado a cliente" });
    response.headers.set("Set-Cookie", serialized);
    return response;
  } catch (error) {
    return NextResponse.json({ error: "Token inválido" }, { status: 401 });
  }
}

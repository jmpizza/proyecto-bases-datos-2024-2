import { verify } from "jsonwebtoken";
import { NextResponse } from "next/server";
import { cookies } from "next/headers";

export const GET = async () => {
  try {
    const cookieStore = await Promise.resolve(cookies());
    const token = cookieStore.get("loginToken")?.value;

    if (!token) {
      return new NextResponse(
        JSON.stringify({ error: "No se encontró token", role: "cliente" }),
        { status: 401, headers: { "Content-Type": "application/json" } }
      );
    }

    const decoded = verify(token, "secret");
    const role = decoded.role;

    return new NextResponse(
      JSON.stringify({ role }),
      { status: 200, headers: { "Content-Type": "application/json" } }
    );
  } catch (error) {
    console.error("Error verificando token:", error);
    return new NextResponse(
      JSON.stringify({ error: "Token inválido", role: "cliente" }),
      { status: 401, headers: { "Content-Type": "application/json" } }
    );
  }
};

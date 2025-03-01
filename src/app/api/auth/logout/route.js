import { NextResponse } from "next/server";

export async function POST() {
  const response = NextResponse.json({ message: "Logout exitoso" });
  response.cookies.set("role", "cliente", { path: "/" });
  return response;
}

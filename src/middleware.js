import { NextResponse } from "next/server";
import { verify } from "jsonwebtoken";

export async function middleware(request) {
    const jwt = request.cookies.get('loginToken');
    if(jwt == undefined){
        return NextResponse.redirect(new URL('/login', request.url))
    }
    const cookieHeader = request.headers.get("cookie") || "";
    const response = await fetch("http://localhost:3000/api/auth/role", {
      headers: { cookie: cookieHeader },
    });
    
    const data = await response.json();
    const role = data.role || "cliente";
    if(role == 'GERENTE' || role == 'PANADERO' || role == 'PASTELERO' || role == 'CAJERO'){
        return NextResponse.next();
    }
    return NextResponse.redirect(new URL('/', request.url))
}

export const config = {
    matcher: "/dashboard/:path*",
}
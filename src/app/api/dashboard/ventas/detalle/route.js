import { getUserPool } from "@/lib/db";

export async function POST(req) {
  try {
    const data = await req.json();

    // Validación básica de la información de venta y detalle
    if (!data.venta || typeof data.venta !== "object") {
      return new Response(
        JSON.stringify({ error: "Datos de venta faltantes o mal formateados" }),
        { status: 400, headers: { "Content-Type": "application/json" } }
      );
    }
    if (!data.detalle || !Array.isArray(data.detalle) || data.detalle.length === 0) {
      return new Response(
        JSON.stringify({ error: "Debe proporcionar al menos un detalle de venta" }),
        { status: 400, headers: { "Content-Type": "application/json" } }
      );
    }

    const venta = data.venta;
    // Se validan solo los campos requeridos para el procedimiento
    const requiredVentaFields = [
      "ven_precio_total",
      "ven_tipo_pago",
      "ven_tipo",
      "ven_direccion",
      "per_documento",
      "pes_documento"
    ];
    for (const field of requiredVentaFields) {
      if (venta[field] === undefined || venta[field] === null) {
        return new Response(
          JSON.stringify({ error: `El campo ${field} de venta es requerido` }),
          { status: 400, headers: { "Content-Type": "application/json" } }
        );
      }
    }

    for (let i = 0; i < data.detalle.length; i++) {
      const det = data.detalle[i];
      if (det.det_cantidad_producto === undefined || det.det_cantidad_producto === null) {
        return new Response(
          JSON.stringify({ error: `El campo det_cantidad_producto es requerido en el detalle ${i + 1}` }),
          { status: 400, headers: { "Content-Type": "application/json" } }
        );
      }
    }

    const pool = await getUserPool(req);
    if (!pool) {
      throw new Error("No se pudo obtener la conexión a la base de datos");
    }

    const connection = await pool.getConnection();
    try {
      await connection.beginTransaction();

      // Llamada al procedimiento almacenado RegistrarVenta
      // Parámetros: precio_total, tipo_pago, tipo_venta, direccion, documento_cliente, documento_empleado
      await connection.query(
        "CALL RegistrarVenta(?, ?, ?, ?, ?, ?)",
        [
          venta.ven_precio_total,
          venta.ven_tipo_pago,
          venta.ven_tipo,
          venta.ven_direccion,
          venta.per_documento,
          venta.pes_documento
        ]
      );
      // Obtener el ID insertado
      const [idResult] = await connection.query("SELECT LAST_INSERT_ID() as ven_id_venta");
      const ven_id_venta = idResult[0].ven_id_venta;

      // Para cada detalle, llamar al procedimiento RegistrarDetalleVenta
      // Parámetros: id_venta, cantidad_producto, codigo_producto, id_promocion
      for (const det of data.detalle) {
        const pro_codigo = det.pro_codigo !== undefined ? det.pro_codigo : null;
        const prm_id = det.prm_id !== undefined ? det.prm_id : null;
        await connection.query(
          "CALL RegistrarDetalleVenta(?, ?, ?, ?)",
          [ven_id_venta, det.det_cantidad_producto, pro_codigo, prm_id]
        );
      }

      await connection.commit();
      connection.release();

      return new Response(JSON.stringify({ ven_id_venta }), {
        status: 201,
        headers: { "Content-Type": "application/json" }
      });
    } catch (err) {
      await connection.rollback();
      connection.release();
      throw err;
    }
  } catch (error) {
    console.error("Error al insertar venta y detalle:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" }
    });
  }
}

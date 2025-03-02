import { getRootPool } from "@/lib/db";

export async function POST(req) {
  try {
    const data = await req.json();

    // Validación básica de la información de venta y detalle
    if (!data.venta || typeof data.venta !== 'object') {
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
    const requiredVentaFields = [
      "ven_precio_total",
      "ven_hora",
      "ven_fecha",
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

    const pool = await getRootPool();
    if (!pool) {
      throw new Error("No se pudo obtener la conexión a la base de datos");
    }

    const connection = await pool.getConnection();
    try {
      await connection.beginTransaction();

      const [ventaResult] = await connection.query(
        "INSERT INTO `ElBuenGusto`.`VENTA` (ven_precio_total, ven_hora, ven_fecha, ven_tipo_pago, ven_tipo, ven_direccion, per_documento, pes_documento) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        [
          venta.ven_precio_total,
          venta.ven_hora,
          venta.ven_fecha,
          venta.ven_tipo_pago,
          venta.ven_tipo,
          venta.ven_direccion,
          venta.per_documento,
          venta.pes_documento
        ]
      );
      const ven_id_venta = ventaResult.insertId;

      for (const det of data.detalle) {
        const pro_codigo = det.pro_codigo !== undefined ? det.pro_codigo : null;
        const prm_id = det.prm_id !== undefined ? det.prm_id : null;
        const pre_codigo = det.pre_codigo !== undefined ? det.pre_codigo : null;

        await connection.query(
          "INSERT INTO `ElBuenGusto`.`DETALLE_VENTA` (ven_id_venta, det_cantidad_producto, pro_codigo, prm_id, pre_codigo) VALUES (?, ?, ?, ?, ?)",
          [ven_id_venta, det.det_cantidad_producto, pro_codigo, prm_id, pre_codigo]
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

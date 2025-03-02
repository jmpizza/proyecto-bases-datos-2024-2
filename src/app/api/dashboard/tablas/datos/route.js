import { getRootPool, getUserPool } from "@/lib/db";

export async function GET(req) {
  try {
    const url = new URL(req.url);
    const tableName = url.searchParams.get("tabla");

    if (!tableName) {
      return new Response(
        JSON.stringify({ error: "Debe proporcionar el nombre de la tabla" }),
        {
          status: 400,
          headers: { "Content-Type": "application/json" },
        }
      );
    }

    const pool = await getUserPool(req);
    if (!pool) {
      throw new Error("No se pudo obtener la conexión a la base de datos");
    }

    const [rows] = await pool.query(`SELECT * FROM ??`, [tableName]);

    return new Response(JSON.stringify(rows), {
      status: 200,
      headers: { "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Error al obtener los datos de la tabla:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
}

export async function POST(req) {
  try {
    const { tabla, datos } = await req.json();

    if (!tabla) {
      return new Response(
        JSON.stringify({ error: "Debe proporcionar el nombre de la tabla" }),
        {
          status: 400,
          headers: { "Content-Type": "application/json" },
        }
      );
    }

    if (!datos || typeof datos !== "object") {
      return new Response(
        JSON.stringify({
          error: "Debe proporcionar los datos a insertar en formato de objeto",
        }),
        {
          status: 400,
          headers: { "Content-Type": "application/json" },
        }
      );
    }

    const pool = await getUserPool(req);
    if (!pool) {
      throw new Error("No se pudo obtener la conexión a la base de datos");
    }

    const [result] = await pool.query("INSERT INTO ?? SET ?", [tabla, datos]);

    return new Response(JSON.stringify({ insertedId: result.insertId }), {
      status: 201,
      headers: { "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Error al insertar datos en la tabla:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
}

export async function DELETE(req) {
  try {
    const url = new URL(req.url);
    const tableName = url.searchParams.get("tabla");
    const id = url.searchParams.get("id");

    if (!tableName) {
      return new Response(
        JSON.stringify({ error: "Debe proporcionar el nombre de la tabla" }),
        { status: 400, headers: { "Content-Type": "application/json" } }
      );
    }

    if (!id) {
      return new Response(
        JSON.stringify({ error: "Debe proporcionar el id para eliminar" }),
        { status: 400, headers: { "Content-Type": "application/json" } }
      );
    }

    const pool = await getUserPool(req);
    if (!pool) {
      throw new Error("No se pudo obtener la conexión a la base de datos");
    }

    const primaryKeyMapping = {
      'tabla1': 'id',
      'usuarios': 'user_id',
    };

    let primaryKey = primaryKeyMapping[tableName];
    if (!primaryKey) {
      const [cols] = await pool.query("SHOW COLUMNS FROM ??", [tableName]);
      if (cols.length === 0) {
        throw new Error(`No se pudieron obtener las columnas de la tabla ${tableName}`);
      }
      primaryKey = cols[0].Field;
    }

    const [result] = await pool.query("DELETE FROM ?? WHERE ?? = ?", [
      tableName,
      primaryKey,
      id,
    ]);

    return new Response(JSON.stringify({ affectedRows: result.affectedRows }), {
      status: 200,
      headers: { "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Error al eliminar datos en la tabla:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
}

export async function PUT(req) {
  try {
    const { tabla, id, datos } = await req.json();

    if (!tabla) {
      return new Response(
        JSON.stringify({ error: "Debe proporcionar el nombre de la tabla" }),
        { status: 400, headers: { "Content-Type": "application/json" } }
      );
    }

    if (!id) {
      return new Response(
        JSON.stringify({ error: "Debe proporcionar el id para actualizar" }),
        { status: 400, headers: { "Content-Type": "application/json" } }
      );
    }

    if (!datos || typeof datos !== "object") {
      return new Response(
        JSON.stringify({ error: "Debe proporcionar los datos a actualizar en formato de objeto" }),
        { status: 400, headers: { "Content-Type": "application/json" } }
      );
    }

    const pool = await getUserPool(req);
    if (!pool) {
      throw new Error("No se pudo obtener la conexión a la base de datos");
    }

    // Mapeo de tabla a clave primaria (opcional)
    const primaryKeyMapping = {
      'tabla1': 'id',
      'usuarios': 'user_id',
    };

    let primaryKey = primaryKeyMapping[tabla];
    if (!primaryKey) {
      // Si no existe mapeo, se consulta la primera columna de la tabla
      const [cols] = await pool.query("SHOW COLUMNS FROM ??", [tabla]);
      if (cols.length === 0) {
        throw new Error(`No se pudieron obtener las columnas de la tabla ${tabla}`);
      }
      primaryKey = cols[0].Field;
    }

    const [result] = await pool.query("UPDATE ?? SET ? WHERE ?? = ?", [
      tabla,
      datos,
      primaryKey,
      id,
    ]);

    return new Response(JSON.stringify({ affectedRows: result.affectedRows }), {
      status: 200,
      headers: { "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Error al actualizar datos en la tabla:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
}


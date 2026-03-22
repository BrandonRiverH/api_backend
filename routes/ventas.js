// routes/ventas.js
const express = require("express");
const router = express.Router();
const db = require("../db"); // debe exportar pool mysql2/promise

// -----------------------------
// CREAR VENTA
// -----------------------------
router.post("/ventas", async (req, res) => {
  const { productos, total, id_usuario } = req.body;

  console.log("📦 BODY RECIBIDO:", { productos, total, id_usuario });

  if (!Array.isArray(productos) || productos.length === 0) {
    console.log("❌ No llegaron productos");
    return res.status(400).json({ error: "No hay productos" });
  }

  let conn;
  try {
    conn = await db.getConnection();
    await conn.beginTransaction();

    // Si total no viene o no es número, calcularlo desde productos
    let totalNumber;
    if (total === null || total === undefined || isNaN(Number(total))) {
      totalNumber = productos.reduce((s, it) => {
        const precio = Number(it.precio ?? it.precio_unitario ?? it.precio_venta ?? 0);
        const cantidad = Number(it.cantidad ?? 0);
        return s + precio * cantidad;
      }, 0);
      totalNumber = +totalNumber.toFixed(2);
      console.log("ℹ Total calculado desde productos:", totalNumber);
    } else {
      totalNumber = +Number(total).toFixed(2);
    }

    // 1) Insertar en tabla ventas
    const [ventaResult] = await conn.query(
      "INSERT INTO ventas (total, fecha, id_usuario) VALUES (?, NOW(), ?)",
      [totalNumber, id_usuario ?? null]
    );
    const idVenta = ventaResult.insertId;
    console.log("✅ Venta creada:", idVenta);

    // 2) Insertar cada detalle y descontar stock
    for (const item of productos) {
      const id_producto = item.id_producto ?? item.id;
      const cantidad = Number(item.cantidad ?? 0);
      // aceptar precios en distintos campos y en string
      const precio_unitario = Number(item.precio ?? item.precio_unitario ?? item.precio_venta ?? 0);
      const subtotal = +(precio_unitario * cantidad).toFixed(2);

      console.log("➡ Insertando detalle:", {
        id_producto,
        cantidad,
        precio_unitario,
        subtotal,
      });

      // Insert detalle
      await conn.query(
        `INSERT INTO venta_detalles
          (id_venta, id_producto, cantidad, precio_unitario, subtotal)
          VALUES (?, ?, ?, ?, ?)`,
        [idVenta, id_producto, cantidad, precio_unitario, subtotal]
      );

      // Actualizar stock (si tu tabla productos tiene columna 'stock')
      await conn.query(
        `UPDATE productos
           SET stock = stock - ?
         WHERE id_producto = ?`,
        [cantidad, id_producto]
      );
    }

    await conn.commit();

    return res.json({
      success: true,
      message: "Venta creada",
      id_venta: idVenta,
    });
  } catch (error) {
    if (conn) await conn.rollback();
    console.error("❌ ERROR creando venta:", error);
    return res.status(500).json({ error: "Error creando venta", details: error.toString() });
  } finally {
    if (conn) conn.release();
  }
});

// -----------------------------
// OBTENER TICKET POR ID
// -----------------------------
router.get("/ventas/:id", async (req, res) => {
  const { id } = req.params;

  try {
    // obtener venta
    const [ventaRows] = await db.query("SELECT * FROM ventas WHERE id_venta = ?", [id]);
    const venta = ventaRows[0] ?? null;

    // obtener detalles (y nombre de producto)
    const [detalleRows] = await db.query(
      `SELECT vd.*, p.nombre
       FROM venta_detalles vd
       LEFT JOIN productos p ON vd.id_producto = p.id_producto
       WHERE vd.id_venta = ?`,
      [id]
    );

    return res.json({
      venta,
      productos: detalleRows,
    });
  } catch (err) {
    console.error("❌ Error obteniendo ticket:", err);
    return res.status(500).json({ message: "Error obteniendo ticket", error: err.toString() });
  }
});

// -----------------------------
// (Opcional) LISTAR VENTAS
// -----------------------------
router.get("/ventas", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM ventas ORDER BY fecha DESC LIMIT 200");
    return res.json(rows);
  } catch (err) {
    console.error("❌ Error listando ventas:", err);
    return res.status(500).json({ message: "Error listando ventas", error: err.toString() });
  }
});

module.exports = router;
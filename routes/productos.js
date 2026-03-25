const express = require("express");
const router = express.Router();
const db = require("../db");
 
// ─── GET ─────────────────────────────────────────────────
router.get("/", async (req, res) => {
  console.log("📥 GET /productos");
  try {
    const [rows] = await db.query(
      "SELECT * FROM productos WHERE activo = 1 ORDER BY nombre"
    );
    console.log("✅ GET OK — productos:", rows.length);
    res.json(rows);
  } catch (err) {
    console.log("❌ GET ERROR:", err.code, err.message);
    res.status(500).json({ error: err.message });
  }
});
 
// ─── POST ────────────────────────────────────────────────
router.post("/", async (req, res) => {
  console.log("📥 POST /productos — body:", {
    nombre: req.body?.nombre,
    precio: req.body?.precio,
    stock: req.body?.stock,
    fecha_caducidad: req.body?.fecha_caducidad,
    imagen: req.body?.imagen ? `[${Math.round(req.body.imagen.length / 1024)}KB]` : null,
  });
 
  try {
    const { nombre, precio, stock, fecha_caducidad, imagen } = req.body || {};
 
    if (!nombre || !precio) {
      console.log("⚠️ Faltan nombre o precio");
      return res.status(400).json({ error: "Nombre y precio son obligatorios" });
    }
 
    const precioNum = parseFloat(precio);
    if (isNaN(precioNum)) {
      return res.status(400).json({ error: "Precio inválido" });
    }
 
    const [result] = await db.query(
      `INSERT INTO productos 
       (nombre, precio_venta, stock, fecha_caducidad, imagen, activo)
       VALUES (?, ?, ?, ?, ?, 1)`,
      [
        nombre,
        precioNum,
        parseInt(stock) || 0,
        fecha_caducidad || null,
        imagen || null,
      ]
    );
 
    console.log("✅ POST OK — id:", result.insertId);
    res.json({ ok: true, id: result.insertId });
 
  } catch (err) {
    console.log("❌ POST ERROR:", err.code, err.message);
    res.status(500).json({ error: err.message, code: err.code });
  }
});
 
// ─── PUT ─────────────────────────────────────────────────
router.put("/:id", async (req, res) => {
  const { id } = req.params;
  console.log("📥 PUT /productos/:id", id, "— body:", {
    nombre: req.body?.nombre,
    precio: req.body?.precio,
    stock: req.body?.stock,
    fecha_caducidad: req.body?.fecha_caducidad,
    imagen: req.body?.imagen ? `[${Math.round(req.body.imagen.length / 1024)}KB]` : null,
  });
 
  try {
    const { nombre, precio, stock, fecha_caducidad, imagen } = req.body || {};
 
    if (!nombre || !precio) {
      console.log("⚠️ Faltan nombre o precio");
      return res.status(400).json({ error: "Nombre y precio son obligatorios" });
    }
 
    const [result] = await db.query(
      `UPDATE productos
       SET nombre=?, precio_venta=?, stock=?, fecha_caducidad=?, imagen=?
       WHERE id_producto=?`,
      [
        nombre,
        parseFloat(precio),
        parseInt(stock) || 0,
        fecha_caducidad || null,
        imagen || null,
        id,
      ]
    );
 
    if (result.affectedRows === 0) {
      console.log("⚠️ Producto no encontrado, id:", id);
      return res.status(404).json({ error: "Producto no encontrado" });
    }
 
    console.log("✅ PUT OK — id:", id);
    res.json({ ok: true });
 
  } catch (err) {
    console.log("❌ PUT ERROR:", err.code, err.message);
    res.status(500).json({ error: err.message });
  }
});
 
// ─── DELETE ──────────────────────────────────────────────
// Soft delete: nunca borra físico para evitar errores de Foreign Key
router.delete("/:id", async (req, res) => {
  const { id } = req.params;
  console.log("📥 DELETE /productos/:id", id);
 
  try {
    const [result] = await db.query(
      "UPDATE productos SET activo = 0 WHERE id_producto = ? AND activo = 1",
      [id]
    );
 
    console.log("🔍 affectedRows:", result.affectedRows);
 
    if (result.affectedRows === 0) {
      console.log("⚠️ No encontrado o ya inactivo, id:", id);
      return res.status(404).json({ error: "Producto no encontrado" });
    }
 
    console.log("✅ DELETE OK — id:", id);
    res.json({ ok: true });
 
  } catch (err) {
    console.log("❌ DELETE ERROR:", err.code, err.message);
    res.status(500).json({ error: err.message });
  }
});
 
module.exports = router;
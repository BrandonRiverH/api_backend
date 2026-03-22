const express = require("express");
const router = express.Router();
const db = require("../db");

// 🔥 GET PRODUCTOS
router.get("/", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM productos");
    res.json(rows);
  } catch (err) {
    console.log("❌ ERROR GET:", err);
    res.json([]);
  }
});

// 🔥 POST PRODUCTO
router.post("/", async (req, res) => {
  try {
    console.log("BODY:", req.body);

    if (!req.body) {
      return res.status(400).json({ error: "No hay datos" });
    }

    const {
      nombre,
      precio,
      stock,
      fecha_caducidad,
      imagen,
      descripcion,
    } = req.body;

    if (!nombre || !precio) {
      return res.status(400).json({ error: "Faltan datos" });
    }

    const [result] = await db.query(
      `INSERT INTO productos 
      (nombre, precio_venta, stock, fecha_caducidad, imagen, descripcion)
      VALUES (?, ?, ?, ?, ?, ?)`,
      [
        nombre,
        precio,
        stock || 0,
        fecha_caducidad || null,
        imagen || "",
        descripcion || "",
      ]
    );

    res.json({ ok: true, id: result.insertId });
  } catch (err) {
    console.log("❌ ERROR INSERT:", err.message);
    res.status(500).json({ error: "Error agregando producto" });
  }
});

// 🔥 DELETE PRODUCTO
router.delete("/:id", async (req, res) => {
  try {
    const { id } = req.params;

    await db.query("DELETE FROM productos WHERE id_producto = ?", [id]);

    res.json({ ok: true });
  } catch (err) {
    console.log("❌ ERROR DELETE:", err);
    res.status(500).json({ error: "Error eliminando producto" });
  }
});

module.exports = router;
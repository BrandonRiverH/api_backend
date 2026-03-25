const express = require("express");
const router = express.Router();
const db = require("../db");

// 🔥 GET TODOS
router.get("/", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM proveedores");
    res.json(rows);
  } catch (err) {
    console.log("❌ ERROR GET PROVEEDORES:", err);
    res.status(500).json({ error: "Error obteniendo proveedores" });
  }
});

// 🔥 POST CREAR
router.post("/", async (req, res) => {
  try {
    const {
      nombre,
      direccion,
      telefono,
      correo,
      nombre_contacto,
      fecha_ingreso,
      activo,
    } = req.body;

    if (!nombre) {
      return res.status(400).json({ error: "Nombre requerido" });
    }

    const [result] = await db.query(
      `INSERT INTO proveedores 
      (nombre, direccion, telefono, correo, nombre_contacto, fecha_ingreso, activo)
      VALUES (?, ?, ?, ?, ?, ?, ?)`,
      [
        nombre,
        direccion || "",
        telefono || "",
        correo || "",
        nombre_contacto || "",
        fecha_ingreso || null,
        activo ?? 1,
      ]
    );

    res.json({ ok: true, id: result.insertId });
  } catch (err) {
    console.log("❌ ERROR INSERT PROVEEDOR:", err);
    res.status(500).json({ error: "Error creando proveedor" });
  }
});

// 🔥 PUT EDITAR
router.put("/:id", async (req, res) => {
  try {
    const { id } = req.params;

    const {
      nombre,
      direccion,
      telefono,
      correo,
      nombre_contacto,
      fecha_ingreso,
      activo,
    } = req.body;

    await db.query(
      `UPDATE proveedores SET
        nombre=?,
        direccion=?,
        telefono=?,
        correo=?,
        nombre_contacto=?,
        fecha_ingreso=?,
        activo=?
      WHERE id_proveedor=?`,
      [
        nombre,
        direccion,
        telefono,
        correo,
        nombre_contacto,
        fecha_ingreso,
        activo,
        id,
      ]
    );

    res.json({ ok: true });
  } catch (err) {
    console.log("❌ ERROR UPDATE:", err);
    res.status(500).json({ error: "Error actualizando proveedor" });
  }
});

// 🔥 DELETE
router.delete("/:id", async (req, res) => {
  try {
    const { id } = req.params;

    await db.query("DELETE FROM proveedores WHERE id_proveedor = ?", [id]);

    res.json({ ok: true });
  } catch (err) {
    console.log("❌ ERROR DELETE:", err);
    res.status(500).json({ error: "Error eliminando proveedor" });
  }
});

module.exports = router;
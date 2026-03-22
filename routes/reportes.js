// routes/reportes.js

const express = require("express");
const router = express.Router();
const db = require("../db"); // tu conexión a MariaDB

// 🟢 1. Ventas totales
router.get("/ventas-totales", async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT 
        COUNT(*) AS total_ventas,
        SUM(total) AS dinero_total
      FROM ventas
    `);

    res.json(rows[0]);
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Error en ventas totales" });
  }
});

// 🟢 2. Ventas por día
router.get("/ventas-por-dia", async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT 
        fecha,
        COUNT(*) AS ventas,
        SUM(total) AS total_dia
      FROM ventas
      GROUP BY fecha
      ORDER BY fecha DESC
    `);

    res.json(rows);
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Error en ventas por día" });
  }
});

// 🟢 3. Productos más vendidos
router.get("/productos-mas-vendidos", async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT 
        vd.id_producto,
        p.nombre,
        SUM(vd.cantidad) AS total_vendido
      FROM venta_detalles vd
      JOIN productos p ON p.id_producto = vd.id_producto
      GROUP BY vd.id_producto
      ORDER BY total_vendido DESC
      LIMIT 10
    `);

    res.json(rows);
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Error en productos más vendidos" });
  }
});

// 🟢 4. Ventas por rango de fechas
router.get("/ventas-rango", async (req, res) => {
  const { inicio, fin } = req.query;

  try {
    const [rows] = await db.query(
      `
      SELECT 
        *
      FROM ventas
      WHERE fecha BETWEEN ? AND ?
      ORDER BY fecha DESC
    `,
      [inicio, fin]
    );

    res.json(rows);
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Error en ventas por rango" });
  }
});

// 🟢 5. Producto que más dinero genera 💰
router.get("/productos-mas-dinero", async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT 
        vd.id_producto,
        p.nombre,
        SUM(vd.subtotal) AS dinero_generado
      FROM venta_detalles vd
      JOIN productos p ON p.id_producto = vd.id_producto
      GROUP BY vd.id_producto
      ORDER BY dinero_generado DESC
      LIMIT 10
    `);

    res.json(rows);
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Error en productos por dinero" });
  }
});

module.exports = router;
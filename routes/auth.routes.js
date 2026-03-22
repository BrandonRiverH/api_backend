const express = require("express");
const router = express.Router();
const db = require("../db");

router.post("/login", async (req, res) => {
  const ip = req.ip || req.headers["x-forwarded-for"] || req.connection.remoteAddress;
  const now = new Date().toISOString();
  console.log(`${now} 🔹 Request recibido en /login - IP: ${ip}`);
  console.log("Headers:", req.headers);
  console.log("Body:", req.body);

  const { usuario, password } = req.body || {};

  if (!usuario || !password) {
    console.log(`${now} ⚠️ Petición inválida /login`);
    return res.status(400).json({ message: "Faltan credenciales" });
  }

  try {
    const sql = `
      SELECT id_usuario, nombre, clave_usuario, id_rol
      FROM usuarios
      WHERE clave_usuario = ? AND contrasena = ?
    `;

    console.log(`${now} Ejecutando SQL:`, sql.trim());
    console.log("Parámetros:", [usuario, password]);

    const [results] = await db.query(sql, [usuario, password]); // db es promise-pool

    console.log(`${now} Resultados SQL:`, results.length);

    if (results.length === 0) {
      console.log(`${now} ⚠️ Usuario no encontrado`);
      return res.status(401).json({ message: "Usuario o contraseña incorrectos" });
    }

    console.log(`${now} ✅ Login exitoso para:`, usuario);
    res.json({ message: "Login exitoso", user: results[0] });

  } catch (err) {
    console.log(`${now} ❌ MYSQL ERROR:`, err);
    res.status(500).json({ message: "Error en el servidor", error: err });
  }
});

module.exports = router;
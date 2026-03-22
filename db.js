// backend/db.js
const mysql = require("mysql2/promise");

console.log("Inicializando conexión a MariaDB (service 'db')...");

const pool = mysql.createPool({
  host: "db",
  user: "root",
  password: "root",
  database: "farmacia_app",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

async function testConnection() {
  try {
    const conn = await pool.getConnection();
    console.log("✅ Pool MySQL listo");
    conn.release();
  } catch (err) {
    console.log("❌ Error conectando a MySQL:", err);
  }
}

testConnection();

module.exports = pool;
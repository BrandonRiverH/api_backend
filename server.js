const express = require("express");
const cors = require("cors");

const app = express();

// 🔥 IMPORTAR RUTAS
const reportesRoutes = require("./routes/reportes");
const ventasRoutes = require("./routes/ventas");
const productosRoutes = require("./routes/productos");
const authRoutes = require("./routes/auth.routes");

// 🔥 MIDDLEWARES
app.use(cors());
app.use(express.json());

// 🔥 RUTAS BIEN SEPARADAS
app.use("/api/reportes", reportesRoutes);
app.use("/api/ventas", ventasRoutes);
app.use("/api/auth", authRoutes);
app.use("/api/productos", productosRoutes);

// 🔥 TEST
app.get("/", (req, res) => {
  res.json({ message: "🚀 API Farmacia funcionando" });
});

// 🔥 SERVER
app.listen(3000, () => {
  console.log("🔥 Servidor corriendo en http://localhost:3000");
});
const express = require("express");
const cors = require("cors");

const app = express();

const reportesRoutes = require("./routes/reportes");
const proveedoresRoutes = require("./routes/proveedores");
const ventasRoutes = require("./routes/ventas");
const productosRoutes = require("./routes/productos");
const authRoutes = require("./routes/auth.routes");

// 🔥 LOG GLOBAL
app.use((req, res, next) => {
  console.log(`🌐 ${req.method} ${req.url}`);
  next();
});

app.use(cors());
app.use(express.json({ limit: "25mb" }));
app.use(express.urlencoded({ extended: true, limit: "25mb" }));

app.use("/api/reportes", reportesRoutes);
app.use("/api/ventas", ventasRoutes);
app.use("/api/auth", authRoutes);
app.use("/api/productos", productosRoutes);
app.use("/api/proveedores", proveedoresRoutes);

app.get("/", (req, res) => {
  res.json({ message: "🚀 API Farmacia funcionando" });
});

app.listen(3000, () => {
  console.log("🔥 Servidor corriendo en http://localhost:3000");
});
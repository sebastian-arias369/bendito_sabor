console.log("Iniciando el servidor...");
require('dotenv').config();
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();

// Middleware para permitir peticiones desde Flutter
app.use(cors());
app.use(express.json()); // Permite recibir JSON en las peticiones

// Configuración de la conexión a MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root', 
    database: 'bendito_sabor'
});

// Conectar a MySQL
db.connect(err => {
    if (err) {
        console.error('❌ Error conectando a MySQL:', err);
        return;
    }
    console.log('✅ Conectado a MySQL');
});

// Ruta para obtener todos los usuarios
app.get('/usuarios', (req, res) => {
    const sql = 'SELECT * FROM usuarios';
    db.query(sql, (err, results) => {
        if (err) {
            console.error('❌ Error al obtener los usuarios:', err);
            res.status(500).json({ mensaje: 'Error al obtener los usuarios' });
            return;
        }
        res.json(results);
    });
});

// Ruta para registrar un usuario
app.post('/usuarios', (req, res) => {
    const { nombre, correo, usuario, contrasena, telefono, direccion } = req.body;

    if (!nombre || !correo || !usuario || !contrasena || !telefono || !direccion) {
        return res.status(400).json({ mensaje: 'Faltan campos requeridos' });
    }

    const sql = 'INSERT INTO usuarios (nombre, correo, usuario, contrasena, telefono, direccion) VALUES (?, ?, ?, ?, ?, ?)';
    
    db.query(sql, [nombre, correo, usuario, contrasena, telefono, direccion], (err, result) => {
        if (err) {
            console.error(' Error al registrar al  usuario:', err);
            res.status(500).json({ mensaje: 'Error al registrar el usuario' });
            return;
        }
        res.status(201).json({ mensaje: 'Usuario registrado exitosamente' });
    });
});

// Iniciar el servidor en el puerto 3000
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
});

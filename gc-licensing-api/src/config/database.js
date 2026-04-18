// src/config/database.js
const mongoose = require('mongoose');

const connectDB = async () => {
  try {
    await mongoose.connect(process.env.MONGO_URI);
    console.log(' MongoDB Atlas conectado com sucesso!');
  } catch (err) {
    console.error(' Erro ao conectar no MongoDB:', err);
    process.exit(1);
  }
};

module.exports = connectDB;
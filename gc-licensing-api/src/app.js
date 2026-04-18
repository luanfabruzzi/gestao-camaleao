const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');
const dotenv = require('dotenv');
const connectDB = require('./config/database');

dotenv.config();

const app = express();

// Middlewares
app.use(helmet());
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

// Conexão com MongoDB
connectDB();

// Rotas (vamos criar agora)
app.use('/api/licenses', require('./routes/licenseRoutes'));

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(` MongoDB rodando com sucesso na porta ${PORT}`);
});
// Enviroment variables
require('dotenv').config();

// Third-party modules
const express = require('express');
const cors = require('cors');

// Local modules
const router = require('./controller/routes/router');

// App initialization
const app = express();
const port = process.env.PORT || 3000;

// Middlewares
app.use(cors());                   // Enable CORS
app.use(express.json());           // Body parser
app.use(express.static('public')); // Public folder
app.use(router);                   // Routes

// Start server
app.listen(port, () => {
    console.log('Server running on port ' + port);
});
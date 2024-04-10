// app.js

const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const routes = require('./routes/routes');
const cors = require("cors");
const mssql = require("mssql/msnodesqlv8"); // Import MSSQL library
const dbConfig = require('./config/dbConfig'); // Import database configuration

const app = express();

// Middleware
app.use(bodyParser.json());
app.use(morgan('dev'));
app.use(cors());

// Routes
app.use('/api', routes);

// Database connection check
async function checkDBConnection() {
    try {
        await mssql.connect(dbConfig);
        console.log('Database connection successful');
    } catch (error) {
        console.error('Database connection error:', error);
        process.exit(1); // Exit the application if database connection fails
    }
}

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
    checkDBConnection();
});

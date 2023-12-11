const mysql = require('mysql');
const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: 'mysecret',
    database: 'mydatabase',
    port: 3306
});

exports.pool = pool;